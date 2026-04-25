import 'package:accounting/network/network_aset.dart';
import 'package:accounting/repository/master_repository.dart';
import 'package:accounting/utils/dialog_loading.dart';

import 'package:accounting/utils/informationdialog.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class KategoriBarangNotifier extends ChangeNotifier {
  final BuildContext context;
  late KategoriBarangDataSource kategoriBarangDataSource;
  KategoriBarangNotifier({required this.context}) {
    kategoriBarangDataSource =
        KategoriBarangDataSource(onEdit: onEdit, onDelete: onDelete);
    fetchKategori();
  }

  List<GridColumn> get columns => [
        GridColumn(columnName: 'id', width: 80, label: Hdr('ID')),
        GridColumn(columnName: 'kode', width: 140, label: Hdr('Kode Kategori')),
        GridColumn(
          columnName: 'kategori',
          width: 200,
          label: Hdr('Nama Kategori'),
        ),
        GridColumn(
            columnName: 'deskripsi',
            columnWidthMode: ColumnWidthMode.fill,
            label: Hdr('Deskripsi')),
        GridColumn(
          columnName: 'status',
          width: 140,
          label: Hdr('Status'),
        ),
        GridColumn(
          columnName: 'action',
          width: 100,
          label: Hdr('Action', center: true),
        ),
      ];

  bool isLoading = false;

  bool showForm = false;
  bool edit = false;
  TextEditingController kodeKategoriController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  String? selectedStatus;

  List<Map<String, dynamic>> list = [];
  Map<String, dynamic> kategoriModel = {};

  onEdit(String value) {
    kategoriModel = list.where((e) => e['id'] == int.parse(value)).first;
    kodeKategoriController.text = kategoriModel['kode_kategori'];
    kategoriController.text = kategoriModel['nama_kategori'];
    deskripsiController.text = kategoriModel['deskripsi'];
    selectedStatus = kategoriModel['status'];
    showForm = true;
    edit = true;
    print("${kategoriModel['id']}, ${kategoriModel['kode_kategori']}");
    notifyListeners();
  }

  Future<void> fetchKategori() async {
    list.clear();
    notifyListeners();
    try {
      isLoading = true;
      notifyListeners();

      MasterRepository.kategori(NetworkAset.kategori()).then((value) {
        list = List<Map<String, dynamic>>.from(value ?? []);
        kategoriBarangDataSource.setRows(list);
        isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      debugPrint("Fetch error: $e");
      SnackBar(content: Text("Fetch error: $e"));
      isLoading = false;
      notifyListeners();
    }
  }

  onDelete(String value) {
    kategoriModel = list.where((e) => e['id'] == int.parse(value)).first;
    confirmationDialog(context, "Peringatan",
        "Anda yakin ingin menghapus ${kategoriModel['nama_kategori']} ?",
        no: () {
      Navigator.pop(context);
    }, yes: () {
      Navigator.pop(context);
      remove();
    });
    notifyListeners();
  }

  remove() async {
    DialogCustom().showLoading(context);
    MasterRepository.deletekategori(
            NetworkAset.kategoriupdate(kategoriModel['id']))
        .then((value) {
      Navigator.pop(context);
      fetchKategori();
      clearForm();
      informationDialog(context, "Informasi", value['message']);
    });
  }

  // ===== ADD DATA =====
  Future<void> addKategori() async {
    if (edit) {
      try {
        final body = {
          "kode_kategori": kodeKategoriController.text,
          "nama_kategori": kategoriController.text,
          "deskripsi": deskripsiController.text,
          "status": selectedStatus ?? "Aktif",
        };
        MasterRepository.updatekategori(
                NetworkAset.kategoriupdate(kategoriModel['id']), body)
            .then((value) {
          fetchKategori();
          clearForm();
          informationDialog(context, "Informasi", value['message']);
        });
      } catch (e) {
        debugPrint("Add error: $e");
        informationDialog(context, "Peringatan", "$e");
      }
    } else {
      try {
        final body = {
          "kode_kategori": kodeKategoriController.text,
          "nama_kategori": kategoriController.text,
          "deskripsi": deskripsiController.text,
          "status": selectedStatus ?? "Aktif",
        };
        MasterRepository.addkategori(NetworkAset.kategori(), body)
            .then((value) {
          fetchKategori();
          clearForm();
          informationDialog(context, "Informasi", value['message']);
        });
      } catch (e) {
        debugPrint("Add error: $e");
        informationDialog(context, "Peringatan", "$e");
      }
    }

    clearForm();
  }

  void clearForm() {
    kodeKategoriController.clear();
    kategoriController.clear();
    deskripsiController.clear();
    selectedStatus = null;
  }

  void toggleForm() {
    showForm = !showForm;
    edit = false;
    notifyListeners();
  }

  @override
  void dispose() {
    kodeKategoriController.dispose();
    kategoriController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }
}

class KategoriBarangDataSource extends DataGridSource {
  final void Function(String id) onEdit;
  final void Function(String id) onDelete;

  List<DataGridRow> _rows = [];

  KategoriBarangDataSource({required this.onEdit, required this.onDelete});

  void setRows(List<Map<String, dynamic>> items) {
    _rows = items.map((m) {
      String fmt(Object? v) => v?.toString() ?? '';

      return DataGridRow(
        cells: [
          DataGridCell(columnName: 'id', value: fmt(m['id'])),
          DataGridCell(columnName: 'kode', value: fmt(m['kode_kategori'])),
          DataGridCell(columnName: 'nama', value: fmt(m['nama_kategori'])),
          DataGridCell(columnName: 'deskripsi', value: fmt(m['deskripsi'])),
          DataGridCell(columnName: 'status', value: fmt(m['status'])),
          DataGridCell(columnName: 'id', value: fmt(m['id'])),
        ],
      );
    }).toList();
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    String get(String name) =>
        (row.getCells().firstWhere((c) => c.columnName == name).value ?? '')
            .toString();

    Widget cell(String name, {Alignment align = Alignment.centerLeft}) {
      final v = get(name);

      if (name == 'status')
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(v, overflow: TextOverflow.ellipsis),
          ),
        );
      return Align(
        alignment: align,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(v, overflow: TextOverflow.ellipsis),
        ),
      );
    }

    Widget actionCell(String id) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            tooltip: 'Edit',
            icon: const Icon(Icons.edit, size: 18),
            onPressed: () => onEdit(id),
          ),
          IconButton(
            tooltip: 'Delete',
            icon: const Icon(Icons.edit, size: 18),
            onPressed: () => onDelete(id),
          ),
        ],
      );
    }

    return DataGridRowAdapter(
      cells: [
        cell('id'),
        cell('kode'),
        cell('nama'),
        cell('deskripsi'),
        cell('status'),
        actionCell(get('id')),
      ],
    );
  }
}

class Hdr extends StatelessWidget {
  final String text;
  final bool center;
  const Hdr(this.text, {this.center = false});
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        );
    return Container(
      alignment: center ? Alignment.center : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(text, style: t),
    );
  }
}
