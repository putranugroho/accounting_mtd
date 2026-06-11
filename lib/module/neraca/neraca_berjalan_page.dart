import 'package:accounting/module/neraca/neraca_berjalan_notiifer.dart';
import 'package:accounting/utils/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/images_path.dart';

class NeracaBerjalanPage extends StatelessWidget {
  const NeracaBerjalanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NeracaBerjalanNotiifer(context: context),
      child: Consumer<NeracaBerjalanNotiifer>(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Neraca Berjalan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageAssets.excel,
                            height: 15,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "Download to Excel",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 80,
                      child: const Text("NO SBB"),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Text("KETERANGAN"),
                      ),
                    ),
                    Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 16),
                      child: const Text("SALDO"),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 80,
                      child: const Text("NO SBB"),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Text("KETERANGAN"),
                      ),
                    ),
                    Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 16),
                      child: const Text("SALDO"),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: value.listNeraca.where((e) => e.golAcc == "1").length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, i) {
                                final data = value.listNeraca.where((e) => e.golAcc == "1").toList()[i];
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
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(right: 16),
                                                    width: 80,
                                                    child: Text(
                                                      a.nosbb,
                                                      style: const TextStyle(fontSize: 12),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      margin: const EdgeInsets.only(right: 16),
                                                      child: Text(
                                                        a.namaSbb,
                                                        style: const TextStyle(fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 180,
                                                    margin: const EdgeInsets.only(right: 16),
                                                    child: Text(
                                                      FormatCurrency.oCcyDecimal.format(a.saldo),
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              )
                                            ],
                                          );
                                        }),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 16),
                                            child: Text(
                                              data.namaBb,
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 180,
                                          margin: const EdgeInsets.only(right: 16),
                                          child: Text(
                                            FormatCurrency.oCcyDecimal.format(data.sbbItem.map((e) => e.saldo).reduce((a, b) => a + b)),
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    )
                                  ],
                                );
                              })),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: value.listNeraca.where((e) => e.golAcc == "2").length,
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, i) {
                                final data = value.listNeraca.where((e) => e.golAcc == "2").toList()[i];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    ListView.builder(
                                        itemCount: data.sbbItem.where((e) => e.nosbb != "600100000001" && e.nosbb != "600200000001").length,
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        itemBuilder: (context, b) {
                                          final a = data.sbbItem.where((e) => e.nosbb != "600100000001" && e.nosbb != "600200000001").toList()[b];
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(right: 16),
                                                    width: 80,
                                                    child: Text(
                                                      a.nosbb,
                                                      style: const TextStyle(fontSize: 12),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      margin: const EdgeInsets.only(right: 16),
                                                      child: Text(
                                                        a.namaSbb,
                                                        style: const TextStyle(fontSize: 12),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 180,
                                                    margin: const EdgeInsets.only(right: 16),
                                                    child: Text(
                                                      FormatCurrency.oCcyDecimal.format(a.saldo),
                                                      textAlign: TextAlign.end,
                                                      style: const TextStyle(fontSize: 12),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              )
                                            ],
                                          );
                                        }),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 16),
                                            child: Text(
                                              data.namaBb,
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 180,
                                          margin: const EdgeInsets.only(right: 16),
                                          child: Text(
                                            FormatCurrency.oCcyDecimal.format(data.sbbItem.map((e) => e.saldo).reduce((a, b) => a + b)),
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    )
                                  ],
                                );
                              })),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 1,
                color: Colors.grey,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 80,
                      child: const Text(""),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Text(
                          "TOTAL AKTIVA",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 16),
                      child: Text(
                        formatRounded(value.totalAktiva),
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 80,
                      child: const Text(""),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: const Text(
                          "TOTAL PASIVA",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      margin: const EdgeInsets.only(right: 16),
                      child: Text(
                        formatRounded(value.totalPasiva),
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
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
