import 'package:accounting/models/index.dart';
import 'package:accounting/module/transaksi/laporan/laporan_transaksi_notifier.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart' as a;

import 'package:accounting/utils/button_custom.dart';
import 'package:accounting/utils/currency_formatted.dart';
// import 'package:accounting/utils/format_currency.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../utils/colors.dart';
import '../../../utils/format_currency.dart';

class LaporanTransaksiPage extends StatelessWidget {
  const LaporanTransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LaporanTransaksiNotifier(context: context),
      child: Consumer<LaporanTransaksiNotifier>(
        builder: (context, value, child) => SafeArea(
            child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Row(
                        children: [
                          Text(
                            "Transaksi",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: FocusTraversalGroup(
                        // child: Form(
                        //   key: value.searchForm,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Radio(
                                    value: "1",
                                    groupValue: value.cariTrans,
                                    activeColor: colorPrimary,
                                    onChanged: (e) => value.pilihCariTransaksi("1"),
                                  ),
                                  const Text("Sukses"),
                                  const SizedBox(width: 16),
                                  Radio(
                                    value: "BACKDATE",
                                    groupValue: value.cariTrans,
                                    activeColor: colorPrimary,
                                    onChanged: (e) => value.pilihCariTransaksi("BACKDATE"),
                                  ),
                                  const Text("Back Date"),
                                  const SizedBox(width: 16),
                                  Radio(
                                    value: "4",
                                    groupValue: value.cariTrans,
                                    activeColor: colorPrimary,
                                    onChanged: (e) => value.pilihCariTransaksi("4"),
                                  ),
                                  const Text("Pembatalan"),
                                  const SizedBox(width: 16),
                                  Radio(
                                    value: "2",
                                    groupValue: value.cariTrans,
                                    activeColor: colorPrimary,
                                    onChanged: (e) => value.pilihCariTransaksi("2"),
                                  ),
                                  const Text("Pending"),
                                  const SizedBox(width: 16),
                                  Radio(
                                    value: "all",
                                    groupValue: value.cariTrans,
                                    activeColor: colorPrimary,
                                    onChanged: (e) => value.pilihCariTransaksi("all"),
                                  ),
                                  const Text("Semua"),
                                  const SizedBox(width: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: FocusTraversalGroup(
                        // child: Form(
                        //   key: value.searchForm,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Label + Radio + Tanggal Valuta
                            Flexible(
                              child: Row(
                                children: [
                                  const Text(
                                    "User Input",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(width: 16),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(
                                      controller: value.namaKaryawan,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8), borderSide: BorderSide(width: 1, color: Colors.grey))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: FocusTraversalGroup(
                        // child: Form(
                        //   key: value.searchForm,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Label + Radio + Tanggal Valuta
                            Flexible(
                              child: Row(
                                children: [
                                  Radio(
                                    value: true,
                                    groupValue: value.cariTglTrans,
                                    activeColor: colorPrimary,
                                    onChanged: (e) => value.pilihTglTransaksi(true),
                                  ),
                                  const Text("Tgl Trx"),
                                  const SizedBox(width: 16),
                                  Radio(
                                    value: false,
                                    groupValue: value.cariTglTrans,
                                    activeColor: colorPrimary,
                                    onChanged: (e) => value.pilihTglTransaksi(false),
                                  ),
                                  const Text("Tgl Valuta"),
                                  const SizedBox(width: 24),
                                  SizedBox(
                                    width: 180,
                                    child: TextFormField(
                                      readOnly: true,
                                      onTap: () => value.tanggalTransaksiAwal(),
                                      controller: value.tglawal,
                                      validator: (e) {
                                        if (e!.isEmpty) {
                                          return "Wajib diisi";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey[200],
                                        hintText: "Tanggal Awal",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  const Text("s/d"),
                                  const SizedBox(width: 24),
                                  SizedBox(
                                    width: 180,
                                    child: TextFormField(
                                      readOnly: true,
                                      onTap: () => value.tanggalTransaksiAkhir(),
                                      controller: value.tglakhir,
                                      validator: (e) {
                                        if (e!.isEmpty) {
                                          return "Wajib diisi";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        fillColor: Colors.grey[200],
                                        hintText: "Tanggal Akhir",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Tombol Cari
                            ElevatedButton(
                              onPressed: () => value.getTransaksi(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorPrimary,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Tampil", style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        // ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height,
                        child: SfDataGrid(
                          headerRowHeight: 40,
                          defaultColumnWidth: 180,
                          frozenColumnsCount: 2,

                          // controller: value.dataGridController,
                          gridLinesVisibility: GridLinesVisibility.both,
                          headerGridLinesVisibility: GridLinesVisibility.both,
                          selectionMode: SelectionMode.single,

                          source: DetailDataSource(value),
                          columns: <GridColumn>[
                            GridColumn(
                                columnName: 'tgl_trans',
                                width: 100,
                                label: Container(
                                    padding: const EdgeInsets.all(6),
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    child: const Text('Tanggal Trans',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: Colors.white,
                                        )))),
                            GridColumn(
                                columnName: 'tgl_valuta',
                                width: 100,
                                label: Container(
                                    padding: const EdgeInsets.all(6),
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    child: const Text('Tanggal Valuta',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12,
                                          color: Colors.white,
                                        )))),
                            GridColumn(
                                columnName: 'nomor_dok',
                                width: 150,
                                label: Container(
                                    padding: const EdgeInsets.all(6),
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    child: const Text('No Dokumen',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontSize: 12,
                                        )))),
                            GridColumn(
                                columnName: 'nomor_ref',
                                width: 150,
                                label: Container(
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(6),
                                    child: const Text('No Referensi',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        )))),
                            GridColumn(
                                columnName: 'nominal',
                                label: Container(
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(6),
                                    child: const Text('Nominal',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        )))),
                            GridColumn(
                                columnName: 'debet_acc',
                                label: Container(
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(6),
                                    child: const Text('Akun Debet',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        )))),
                            GridColumn(
                                columnName: 'credit_acc',
                                label: Container(
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(6),
                                    child: const Text('Akun Kredit',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        )))),
                            GridColumn(
                                columnName: 'keterangan',
                                label: Container(
                                    color: colorPrimary,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(6),
                                    child: const Text('keterangan',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        )))),
                            GridColumn(
                                columnName: 'action',
                                width: 90,
                                label: Container(
                                    color: colorPrimary,
                                    padding: const EdgeInsets.all(6),
                                    alignment: Alignment.center,
                                    child: const Text('Action',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        )))),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: value.dialog
                    ? Container(
                        color: Colors.black.withOpacity(0.5),
                      )
                    : const SizedBox(),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: value.dialog
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        width: 600,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: FocusTraversalGroup(
                          child: Form(
                            key: value.keyForm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text(
                                        "Detail Transaksi",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => value.tutup(),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                                        child: const Icon(Icons.close),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Expanded(
                                    child: ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  "Tanggal Transaksi",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "*",
                                                  style: TextStyle(fontSize: 8),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            TextFormField(
                                              textInputAction: TextInputAction.done,
                                              readOnly: true,
                                              controller: value.tglTransaksi,
                                              decoration: InputDecoration(
                                                hintText: "Tgl Valuta",
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        )),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  "Tanggal Valuta",
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "*",
                                                  style: TextStyle(fontSize: 8),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            TextFormField(
                                              textInputAction: TextInputAction.done,
                                              readOnly: true,
                                              controller: value.tglValuta,
                                              decoration: InputDecoration(
                                                hintText: "Tgl Valuta",
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(6),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                          const Row(
                                            children: [
                                              Text(
                                                "No. Dokumen",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "*",
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            textInputAction: TextInputAction.done,
                                            controller: value.noDok,
                                            maxLines: 1,
                                            readOnly: true,
                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "No. Dokumen",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ])),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                          const Row(
                                            children: [
                                              Text(
                                                "No. Referensi",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "*",
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            textInputAction: TextInputAction.done,
                                            controller: value.noRef,
                                            maxLines: 1,
                                            readOnly: true,
                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "No. Referensi",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ])),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Pilih Debet Akun ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "*",
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            // enabled: false,
                                            readOnly: true,
                                            textInputAction: TextInputAction.done,
                                            controller: value.namasbbdebet,
                                            maxLines: 1,
                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            validator: (e) {
                                              if (e!.isEmpty) {
                                                return "Wajib diisi";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "Akun",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: TextFormField(
                                            // enabled: false,
                                            readOnly: true,
                                            textInputAction: TextInputAction.done,
                                            controller: value.nosbbdebet,
                                            maxLines: 1,
                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            validator: (e) {
                                              if (e!.isEmpty) {
                                                return "Wajib diisi";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "Nomor Debet",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Pilih Kredit Akun",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "*",
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            // enabled: false,
                                            readOnly: true,
                                            textInputAction: TextInputAction.done,
                                            controller: value.namasbbkredit,
                                            maxLines: 1,
                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            validator: (e) {
                                              if (e!.isEmpty) {
                                                return "Wajib diisi";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "Nama Akun",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: TextFormField(
                                            // enabled: false,
                                            readOnly: true,
                                            textInputAction: TextInputAction.done,
                                            controller: value.nosbbkredit,
                                            maxLines: 1,
                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            validator: (e) {
                                              if (e!.isEmpty) {
                                                return "Wajib diisi";
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "Nomor Kredit",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Nominal",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "*",
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: value.nominal,
                                      maxLines: 1,
                                      readOnly: true,

                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter.digitsOnly
                                      // ],
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        hintText: "Nominal",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Keterangan",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "*",
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      controller: value.keterangan,
                                      maxLines: 1,
                                      readOnly: true,

                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter.digitsOnly
                                      // ],
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        hintText: "Keterangan",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                          const Row(
                                            children: [
                                              Text(
                                                "AO Debet",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "*",
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            textInputAction: TextInputAction.done,
                                            controller: value.aoDebit,
                                            maxLines: 1,
                                            readOnly: true,

                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "AO Debet",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ])),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                                          const Row(
                                            children: [
                                              Text(
                                                "AO Kredit",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "*",
                                                style: TextStyle(fontSize: 8),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextFormField(
                                            textInputAction: TextInputAction.done,
                                            controller: value.aoKredit,
                                            maxLines: 1,
                                            readOnly: true,

                                            // inputFormatters: [
                                            //   FilteringTextInputFormatter.digitsOnly
                                            // ],
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              hintText: "AO Kredit",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                          ),
                                        ])),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class DetailDataSource extends DataGridSource {
  DetailDataSource(LaporanTransaksiNotifier value) {
    tindakanNotifier = value;
    buildRowData(value.listTransAll);
  }

  LaporanTransaksiNotifier? tindakanNotifier;

  List<DataGridRow> _laporanData = [];
  @override
  List<DataGridRow> get rows => _laporanData;
  void buildRowData(List<TransaksiPendModel> list) {
    int index = 1;

    // 🔽 Sort data terlebih dahulu

    // 🧱 Bangun data grid setelah data diurutkan
    _laporanData = list
        .map<DataGridRow>((data) => DataGridRow(
              cells: [
                DataGridCell(columnName: 'tgl_trans', value: DateFormat('y-MM-dd').format(DateTime.parse(data.createddate))),
                DataGridCell(columnName: 'tgl_valuta', value: data.tglValuta),
                DataGridCell(columnName: 'nomor_dok', value: data.noDokumen),
                DataGridCell(columnName: 'nomor_ref', value: data.noRef),
                DataGridCell(columnName: 'nominal', value: FormatCurrency.oCcyDecimal.format(double.parse(data.nominal))),
                DataGridCell(columnName: 'nama_debet', value: data.namaDr),
                DataGridCell(columnName: 'nama_credit', value: data.namaCr),
                DataGridCell(columnName: 'keterangan', value: data.keterangan),
                DataGridCell(columnName: 'action', value: data.rrn),
              ],
            ))
        .toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'action') {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                tindakanNotifier!.pilihtransaksi(e.value);
              },
              child: Container(
                width: 300,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorPrimary,
                  border: Border.all(
                    width: 2,
                    color: colorPrimary,
                  ),
                ),
                child: const Text(
                  "Aksi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        } else if (e.columnName == 'nominal') {
          return Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        } else if (e.columnName == 'status') {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: e.value == "PENDING"
                      ? Colors.orange
                      : e.value == "CANCEL"
                          ? Colors.red
                          : Colors.green),
              child: Text(
                e.value,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }
      }).toList(),
    );
  }

  String formatStringData(String data) {
    int numericData = int.tryParse(data) ?? 0;
    final formatter = NumberFormat("#,###");
    return formatter.format(numericData);
  }
}
