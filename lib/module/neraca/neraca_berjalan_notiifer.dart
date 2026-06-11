import 'package:accounting/models/index.dart';
import 'package:accounting/pref/pref.dart';
import 'package:accounting/repository/SetupRepository.dart';
import 'package:flutter/material.dart';

import '../../../network/network.dart';

class NeracaFlatItem {
  final String nobb;
  final String nosbb;
  final String namaSbb;
  final double saldo;

  NeracaFlatItem({
    required this.nobb,
    required this.nosbb,
    required this.namaSbb,
    required this.saldo,
  });

  factory NeracaFlatItem.fromJson(Map<String, dynamic> json) => NeracaFlatItem(
        nobb: json['nobb']?.toString() ?? '',
        nosbb: json['nosbb']?.toString() ?? '',
        namaSbb: json['namasbb']?.toString() ?? json['nama_sbb']?.toString() ?? '',
        saldo: _parseDouble(json['saldoakhir'] ?? json['saldo']),
      );

  static double _parseDouble(dynamic v) {
    if (v == null) return 0;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0;
  }
}

class NeracaGroup {
  final String nobb;
  final List<NeracaFlatItem> items;

  NeracaGroup({required this.nobb, required this.items});

  double get total => items.fold(0, (s, e) => s + e.saldo);
}

class NeracaBerjalanNotiifer extends ChangeNotifier {
  final BuildContext context;

  NeracaBerjalanNotiifer({required this.context}) {
    _init();
  }

  bool isLoading = true;
  String? errorMessage;
  double totalAktiva = 0;
  double totalPasiva = 0;
  List<NeracaGroup> groupsAktiva = [];
  List<NeracaGroup> groupsPasiva = [];

  Future<void> _init() async {
    final users = await Pref().getUsers();
    _fetchNeraca(users);
  }

  Future<void> _fetchNeraca(UserModel users) async {
    isLoading = true;
    errorMessage = null;
    groupsAktiva.clear();
    groupsPasiva.clear();
    totalAktiva = 0;
    totalPasiva = 0;
    notifyListeners();

    try {
      final value = await Setuprepository.fetch(
        NetworkURL.neracaBerjalanV2(),
        {
          "kode_pt": users.kodePt,
          "kode_kantor": users.kodeKantor,
          "kode_induk": users.kodeInduk,
          "userinput": users.namauser,
          "modul": "neraca",
          "userterm": users.terminalId,
        },
      );

      if (value['status']?.toString().toLowerCase().contains("success") == true) {
        final rawList = value['data'] as List;
        final aktiva = <String, List<NeracaFlatItem>>{};
        final pasiva = <String, List<NeracaFlatItem>>{};

        for (final raw in rawList) {
          final item = NeracaFlatItem.fromJson(raw as Map<String, dynamic>);
          final golongan = (raw['golongan'] ?? raw['gol_acc'] ?? '').toString();
          if (golongan == '1') {
            aktiva.putIfAbsent(item.nobb, () => []).add(item);
          } else if (golongan == '2') {
            pasiva.putIfAbsent(item.nobb, () => []).add(item);
          }
        }

        groupsAktiva = aktiva.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
        groupsPasiva = pasiva.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
        totalAktiva = groupsAktiva.fold(0, (s, g) => s + g.total);
        totalPasiva = groupsPasiva.fold(0, (s, g) => s + g.total);
      } else {
        errorMessage = value['message']?.toString() ?? 'Gagal memuat data';
      }
    } catch (e) {
      errorMessage = 'Terjadi kesalahan: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    final users = await Pref().getUsers();
    _fetchNeraca(users);
  }
}
