import 'package:accounting/models/index.dart';
import 'package:accounting/pref/pref.dart';
import 'package:accounting/repository/SetupRepository.dart';
import 'package:flutter/material.dart';

import '../../network/network.dart';
import '../neraca/neraca_berjalan_notiifer.dart' show NeracaFlatItem, NeracaGroup;

class LabaRugiBerjalanNotifier extends ChangeNotifier {
  final BuildContext context;

  LabaRugiBerjalanNotifier({required this.context}) {
    _init();
  }

  bool isLoading = true;
  String? errorMessage;
  double totalBiaya = 0;
  double totalPendapatan = 0;
  List<NeracaGroup> groupsBiaya = [];
  List<NeracaGroup> groupsPendapatan = [];

  Future<void> _init() async {
    final users = await Pref().getUsers();
    _fetchData(users);
  }

  Future<void> _fetchData(UserModel users) async {
    isLoading = true;
    errorMessage = null;
    groupsBiaya.clear();
    groupsPendapatan.clear();
    totalBiaya = 0;
    totalPendapatan = 0;
    notifyListeners();

    try {
      final value = await Setuprepository.fetch(
        NetworkURL.labaRugiBerjalan(),
        {
          "kode_pt": users.kodePt,
          "kode_kantor": users.kodeKantor,
          "kode_induk": users.kodeInduk,
          "userinput": users.namauser,
          "modul": "labarugi",
          "userterm": users.terminalId,
        },
      );

      if (value['status']?.toString().toLowerCase().contains("success") == true) {
        final rawList = value['data'] as List;
        final biaya = <String, List<NeracaFlatItem>>{};
        final pendapatan = <String, List<NeracaFlatItem>>{};

        for (final raw in rawList) {
          final item = NeracaFlatItem.fromJson(raw as Map<String, dynamic>);
          final golongan = (raw['golongan'] ?? raw['gol_acc'] ?? '').toString();
          // golongan 3 = PENDAPATAN, golongan 4 = BIAYA
          if (golongan == '4') {
            biaya.putIfAbsent(item.nobb, () => []).add(item);
          } else if (golongan == '3') {
            pendapatan.putIfAbsent(item.nobb, () => []).add(item);
          }
        }

        groupsBiaya = biaya.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
        groupsPendapatan = pendapatan.entries.map((e) => NeracaGroup(nobb: e.key, items: e.value)).toList();
        totalBiaya = groupsBiaya.fold(0, (s, g) => s + g.total);
        totalPendapatan = groupsPendapatan.fold(0, (s, g) => s + g.total);
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
    _fetchData(users);
  }
}
