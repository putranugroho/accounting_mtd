import 'package:accounting/module/gl/gl_notifier.dart';

import 'package:accounting/utils/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "GL / COA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 260,
                          child: TextFormField(
                            controller: value.cariSbbCoa,
                            onChanged: (_) => value.filterTransaksiGl(),
                            decoration: InputDecoration(
                              labelText: "No SBB / COA",
                              hintText: "Cari No SBB / nama COA",
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            controller: value.tglAwalController,
                            readOnly: true,
                            onTap: () => value.pilihTglAwal(),
                            decoration: InputDecoration(
                              labelText: "Tanggal Awal",
                              suffixIcon: const Icon(Icons.calendar_month),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text("s/d"),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 170,
                          child: TextFormField(
                            controller: value.tglAkhirController,
                            readOnly: true,
                            onTap: () => value.pilihTglAkhir(),
                            decoration: InputDecoration(
                              labelText: "Tanggal Akhir",
                              suffixIcon: const Icon(Icons.calendar_month),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () => value.filterTransaksiGl(),
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
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssets.excel,
                                height: 15,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Download to Excel",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
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
                          const Text(
                            "Transaksi SBB / COA Terkait",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            color: colorPrimary,
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 110,
                                  child: Text("Tgl Trans", style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text("No Dok", style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text("No SBB/COA", style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                                Expanded(
                                  child: Text("Keterangan", style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text("Db", textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text("Cr", textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontSize: 12)),
                                ),
                              ],
                            ),
                          ),
                          value.listTransaksiGlFiltered.isEmpty
                              ? Container(
                                  padding: const EdgeInsets.all(16),
                                  child: const Text(
                                    "Tidak ada transaksi pada filter yang dipilih.",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              : Column(
                                  children: value.listTransaksiGlFiltered.map((e) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(color: Colors.grey.shade300),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 110,
                                            child: Text(
                                              DateFormat("yyyy-MM-dd").format(e.tglTrans),
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              e.noDok,
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              e.noSbb,
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${e.namaSbb} - ${e.keterangan}",
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              FormatCurrency.oCcyDecimal.format(e.db),
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120,
                                            child: Text(
                                              FormatCurrency.oCcyDecimal.format(e.cr),
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(fontSize: 12),
                                            ),
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
                                const Expanded(
                                  child: Text(
                                    "TOTAL",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    FormatCurrency.oCcyDecimal.format(value.totalDb),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Text(
                                    FormatCurrency.oCcyDecimal.format(value.totalCr),
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        itemCount: value.list.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          final ac = value.list[i];
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey), borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      child: Text(
                                        ac.group,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                        itemCount: ac.item.length,
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          final data = ac.item[i];
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              ListView.builder(
                                                  itemCount: data.sbbItem.length,
                                                  shrinkWrap: true,
                                                  physics: const ClampingScrollPhysics(),
                                                  itemBuilder: (context, b) {
                                                    final a = data.sbbItem[b];
                                                    return Column(
                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(width: 120, child: Text(a.nosbb)),
                                                              Expanded(child: Text(a.namaSbb)),
                                                              Text(
                                                                FormatCurrency.oCcyDecimal.format(a.saldo),
                                                                textAlign: TextAlign.end,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      data.namaBb,
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    )),
                                                    const SizedBox(
                                                      width: 100,
                                                    ),
                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        FormatCurrency.oCcyDecimal.format(data.sbbItem.map((e) => e.saldo).reduce((a, b) => a + b)),
                                                        textAlign: TextAlign.end,
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          );
                                        })
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        )),
      ),
    );
  }
}
