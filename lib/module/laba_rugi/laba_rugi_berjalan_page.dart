import 'package:accounting/module/laba_rugi/laba_rugi_berjalan_notifier.dart';
import 'package:accounting/module/neraca/neraca_berjalan_notiifer.dart' show NeracaGroup;
import 'package:accounting/utils/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:accounting/models/index.dart';

import '../../utils/colors.dart';
import '../../utils/images_path.dart';

class LabaRugiBerjalanPage extends StatelessWidget {
  const LabaRugiBerjalanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LabaRugiBerjalanNotifier(context: context),
      child: Consumer<LabaRugiBerjalanNotifier>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Laba Rugi Berjalan",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
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
                        width: 260,
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
                        width: 260,
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Tampilkan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (!value.isLoading)
                        GestureDetector(
                          onTap: value.refresh,
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.refresh, size: 18),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Image.asset(ImageAssets.excel, height: 15),
                            const SizedBox(width: 8),
                            const Text("Download to Excel", style: TextStyle(fontSize: 12, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                else ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    color: const Color(0xFFF5F7FA),
                    child: Row(
                      children: [
                        _headerCell(130, "NO SBB"),
                        _headerExpanded("KETERANGAN"),
                        _headerCell(160, "SALDO", align: TextAlign.end),
                        const SizedBox(width: 75),
                        _headerCell(130, "NO SBB"),
                        _headerExpanded("KETERANGAN"),
                        _headerCell(160, "SALDO", align: TextAlign.end),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildColumn(value.groupsBiaya)),
                            const SizedBox(width: 75),
                            Expanded(child: _buildColumn(value.groupsPendapatan)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    color: const Color(0xFFEEF2F7),
                    child: Row(
                      children: [
                        _totalLabel("TOTAL BIAYA"),
                        _totalValue(value.totalBiaya),
                        const SizedBox(width: 75),
                        _totalLabel("TOTAL PENDAPATAN"),
                        _totalValue(value.totalPendapatan),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(List<NeracaGroup> groups) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: groups.map((group) => _buildGroup(group)).toList(),
    );
  }

  Widget _buildGroup(NeracaGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...group.items.map((a) => Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 130,
                    child: Text(a.nosbb, style: const TextStyle(fontSize: 11, color: Color(0xFF555555))),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(a.namaSbb, style: const TextStyle(fontSize: 11)),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: Text(
                      FormatCurrency.oCcyDecimal.format(a.saldo),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FA),
            border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.5)),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 130,
              ),
              Expanded(
                child: Text(
                  group.namaBb.isNotEmpty ? group.namaBb : "Subtotal",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
              SizedBox(
                width: 160,
                child: Text(
                  FormatCurrency.oCcyDecimal.format(group.total),
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _headerCell(double width, String text, {TextAlign align = TextAlign.start}) {
    return SizedBox(
      width: width,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFF666666)), textAlign: align),
    );
  }

  Widget _headerExpanded(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Color(0xFF666666))),
      ),
    );
  }

  Widget _totalLabel(String label) {
    return Expanded(
      child: Text(label, textAlign: TextAlign.end, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _totalValue(double amount) {
    return SizedBox(
      width: 160,
      child: Text(
        formatRounded(amount),
        textAlign: TextAlign.end,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
