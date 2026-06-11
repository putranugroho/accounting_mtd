import 'dart:convert';

import 'package:accounting/models/index.dart';
import 'package:accounting/network/network.dart';
import 'package:accounting/pref/pref.dart';
import 'package:accounting/repository/SetupRepository.dart';
import 'package:accounting/utils/format_currency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JurnalNotifier extends ChangeNotifier {
  final BuildContext context;

  JurnalNotifier({required this.context}) {
    getProfile();
  }

  UserModel? users;

  bool isLoadingData = true;
  bool dialog = false;

  TextEditingController noCoa = TextEditingController();
  TextEditingController tglawal = TextEditingController();
  TextEditingController tglakhir = TextEditingController();

  TextEditingController tglTransaksi = TextEditingController();
  TextEditingController tglValuta = TextEditingController();
  TextEditingController noDok = TextEditingController();
  TextEditingController noRef = TextEditingController();
  TextEditingController namasbbdebet = TextEditingController();
  TextEditingController nosbbdebet = TextEditingController();
  TextEditingController namasbbkredit = TextEditingController();
  TextEditingController nosbbkredit = TextEditingController();
  TextEditingController nominal = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  DateTime? tglTransAwal = DateTime.now();
  DateTime? tglTransAkhir = DateTime.now();

  List<TransaksiModel> listData = [];
  List<TransaksiModel> listDataFiltered = [];

  TransaksiModel? transaksiModel;

  Future<void> getProfile() async {
    Pref().getUsers().then((value) {
      users = value;

      tglTransAwal = DateTime.now();
      tglTransAkhir = DateTime.now();

      tglawal.text = DateFormat("dd-MMM-yyyy").format(tglTransAwal!);
      tglakhir.text = DateFormat("dd-MMM-yyyy").format(tglTransAkhir!);

      getJurnal();

      notifyListeners();
    });
  }

  DateTime _safeParseDate(String value) {
    try {
      final cleanValue = value.trim();

      if (cleanValue.isEmpty || cleanValue.toLowerCase() == "null") {
        return DateTime(1900);
      }

      return DateTime.parse(cleanValue);
    } catch (_) {
      try {
        return DateFormat("dd-MMM-yyyy").parse(value.trim());
      } catch (_) {
        return DateTime(1900);
      }
    }
  }

  int _safeParseNoDok(String value) {
    final cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanValue.isEmpty) return 0;

    return int.tryParse(cleanValue) ?? 0;
  }

  bool _matchCoa(TransaksiModel data) {
    final keyword = noCoa.text.trim();

    if (keyword.isEmpty) return true;

    return data.debetAcc.trim().contains(keyword) || data.creditAcc.trim().contains(keyword);
  }

  bool _matchTanggal(TransaksiModel data) {
    final tgl = _safeParseDate(data.tglTrans);

    return tgl.isAfter(tglTransAwal!.subtract(const Duration(days: 1))) && tgl.isBefore(tglTransAkhir!.add(const Duration(days: 1)));
  }

  int _sortByTglTransAndNoDok(
    TransaksiModel a,
    TransaksiModel b,
  ) {
    final dateA = _safeParseDate(a.tglTrans);
    final dateB = _safeParseDate(b.tglTrans);

    final compareDate = dateB.compareTo(dateA);
    if (compareDate != 0) return compareDate;

    final noDokA = _safeParseNoDok(a.nomorDok);
    final noDokB = _safeParseNoDok(b.nomorDok);

    final compareNoDok = noDokB.compareTo(noDokA);
    if (compareNoDok != 0) return compareNoDok;

    return b.nomorDok.compareTo(a.nomorDok);
  }

  Future<void> tanggalTransaksiAwal() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: tglTransAwal ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate == null) return;

    tglTransAwal = pickedDate;
    tglawal.text = DateFormat("dd-MMM-yyyy").format(pickedDate);
    notifyListeners();
  }

  Future<void> tanggalTransaksiAkhir() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: tglTransAkhir ?? DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate == null) return;

    tglTransAkhir = pickedDate;
    tglakhir.text = DateFormat("dd-MMM-yyyy").format(pickedDate);
    notifyListeners();
  }

  Future<void> getJurnal() async {
    if (users == null) return;

    isLoadingData = true;
    listData.clear();
    listDataFiltered.clear();
    notifyListeners();

    final data = {
      "filter": {
        "general": {
          "batch": null,
          "userinput": "",
          "userotor": "",
          "otorrev": "",
          "chguser": "",
          "status_transaksi": "all",
          "kode_pt": users!.kodePt,
          "kode_kantor": users!.kodeKantor,
          "kode_induk": users!.kodeInduk,
          "rrn": null,
          "no_dokumen": null,
          "no_reff": null,
          "flag_trn": "0",
          "acquirer": ""
        },
        "range_tanggal": {
          "from": DateFormat('yyyy-MM-dd').format(tglTransAwal!),
          "to": DateFormat('yyyy-MM-dd').format(tglTransAkhir!),
        },
        "range_tanggal_valuta": {
          "from": "",
          "to": "",
        },
        "akun": {
          "dracc": null,
          "cracc": null,
        },
        "range_nominal": {
          "min": null,
          "max": null,
        }
      },
      "pagination": {
        "page": 1,
      },
      "sort": {
        "by": "tgl_transaksi, no_dokumen",
        "order": "desc",
      }
    };

    try {
      final response = await Setuprepository.setup(
        token,
        NetworkURL.search(),
        jsonEncode(data),
      );

      if (response['code'] == "000") {
        for (Map<String, dynamic> i in response['data']) {
          listData.add(TransaksiModel.fromJson(i));
        }

        applyFilterLocal();
      } else {
        isLoadingData = false;
        notifyListeners();
      }
    } catch (e) {
      isLoadingData = false;

      if (kDebugMode) {
        print("GET JURNAL ERROR: $e");
      }

      notifyListeners();
    }
  }

  void applyFilterLocal() {
    listDataFiltered = listData.where((e) {
      return _matchTanggal(e) && _matchCoa(e);
    }).toList();

    listDataFiltered.sort(_sortByTglTransAndNoDok);

    isLoadingData = false;
    notifyListeners();
  }

  void pilihTransaksi(String rrn) {
    transaksiModel = listDataFiltered.where((e) => e.rrn == rrn).first;

    dialog = true;

    tglTransaksi.text = transaksiModel!.tglTrans;
    tglValuta.text = transaksiModel!.tglVal;
    noDok.text = transaksiModel!.nomorDok;
    noRef.text = transaksiModel!.nomorRef;

    nosbbdebet.text = transaksiModel!.debetAcc;
    namasbbdebet.text = transaksiModel!.namaDebet;

    nosbbkredit.text = transaksiModel!.creditAcc;
    namasbbkredit.text = transaksiModel!.namaCredit;

    nominal.text = FormatCurrency.oCcyDecimal.format(double.tryParse(transaksiModel!.nominal) ?? 0);
    keterangan.text = transaksiModel!.keterangan;

    notifyListeners();
  }

  void tutup() {
    dialog = false;
    notifyListeners();
  }

  double get totalDebet {
    return listDataFiltered.fold(0, (sum, item) {
      final keyword = noCoa.text.trim();

      if (keyword.isEmpty) {
        return sum + (double.tryParse(item.nominal) ?? 0);
      }

      if (item.debetAcc.trim().contains(keyword)) {
        return sum + (double.tryParse(item.nominal) ?? 0);
      }

      return sum;
    });
  }

  double get totalKredit {
    return listDataFiltered.fold(0, (sum, item) {
      final keyword = noCoa.text.trim();

      if (keyword.isEmpty) {
        return sum + (double.tryParse(item.nominal) ?? 0);
      }

      if (item.creditAcc.trim().contains(keyword)) {
        return sum + (double.tryParse(item.nominal) ?? 0);
      }

      return sum;
    });
  }
}
