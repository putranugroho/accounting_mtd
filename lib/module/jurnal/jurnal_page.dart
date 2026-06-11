import 'package:accounting/models/index.dart';
import 'package:accounting/module/jurnal/jurnal_notifier.dart';
import 'package:accounting/utils/colors.dart';
import 'package:accounting/utils/format_currency.dart';
import 'package:accounting/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class JurnalPage extends StatelessWidget {
  const JurnalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JurnalNotifier(context: context),
      child: Consumer<JurnalNotifier>(
        builder: (context, value, child) => SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const Row(
                          children: [
                            Text(
                              "Jurnal",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // FILTER NO COA + RANGE TANGGAL
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 260,
                              child: TextFormField(
                                controller: value.noCoa,
                                onChanged: (_) => value.applyFilterLocal(),
                                decoration: InputDecoration(
                                  labelText: "No COA / SBB",
                                  hintText: "Cari debet_acc / credit_acc",
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 24),
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                readOnly: true,
                                onTap: () => value.tanggalTransaksiAwal(),
                                controller: value.tglawal,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  hintText: "Tanggal Awal",
                                  suffixIcon: const Icon(Icons.calendar_month),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            const Text("s/d"),
                            const SizedBox(width: 16),
                            SizedBox(
                              width: 180,
                              child: TextFormField(
                                readOnly: true,
                                onTap: () => value.tanggalTransaksiAkhir(),
                                controller: value.tglakhir,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  hintText: "Tanggal Akhir",
                                  suffixIcon: const Icon(Icons.calendar_month),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () => value.getJurnal(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorPrimary,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Tampil",
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
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(
                              "Total Data: ${value.listDataFiltered.length}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              "Total Debet: ${FormatCurrency.oCcyDecimal.format(value.totalDebet)}",
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              "Total Kredit: ${FormatCurrency.oCcyDecimal.format(value.totalKredit)}",
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height,
                          child: value.isLoadingData
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SfDataGrid(
                                  headerRowHeight: 40,
                                  rowHeight: 38,
                                  defaultColumnWidth: 180,
                                  frozenColumnsCount: 2,
                                  gridLinesVisibility: GridLinesVisibility.both,
                                  headerGridLinesVisibility: GridLinesVisibility.both,
                                  selectionMode: SelectionMode.single,
                                  source: JurnalDataSource(value),
                                  columns: <GridColumn>[
                                    GridColumn(
                                      columnName: 'tgl_trans',
                                      width: 100,
                                      label: _headerCell('Tgl Trans'),
                                    ),
                                    GridColumn(
                                      columnName: 'tgl_valuta',
                                      width: 100,
                                      label: _headerCell('Tgl Valuta'),
                                    ),
                                    GridColumn(
                                      columnName: 'nomor_dok',
                                      width: 110,
                                      label: _headerCell('No Dok'),
                                    ),
                                    GridColumn(
                                      columnName: 'nomor_ref',
                                      width: 130,
                                      label: _headerCell('No Ref'),
                                    ),
                                    GridColumn(
                                      columnName: 'debet_acc',
                                      width: 260,
                                      label: _headerCell('Akun Debet'),
                                    ),
                                    GridColumn(
                                      columnName: 'credit_acc',
                                      width: 260,
                                      label: _headerCell('Akun Kredit'),
                                    ),
                                    GridColumn(
                                      columnName: 'keterangan',
                                      width: 260,
                                      label: _headerCell('Keterangan'),
                                    ),
                                    GridColumn(
                                      columnName: 'debet',
                                      width: 150,
                                      label: _headerCell('Debet'),
                                    ),
                                    GridColumn(
                                      columnName: 'kredit',
                                      width: 150,
                                      label: _headerCell('Kredit'),
                                    ),
                                    GridColumn(
                                      columnName: 'action',
                                      width: 90,
                                      label: _headerCell('Action'),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "Detail Jurnal",
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
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 32),
                              Expanded(
                                child: ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _readonlyField(
                                            title: "Tanggal Transaksi",
                                            controller: value.tglTransaksi,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: _readonlyField(
                                            title: "Tanggal Valuta",
                                            controller: value.tglValuta,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: _readonlyField(
                                            title: "No. Dokumen",
                                            controller: value.noDok,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: _readonlyField(
                                            title: "No. Referensi",
                                            controller: value.noRef,
                                          ),
                                        ),
                                      ],
                                    ),
                                    _readonlyField(
                                      title: "Akun Debet",
                                      controller: value.namasbbdebet,
                                      secondController: value.nosbbdebet,
                                    ),
                                    _readonlyField(
                                      title: "Akun Kredit",
                                      controller: value.namasbbkredit,
                                      secondController: value.nosbbkredit,
                                    ),
                                    _readonlyField(
                                      title: "Nominal",
                                      controller: value.nominal,
                                    ),
                                    _readonlyField(
                                      title: "Keterangan",
                                      controller: value.keterangan,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerCell(String text) {
    return Container(
      padding: const EdgeInsets.all(6),
      color: colorPrimary,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _readonlyField({
    required String title,
    required TextEditingController controller,
    TextEditingController? secondController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 8),
        secondController == null
            ? TextFormField(
                readOnly: true,
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 160,
                    child: TextFormField(
                      readOnly: true,
                      controller: secondController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class JurnalDataSource extends DataGridSource {
  JurnalDataSource(JurnalNotifier value) {
    jurnalNotifier = value;
    buildRowData(value.listDataFiltered);
  }

  JurnalNotifier? jurnalNotifier;

  List<DataGridRow> _jurnalData = [];

  @override
  List<DataGridRow> get rows => _jurnalData;

  void buildRowData(List<TransaksiModel> list) {
    final keyword = jurnalNotifier?.noCoa.text.trim() ?? "";

    _jurnalData = list.map<DataGridRow>((data) {
      final nominal = double.tryParse(data.nominal) ?? 0;

      final showDebet = keyword.isEmpty || data.debetAcc.trim().contains(keyword);
      final showKredit = keyword.isEmpty || data.creditAcc.trim().contains(keyword);

      return DataGridRow(
        cells: [
          DataGridCell(
            columnName: 'tgl_trans',
            value: data.tglTrans,
          ),
          DataGridCell(
            columnName: 'tgl_valuta',
            value: data.tglVal,
          ),
          DataGridCell(
            columnName: 'nomor_dok',
            value: data.nomorDok,
          ),
          DataGridCell(
            columnName: 'nomor_ref',
            value: data.nomorRef,
          ),
          DataGridCell(
            columnName: 'debet_acc',
            value: "(${data.debetAcc}) - ${data.namaDebet}",
          ),
          DataGridCell(
            columnName: 'credit_acc',
            value: "(${data.creditAcc}) - ${data.namaCredit}",
          ),
          DataGridCell(
            columnName: 'keterangan',
            value: data.keterangan,
          ),
          DataGridCell(
            columnName: 'debet',
            value: showDebet ? nominal : 0,
          ),
          DataGridCell(
            columnName: 'kredit',
            value: showKredit ? nominal : 0,
          ),
          DataGridCell(
            columnName: 'action',
            value: data.rrn,
          ),
        ],
      );
    }).toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        if (e.columnName == 'action') {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6),
            child: InkWell(
              onTap: () {
                jurnalNotifier!.pilihTransaksi(e.value.toString());
              },
              child: Container(
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
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        }

        if (e.columnName == 'debet' || e.columnName == 'kredit') {
          return Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(6),
            child: Text(
              e.value == 0 ? "" : FormatCurrency.oCcyDecimal.format(e.value),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          );
        }

        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(6),
          child: Text(
            e.value.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        );
      }).toList(),
    );
  }
}
