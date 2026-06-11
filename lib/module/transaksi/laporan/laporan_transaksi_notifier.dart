import 'dart:convert';

import 'package:accounting/models/index.dart';
import 'package:accounting/network/network.dart';
import 'package:accounting/pref/pref.dart';
import 'package:accounting/repository/SetupRepository.dart';
import 'package:accounting/utils/format_currency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LaporanTransaksiNotifier extends ChangeNotifier {
  final BuildContext context;

  LaporanTransaksiNotifier({required this.context}) {
    getProfile();
  }

  List<UsersModel> listKaryawan = [];
  TextEditingController namaKaryawan = TextEditingController();
  TextEditingController nikKaryawan = TextEditingController();
  TextEditingController namaKantor = TextEditingController();
  UsersModel? karyawanModel;
  piliAkunKaryawan(UsersModel value) {
    karyawanModel = value;
    namaKaryawan.text = karyawanModel!.namauser;
    nikKaryawan.text = karyawanModel!.userid;

    notifyListeners();
  }

  Future<List<UsersModel>> getInquery(String query) async {
    if (query.isNotEmpty && query.length > 2) {
      listKaryawan.clear();
      notifyListeners();
      var data = {"namauser": query};
      try {
        final response = await Setuprepository.setup(
          token,
          NetworkURL.cariUsers(),
          jsonEncode(data),
        );

        for (Map<String, dynamic> i in response) {
          listKaryawan.add(UsersModel.fromJson(i));
        }
        notifyListeners();
      } catch (e) {
        if (kDebugMode) {
          print("Error: $e");
        }
      } finally {
        notifyListeners();
      }
    } else {
      listKaryawan.clear(); // clear on short query
    }

    return listKaryawan;
  }

  UserModel? users;
  getProfile() async {
    Pref().getUsers().then((value) {
      users = value;
      namaKaryawan.text = users!.namauser;
      tglawal.text = DateFormat("dd-MMM-yyyy").format(DateTime.now());
      tglakhir.text = DateFormat("dd-MMM-yyyy").format(DateTime.now());
      getTransaksi();
      notifyListeners();
    });
  }

  var isLoadingData = true;
  List<TransaksiPendModel> listTransaksi = [];
  List<TransaksiPendModel> listTransaksiAdd = [];
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

  int _compareTransaksiByDateAndNoDok(
    TransaksiPendModel a,
    TransaksiPendModel b,
  ) {
    // Sort utama:
    // 1. Tgl Trans terbaru
    // 2. No Dok terbesar
    final dateA = _safeParseDate(a.tglTransaksi);
    final dateB = _safeParseDate(b.tglTransaksi);

    final compareDate = dateB.compareTo(dateA);
    if (compareDate != 0) return compareDate;

    final noDokA = _safeParseNoDok(a.noDokumen);
    final noDokB = _safeParseNoDok(b.noDokumen);

    final compareNoDok = noDokB.compareTo(noDokA);
    if (compareNoDok != 0) return compareNoDok;

    return b.noDokumen.compareTo(a.noDokumen);
  }

  Future getTransaksi() async {
    isLoadingData = true;
    listTransaksi.clear();
    listTransaksiAdd.clear();
    notifyListeners();
    var data = {
      "kode_pt": users!.kodePt,
    };
    Setuprepository.setup(token, NetworkURL.view(), jsonEncode(data)).then((value) {
      if (value['status'].toString().toLowerCase().contains("success")) {
        for (Map<String, dynamic> i in value['data']) {
          listTransaksi.add(TransaksiPendModel.fromJson(i));
        }
        if (listTransaksi.isNotEmpty) {
          final filtered = listTransaksi.where((e) {
            final tgl = _safeParseDate(
              cariTglTrans ? e.tglTransaksi : e.tglValuta,
            );

            final inRange = tgl.isAfter(tglTransAwal!.subtract(const Duration(days: 1))) && tgl.isBefore(tglTransAkhir!.add(const Duration(days: 1)));

            final sameUser = e.userinput == users!.namauser;
            final isPending = e.status == "PENDING";

            if (cariTrans == "2") {
              return inRange && sameUser && isPending;
            }

            return false;
          }).toList();

          listTransaksiAdd.addAll(filtered);

          print("PENDING SOURCE : ${listTransaksi.length}");
          print("PENDING FILTERED: ${filtered.length}");
        }
        getTransaksiBackend();

        notifyListeners();
      } else {
        isLoadingData = false;
        notifyListeners();
      }
    });
  }

  TextEditingController namasbbdebet = TextEditingController();
  TextEditingController nosbbdebet = TextEditingController();
  TextEditingController namasbbkredit = TextEditingController();
  TextEditingController nosbbkredit = TextEditingController();
  TransaksiPendModel? transaksiPendModel;
  pilihtransaksi(String value) {
    transaksiPendModel = listTransaksiAdd.where((e) => e.rrn == value).first;
    dialog = true;
    noDok.text = transaksiPendModel!.noDokumen;
    tglValuta.text = transaksiPendModel!.tglValuta;
    tglTransaksi.text = transaksiPendModel!.createddate;
    noRef.text = transaksiPendModel!.noRef;
    nosbbdebet.text = transaksiPendModel!.dracc;
    nosbbkredit.text = transaksiPendModel!.cracc;
    namasbbdebet.text = transaksiPendModel!.namaDr;
    namasbbkredit.text = transaksiPendModel!.namaCr;
    keterangan.text = transaksiPendModel!.keterangan;
    nominal.text = FormatCurrency.oCcyDecimal.format(double.parse(transaksiPendModel!.nominal).toInt());
    notifyListeners();
  }

  String cariTrans = "all";
  pilihCariTransaksi(String value) {
    cariTrans = value;
    getTransaksi();
    notifyListeners();
  }

  bool cariTglTrans = true;
  pilihTglTransaksi(bool value) {
    cariTglTrans = value;
    getTransaksi();
    notifyListeners();
  }

  bool cariDok = false;
  gantiCariDok() {
    cariDok = !cariDok;
    notifyListeners();
  }

  DateTime? tglTransAwal = DateTime.now();
  DateTime? tglTransAkhir = DateTime.now();
  Future tanggalTransaksiAwal() async {
    var pickedendDate = (await showDatePicker(
      context: context,
      initialDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      firstDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())) - 10,
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      lastDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
    ));
    if (pickedendDate != null) {
      tglTransAwal = pickedendDate;
      tglawal.text = DateFormat("dd-MMM-yyyy").format(DateTime.parse(pickedendDate.toString()));
      notifyListeners();
    }
  }

  Future tanggalTransaksiAkhir() async {
    var pickedendDate = (await showDatePicker(
      context: context,
      initialDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      firstDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())) - 10,
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      lastDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
    ));
    if (pickedendDate != null) {
      tglTransAkhir = pickedendDate;
      tglakhir.text = DateFormat("dd-MMM-yyyy").format(DateTime.parse(pickedendDate.toString()));
      notifyListeners();
    }
  }

  DateTime? tglJual = DateTime.now();
  Future tanggalPenjualan() async {
    var pickedendDate = (await showDatePicker(
      context: context,
      initialDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
                DateTime.now(),
              )) -
              1),
      firstDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())) - 1,
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      lastDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())) + 1,
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
                DateTime.now(),
              )) -
              1),
    ));
    if (pickedendDate != null) {
      tglJual = pickedendDate;
      tglPenjualan.text = DateFormat("dd-MMM-yyyy").format(DateTime.parse(pickedendDate.toString()));
      notifyListeners();
    }
  }

  TextEditingController cariUser = TextEditingController();
  TextEditingController noRef = TextEditingController();
  TextEditingController noDok = TextEditingController();
  TextEditingController tglawal = TextEditingController();
  TextEditingController tglakhir = TextEditingController();
  TextEditingController tglTransaksi = TextEditingController();
  TextEditingController tglPenjualan = TextEditingController();
  TextEditingController nominal = TextEditingController();
  TextEditingController akunDebit = TextEditingController();
  TextEditingController akunKredit = TextEditingController();
  TextEditingController sbbDebit = TextEditingController();
  TextEditingController sbbKredit = TextEditingController();
  TextEditingController aoDebit = TextEditingController();
  TextEditingController aoKredit = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController tglValuta = TextEditingController();
  TextEditingController alasan = TextEditingController();

  var editData = false;
  final searchForm = GlobalKey<FormState>();
  final keyForm = GlobalKey<FormState>();
  final keyForm2 = GlobalKey<FormState>();

  List<TransaksiModel> listTransaksiBack = [];
  List<TransaksiPendModel> listTransAll = [];
  getTransaksiBackend() async {
    isLoadingData = true;
    listTransaksiBack.clear();
    listTransAll.clear();

    notifyListeners();
    var data = {
      "filter": {
        "general": {
          "batch": null,
          "userinput": "",
          "userotor": "",
          "otorrev": "",
          "chguser": "",
          "status_transaksi": "${cariTrans == "BACKDATE" ? "all" : cariTrans}",
          "kode_pt": "${users!.kodePt}",
          "kode_kantor": "${users!.kodeKantor}",
          "kode_induk": "${users!.kodeInduk}",
          "rrn": null,
          "no_dokumen": null,
          "no_reff": null,
          "flag_trn": "0",
          "acquirer": ""
          // "flag_trn": "0"
        },
        "range_tanggal": {
          "from": cariTglTrans ? DateFormat('yyyy-MM-dd').format(tglTransAwal!) : "",
          "to": cariTglTrans ? DateFormat('yyyy-MM-dd').format(tglTransAkhir!) : "",
        },
        "range_tanggal_valuta": {
          "from": !cariTglTrans ? DateFormat('yyyy-MM-dd').format(tglTransAwal!) : "",
          "to": !cariTglTrans ? DateFormat('yyyy-MM-dd').format(tglTransAkhir!) : "",
        },
        "akun": {"dracc": null, "cracc": null},
        "range_nominal": {"min": null, "max": null}
      },
      "pagination": {"page": 1},
      "sort": {"by": "tgl_transaksi, no_dokumen", "order": "desc"}
    };
    Setuprepository.setup(token, NetworkURL.search(), jsonEncode(data)).then((value) {
      if (value['code'] == "000") {
        for (Map<String, dynamic> i in value['data']) {
          listTransaksiBack.add(TransaksiModel.fromJson(i));
        }
        if (listTransaksiBack.isNotEmpty) {
          for (var i = 0; i < (listTransaksiBack.length); i++) {
            final data = listTransaksiBack[i];
            listTransaksiAdd.add(TransaksiPendModel(
                id: data.id,
                tglTransaksi: data.tglTrans,
                tglValuta: data.tglVal,
                batch: data.batch,
                trxType: "",
                trxCode: data.trxCode,
                otor: data.otor,
                kodeTrn: data.kodeTrans,
                dracc: data.debetAcc,
                namaDr: data.namaDebet,
                cracc: data.creditAcc,
                namaCr: data.namaCredit,
                rrn: data.rrn,
                noDokumen: data.nomorDok,
                modul: "",
                keteranganOtor: data.keterangan,
                alasan: data.alasan,
                noRef: data.nomorRef,
                nominal: data.nominal,
                keterangan: data.keterangan,
                kodePt: data.kodePt,
                kodeKantor: data.kodeKantor,
                kodeInduk: data.kodeInduk,
                stsValidasi: data.statusValidasi,
                kodeAoDr: data.kodeAoDebet,
                kodeColl: data.kodeColl,
                kodeAoCr: data.kodeAoCredit,
                userinput: data.inpuser,
                userterm: data.inpterm,
                inputtgljam: data.inptgljam,
                otoruser: data.autrevuser,
                otorterm: data.autrevterm,
                otortgljam: data.autrevtgljam,
                flagTrn: data.flagTrn,
                merchant: data.merchant,
                sourceTrx: data.sourceTrx,
                noKontrak: data.noKontrak,
                noInvoice: data.noInvoice,
                createddate: data.inptgljam,
                status: "${data.statusTransaksi == "1" ? "COMPLETED" : "CANCEL"}"));
          }
        }

        if (cariTrans == "1") {
          listTransAll = listTransaksiAdd.where((e) => e.status == "COMPLETED").toList();
        } else if (cariTrans == "BACKDATE") {
          listTransAll = listTransaksiAdd.where((e) => e.trxCode == "110").toList();
        } else if (cariTrans == "4") {
          listTransAll = listTransaksiAdd.where((e) => e.status == "CANCEL").toList();
        } else if (cariTrans == "2") {
          listTransAll = listTransaksiAdd.where((e) => e.status == "PENDING").toList();
          print(listTransaksiAdd.where((e) => e.status == "PENDING").toList());
        } else {
          listTransAll = listTransaksiAdd.toList();
        }

        listTransAll.sort(_compareTransaksiByDateAndNoDok);
        isLoadingData = false;
        notifyListeners();
      } else {
        isLoadingData = false;
        notifyListeners();
      }
    });
  }

  confirm() {
    if (keyForm.currentState!.validate()) {}
  }

  bool pilihSemuaMenu = false;

  void togglePilihSemua() {
    pilihSemuaMenu = !pilihSemuaMenu;
    notifyListeners();
  }

  bool dialog = false;
  tambah() {
    // clear();
    editData = false;
    dialog = true;
    notifyListeners();
  }

  tutup() {
    dialog = false;
    notifyListeners();
  }
}
