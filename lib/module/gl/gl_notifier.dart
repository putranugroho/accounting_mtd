import 'package:accounting/models/index.dart';
import 'package:accounting/pref/pref.dart';
import 'package:accounting/repository/SetupRepository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../network/network.dart';
import '../neraca/neraca_berjalan_notiifer.dart' show NeracaFlatItem, NeracaGroup;

class GlTransaksiItem {
  GlTransaksiItem({
    required this.tglTrans,
    required this.noDok,
    required this.noSbb,
    required this.namaSbb,
    required this.keterangan,
    required this.db,
    required this.cr,
  });

  final DateTime tglTrans;
  final String noDok;
  final String noSbb;
  final String namaSbb;
  final String keterangan;
  final double db;
  final double cr;

  factory GlTransaksiItem.fromJson(Map<String, dynamic> json) {
    return GlTransaksiItem(
      tglTrans: DateTime.tryParse(json['tgl_trans']?.toString() ?? '') ?? DateTime.now(),
      noDok: json['no_dok']?.toString() ?? '',
      noSbb: json['no_sbb']?.toString() ?? '',
      namaSbb: json['nama_sbb']?.toString() ?? json['namasbb']?.toString() ?? '',
      keterangan: json['keterangan']?.toString() ?? '',
      db: _parseDouble(json['db'] ?? json['mutasidebet']),
      cr: _parseDouble(json['cr'] ?? json['mutasicredit']),
    );
  }

  static double _parseDouble(dynamic v) {
    if (v == null) return 0;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0;
  }
}

class GlNotifier extends ChangeNotifier {
  final BuildContext context;

  GlNotifier({required this.context}) {
    tglAwal = DateTime(DateTime.now().year, DateTime.now().month, 1);
    tglAkhir = DateTime.now();
    tglAwalController.text = DateFormat("dd-MMM-yyyy").format(tglAwal);
    tglAkhirController.text = DateFormat("dd-MMM-yyyy").format(tglAkhir);
    _init();
  }

  bool isLoading = true;
  String? errorMessage;

  TextEditingController cariSbbCoa = TextEditingController();
  DateTime tglAwal = DateTime.now();
  DateTime tglAkhir = DateTime.now();
  TextEditingController tglAwalController = TextEditingController();
  TextEditingController tglAkhirController = TextEditingController();

  // Flat saldo data grouped by nobb
  List<NeracaGroup> groupsAktiva = [];
  List<NeracaGroup> groupsPasiva = [];
  List<NeracaGroup> groupsBiaya = [];
  List<NeracaGroup> groupsPendapatan = [];

  // Transaction data (if API returns it)
  List<GlTransaksiItem> listTransaksiGl = [];
  List<GlTransaksiItem> listTransaksiGlFiltered = [];

  // Legacy GlViewModel support (if API returns grouped structure)
  List<GlViewModel> list = [];

  Future<void> _init() async {
    final users = await Pref().getUsers();
    _fetchSaldoGl(users);
  }

  Future<void> _fetchSaldoGl(UserModel users) async {
    isLoading = true;
    errorMessage = null;
    list.clear();
    groupsAktiva.clear();
    groupsPasiva.clear();
    groupsBiaya.clear();
    groupsPendapatan.clear();
    listTransaksiGl.clear();
    listTransaksiGlFiltered.clear();
    notifyListeners();

    try {
      final value = await Setuprepository.fetch(
        NetworkURL.saldoGl(),
        {
          "kode_pt": users.kodePt,
          "kode_kantor": users.kodeKantor,
          "kode_induk": users.kodeInduk,
          "userinput": users.namauser,
          "modul": "gl",
          "userterm": users.terminalId,
          "tgl_awal": DateFormat("yyyy-MM-dd").format(tglAwal),
          "tgl_akhir": DateFormat("yyyy-MM-dd").format(tglAkhir),
        },
      );

      if (value['status']?.toString().toLowerCase().contains("success") == true) {
        final rawData = value['data'];
        if (rawData is List) {
          final aktiva = <String, List<NeracaFlatItem>>{};
          final pasiva = <String, List<NeracaFlatItem>>{};
          final biaya = <String, List<NeracaFlatItem>>{};
          final pendapatan = <String, List<NeracaFlatItem>>{};

          for (final raw in rawData) {
            if (raw is Map<String, dynamic>) {
              if (raw.containsKey('group')) {
                list.add(GlViewModel.fromJson(raw));
              } else if (raw.containsKey('tgl_trans') || raw.containsKey('no_dok')) {
                listTransaksiGl.add(GlTransaksiItem.fromJson(raw));
              } else {
                final item = NeracaFlatItem.fromJson(raw);
                final golongan = (raw['golongan'] ?? raw['gol_acc'] ?? '').toString();
                switch (golongan) {
                  case '1':
                    aktiva.putIfAbsent(item.nobb, () => []).add(item);
                    break;
                  case '2':
                    pasiva.putIfAbsent(item.nobb, () => []).add(item);
                    break;
                  case '3':
                    pendapatan.putIfAbsent(item.nobb, () => []).add(item);
                    break;
                  case '4':
                    biaya.putIfAbsent(item.nobb, () => []).add(item);
                    break;
                }
              }
            }
          }

          groupsAktiva = aktiva.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
          groupsPasiva = pasiva.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
          groupsBiaya = biaya.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
          groupsPendapatan = pendapatan.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
        }
        filterTransaksiGl();
      } else {
        errorMessage = value['message']?.toString() ?? 'Gagal memuat data GL';
      }
    } catch (e) {
      errorMessage = 'Terjadi kesalahan: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    final users = await Pref().getUsers();
    _fetchSaldoGl(users);
  }

  Future pilihTglAwal() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: tglAwal,
      firstDate: DateTime(1950),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      tglAwal = picked;
      tglAwalController.text = DateFormat("dd-MMM-yyyy").format(picked);
      filterTransaksiGl();
    }
  }

  Future pilihTglAkhir() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: tglAkhir,
      firstDate: DateTime(1950),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      tglAkhir = picked;
      tglAkhirController.text = DateFormat("dd-MMM-yyyy").format(picked);
      filterTransaksiGl();
    }
  }

  void filterTransaksiGl() {
    final keyword = cariSbbCoa.text.trim().toLowerCase();

    listTransaksiGlFiltered = listTransaksiGl.where((e) {
      final matchKeyword = keyword.isEmpty ||
          e.noSbb.toLowerCase().contains(keyword) ||
          e.namaSbb.toLowerCase().contains(keyword);
      final matchDate = e.tglTrans.isAfter(tglAwal.subtract(const Duration(days: 1))) &&
          e.tglTrans.isBefore(tglAkhir.add(const Duration(days: 1)));
      return matchKeyword && matchDate;
    }).toList();

    listTransaksiGlFiltered.sort((a, b) {
      final d = b.tglTrans.compareTo(a.tglTrans);
      return d != 0 ? d : b.noDok.compareTo(a.noDok);
    });

    notifyListeners();
  }

  double get totalDb => listTransaksiGlFiltered.fold(0, (s, e) => s + e.db);
  double get totalCr => listTransaksiGlFiltered.fold(0, (s, e) => s + e.cr);

  bool get hasAnyGroup =>
      groupsAktiva.isNotEmpty || groupsPasiva.isNotEmpty || groupsBiaya.isNotEmpty || groupsPendapatan.isNotEmpty || list.isNotEmpty;
}
