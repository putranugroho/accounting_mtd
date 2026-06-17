import 'package:accounting/module/gl/gl_notifier.dart';
import 'package:accounting/module/neraca/neraca_berjalan_notiifer.dart' show NeracaGroup;
import 'package:accounting/utils/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:accounting/models/index.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/images_path.dart';

class GlPage extends StatelessWidget {
  const GlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GlNotifier(context: context),
      child: Consumer<GlNotifier>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header & Filter
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text("GL / COA", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: 260,
                          //   child: TextFormField(
                          //     controller: value.cariSbbCoa,
                          //     onChanged: (_) => value.filterTransaksiGl(),
                          //     decoration: InputDecoration(
                          //       labelText: "No SBB / COA",
                          //       hintText: "Cari No SBB / nama COA",
                          //       prefixIcon: const Icon(Icons.search),
                          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(width: 16),
                          // SizedBox(
                          //   width: 170,
                          //   child: TextFormField(
                          //     controller: value.tglAwalController,
                          //     readOnly: true,
                          //     onTap: () => value.pilihTglAwal(),
                          //     decoration: InputDecoration(
                          //       labelText: "Tanggal Awal",
                          //       suffixIcon: const Icon(Icons.calendar_month),
                          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(width: 12),
                          // const Text("s/d"),
                          // const SizedBox(width: 12),
                          // SizedBox(
                          //   width: 170,
                          //   child: TextFormField(
                          //     controller: value.tglAkhirController,
                          //     readOnly: true,
                          //     onTap: () => value.pilihTglAkhir(),
                          //     decoration: InputDecoration(
                          //       labelText: "Tanggal Akhir",
                          //       suffixIcon: const Icon(Icons.calendar_month),
                          //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          //     ),
                          //   ),
                          // ),
                          Row(
                            children: [
                              Checkbox(
                                value: value.konsolidasi,
                                activeColor: colorPrimary,
                                onChanged: value.isLoading ? null : (e) => value.toggleKonsolidasi(e ?? false),
                              ),
                              const Text(
                                "Konsolidasi",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 220,
                            child: DropdownButtonFormField<KantorModel>(
                              value: value.kantorModel,
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: "Kantor",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: value.listKantor.map((e) {
                                return DropdownMenuItem<KantorModel>(
                                  value: e,
                                  child: Text(
                                    "${e.kodeKantor} - ${e.namaKantor}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: value.konsolidasi || value.isLoading ? null : value.pilihKantor,
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 220,
                            child: DropdownButtonFormField<KantorModel>(
                              value: value.indukModel,
                              isExpanded: true,
                              decoration: InputDecoration(
                                labelText: "Induk",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              items: value.listKantor.map((e) {
                                return DropdownMenuItem<KantorModel>(
                                  value: e,
                                  child: Text(
                                    "${e.kodeKantor} - ${e.namaKantor}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: value.konsolidasi || value.isLoading ? null : value.pilihInduk,
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: value.isLoading ? null : value.refresh,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorPrimary,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text("Tampilkan", style: TextStyle(color: Colors.white)),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: colorPrimary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(ImageAssets.excel, height: 15),
                                const SizedBox(width: 8),
                                const Text(
                                  "Download to Excel",
                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (value.isLoading)
                  const Expanded(child: Center(child: CircularProgressIndicator()))
                else if (value.errorMessage != null)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error_outline, size: 48, color: Colors.red),
                          const SizedBox(height: 12),
                          Text(value.errorMessage!, textAlign: TextAlign.center),
                          const SizedBox(height: 12),
                          ElevatedButton(onPressed: value.refresh, child: const Text("Coba Lagi")),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView(
                      children: [
                        // Transaksi section (only if data available)
                        if (value.selectedNoSbb.isNotEmpty) _buildTransaksiCard(value),

                        // Saldo sections by golongan
                        if (value.groupsAktiva.isNotEmpty) _buildSaldoSection(context, "AKTIVA", value.groupsAktiva, value.cariSbbCoa.text),
                        if (value.groupsPasiva.isNotEmpty) _buildSaldoSection(context, "PASIVA", value.groupsPasiva, value.cariSbbCoa.text),
                        if (value.groupsPendapatan.isNotEmpty)
                          _buildSaldoSection(context, "PENDAPATAN", value.groupsPendapatan, value.cariSbbCoa.text),
                        if (value.groupsBiaya.isNotEmpty) _buildSaldoSection(context, "BIAYA", value.groupsBiaya, value.cariSbbCoa.text),

                        // Legacy GlViewModel support
                        ...value.list.map((ac) => _buildLegacyGroup(ac)),

                        if (!value.hasAnyGroup && value.listTransaksiGl.isEmpty)
                          const Padding(
                            padding: EdgeInsets.all(40),
                            child: Center(child: Text("Tidak ada data.")),
                          ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransaksiCard(GlNotifier value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  value.selectedNoSbb.isEmpty
                      ? "Transaksi SBB / COA Terkait"
                      : "Detail Jurnal ${value.selectedNoSbb} - ${value.selectedNamaSbb} | 7 hari Terakhir",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: value.closeDetailJurnal,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            color: colorPrimary,
            child: const Row(
              children: [
                SizedBox(width: 110, child: Text("Tgl Trans", style: TextStyle(color: Colors.white, fontSize: 12))),
                SizedBox(width: 120, child: Text("No Dok", style: TextStyle(color: Colors.white, fontSize: 12))),
                SizedBox(width: 120, child: Text("No SBB/COA", style: TextStyle(color: Colors.white, fontSize: 12))),
                Expanded(child: Text("Keterangan", style: TextStyle(color: Colors.white, fontSize: 12))),
                SizedBox(width: 120, child: Text("Db", textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 12))),
                SizedBox(width: 120, child: Text("Cr", textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 12))),
              ],
            ),
          ),
          value.isLoadingDetailJurnal
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(child: CircularProgressIndicator()),
                )
              : value.listTransaksiGlFiltered.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Tidak ada transaksi jurnal untuk No SBB ini dalam 7 hari terakhir.",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  : Column(
                      children: value.listTransaksiGlFiltered.map((e) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                          child: Row(
                            children: [
                              SizedBox(width: 110, child: Text(DateFormat("yyyy-MM-dd").format(e.tglTrans), style: const TextStyle(fontSize: 12))),
                              SizedBox(width: 120, child: Text(e.noDok, style: const TextStyle(fontSize: 12))),
                              SizedBox(width: 120, child: Text(e.noSbb, style: const TextStyle(fontSize: 12))),
                              Expanded(child: Text("${e.namaSbb} - ${e.keterangan}", style: const TextStyle(fontSize: 12))),
                              SizedBox(
                                width: 120,
                                child: Text(FormatCurrency.oCcyDecimal.format(e.db), textAlign: TextAlign.end, style: const TextStyle(fontSize: 12)),
                              ),
                              SizedBox(
                                width: 120,
                                child: Text(FormatCurrency.oCcyDecimal.format(e.cr), textAlign: TextAlign.end, style: const TextStyle(fontSize: 12)),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                const Expanded(child: Text("TOTAL", style: TextStyle(fontWeight: FontWeight.bold))),
                SizedBox(
                  width: 120,
                  child: Text(FormatCurrency.oCcyDecimal.format(value.totalDb),
                      textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 120,
                  child: Text(FormatCurrency.oCcyDecimal.format(value.totalCr),
                      textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaldoSection(
    BuildContext context,
    String title,
    List<NeracaGroup> groups,
    String keyword,
  ) {
    final filteredGroups = keyword.isEmpty
        ? groups
        : groups
            .map((g) {
              final filteredItems = g.items
                  .where((i) => i.nosbb.toLowerCase().contains(keyword.toLowerCase()) || i.namaSbb.toLowerCase().contains(keyword.toLowerCase()))
                  .toList();
              return filteredItems.isEmpty
                  ? null
                  : NeracaGroup(
                      nobb: g.nobb,
                      namaBb: g.namaBb,
                      items: filteredItems,
                    );
            })
            .whereType<NeracaGroup>()
            .toList();

    if (filteredGroups.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            color: colorPrimary,
            child: const Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    "No SBB",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Nama",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    "Saldo",
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    "Aksi",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          ...filteredGroups.map((group) => _buildSaldoGroup(context, group)),
        ],
      ),
    );
  }

  Widget _buildSaldoGroup(BuildContext context, NeracaGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...group.items.map((a) => Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      a.nosbb,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      a.namaSbb,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      FormatCurrency.oCcyDecimal.format(a.saldo),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          final notifier = Provider.of<GlNotifier>(
                            context,
                            listen: false,
                          );

                          notifier.getDetailJurnalByNoSbb(
                            noSbb: a.nosbb,
                            namaSbb: a.namaSbb,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            "Detail",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          color: Colors.grey.shade50,
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  group.nobb,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  group.namaBb.isNotEmpty ? group.namaBb : group.nobb,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  FormatCurrency.oCcyDecimal.format(group.total),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 90),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegacyGroup(dynamic ac) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey), borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(ac.group, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          ...ac.item.map<Widget>((data) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...data.sbbItem.map<Widget>((a) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            SizedBox(width: 120, child: Text(a.nosbb)),
                            Expanded(child: Text(a.namaSbb)),
                            Text(FormatCurrency.oCcyDecimal.format(a.saldo), textAlign: TextAlign.end),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: Text(data.namaBb, textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.bold))),
                        const SizedBox(width: 100),
                        SizedBox(
                          width: 200,
                          child: Text(
                            FormatCurrency.oCcyDecimal.format(data.sbbItem.map((e) => e.saldo).reduce((a, b) => a + b)),
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              )),
        ],
      ),
    );
  }
}
