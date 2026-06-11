import 'package:accounting/models/index.dart';
import 'package:accounting/pref/pref.dart';
import 'package:accounting/repository/SetupRepository.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../../network/network.dart';
import '../neraca/neraca_berjalan_notiifer.dart' show NeracaFlatItem, NeracaGroup;

class LabaRugiBerjalanNotifier extends ChangeNotifier {
  final BuildContext context;

  LabaRugiBerjalanNotifier({required this.context}) {
    _init();
  }

  bool isLoading = true;
  String? errorMessage;

  bool konsolidasi = false;
  UserModel? users;

  List<KantorModel> listKantor = [];
  KantorModel? kantorModel;
  KantorModel? indukModel;

  double totalBiaya = 0;
  double totalPendapatan = 0;
  List<NeracaGroup> groupsBiaya = [];
  List<NeracaGroup> groupsPendapatan = [];

  void toggleKonsolidasi(bool value) {
    konsolidasi = value;

    if (konsolidasi) {
      kantorModel = null;
      indukModel = null;
    } else {
      if (listKantor.isNotEmpty && users != null) {
        kantorModel = listKantor.where((e) => e.kodeKantor == users!.kodeKantor).isNotEmpty
            ? listKantor.where((e) => e.kodeKantor == users!.kodeKantor).first
            : listKantor.first;

        indukModel = listKantor.where((e) => e.kodeKantor == users!.kodeInduk).isNotEmpty
            ? listKantor.where((e) => e.kodeKantor == users!.kodeInduk).first
            : kantorModel;
      }
    }

    notifyListeners();
  }

  Future<void> getKantor() async {
    if (users == null) return;

    listKantor.clear();
    notifyListeners();

    final body = {
      "kode_pt": users!.kodePt,
    };

    final response = await Setuprepository.getKantor(
      token,
      NetworkURL.getKantor(),
      jsonEncode(body),
    );

    final status = response['status']?.toString().toLowerCase() ?? '';

    if (status == "success" || status == "sukses") {
      for (Map<String, dynamic> item in response['data']) {
        listKantor.add(KantorModel.fromJson(item));
      }

      if (listKantor.isNotEmpty) {
        kantorModel = listKantor.where((e) => e.kodeKantor == users!.kodeKantor).isNotEmpty
            ? listKantor.where((e) => e.kodeKantor == users!.kodeKantor).first
            : listKantor.first;

        indukModel = listKantor.where((e) => e.kodeKantor == users!.kodeInduk).isNotEmpty
            ? listKantor.where((e) => e.kodeKantor == users!.kodeInduk).first
            : kantorModel;
      }
    }

    notifyListeners();
  }

  void pilihKantor(KantorModel? value) {
    kantorModel = value;
    notifyListeners();
  }

  void pilihInduk(KantorModel? value) {
    indukModel = value;
    notifyListeners();
  }

  Future<void> _init() async {
    users = await Pref().getUsers();
    await getKantor();
    await _fetchData(users!);
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
          "kode_kantor": konsolidasi ? "" : (kantorModel?.kodeKantor ?? users.kodeKantor),
          "kode_induk": konsolidasi ? "" : (indukModel?.kodeKantor ?? users.kodeInduk),
          "userinput": users.namauser,
          "modul": "labarugi",
          "konsolidasi": konsolidasi,
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
    users ??= await Pref().getUsers();
    await _fetchData(users!);
  }
}
