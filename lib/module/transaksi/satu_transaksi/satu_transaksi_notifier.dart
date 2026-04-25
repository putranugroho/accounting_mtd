import 'dart:convert';

import 'package:accounting/models/index.dart';
import 'package:accounting/network/network.dart';
import 'package:accounting/pref/pref.dart';
import 'package:accounting/repository/SetupRepository.dart';
import 'package:accounting/utils/button_custom.dart';
import 'package:accounting/utils/dialog_loading.dart';
import 'package:accounting/utils/format_currency.dart';
import 'package:accounting/utils/informationdialog.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SatuTransaksiNotifier extends ChangeNotifier {
  final BuildContext context;

  SatuTransaksiNotifier({required this.context}) {
    getUsers();

    notifyListeners();
  }
  UserModel? users;
  getUsers() async {
    Pref().getUsers().then((value) {
      users = value;
      getSetupTrans();
      getAoMarketing();
      getInqueryAll();
      getTransaksi();
      notifyListeners();
    });
  }

  confirmSimpan() async {
    if (keyForm.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Simpan Transaksi?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "Apakah Anda yakin ingin menyimpan transaksi ini?",
                      style: const TextStyle(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ButtonSecondary(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          name: "Tidak",
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: ButtonPrimary(
                          onTap: () {
                            Navigator.pop(context);
                            cek();
                          },
                          name: "Ya",
                        )),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }
  }

  var isLoadingData = true;
  List<TransaksiPendModel> listTransaksi = [];
  List<TransaksiPendModel> listTransaksiAdd = [];
  Future getTransaksi() async {
    isLoadingData = true;
    listTransaksi.clear();
    listTransaksiAdd.clear();
    notifyListeners();
    var data = {
      "kode_pt": users!.kodePt,
    };
    Setuprepository.setup(token, NetworkURL.view(), jsonEncode(data))
        .then((value) {
      if (value['status'].toString().toLowerCase().contains("success")) {
        for (Map<String, dynamic> i in value['data']) {
          listTransaksi.add(TransaksiPendModel.fromJson(i));
        }
        if (listTransaksi.isNotEmpty) {
          for (var i = 0;
              i <
                  listTransaksi
                      .where((e) =>
                          e.userinput == users!.namauser &&
                          e.modul == "Satu Transaksi" &&
                          e.status == "PENDING")
                      .length;
              i++) {
            final data = listTransaksi
                .where((e) =>
                    e.userinput == users!.namauser &&
                    e.modul == "Satu Transaksi" &&
                    e.status == "PENDING")
                .toList()[i];
            listTransaksiAdd.add(data);
          }
          print("PENDING : ${listTransaksi.length}");
          print("PENDING RESULT: ${listTransaksiAdd.length}");

          listTransaksiAdd.sort((a, b) => DateTime.parse(b.createddate)
              .compareTo(DateTime.parse(a.createddate)));
        }
        getTransaksiBackend();

        notifyListeners();
      } else {
        isLoadingData = false;
        notifyListeners();
      }
    });
  }

  List<TransaksiModel> listTransaksiBack = [];
  getTransaksiBackend() async {
    isLoadingData = true;
    listTransaksiBack.clear();
    notifyListeners();
    var data = {
      "filter": {
        "general": {
          "batch": null,
          "userinput": "${users!.namauser}",
          "userotor": "",
          "otorrev": "",
          "chguser": "",
          "status_transaksi": "all",
          "kode_pt": "${users!.kodePt}",
          "kode_kantor": "${users!.kodeKantor}",
          "kode_induk": "${users!.kodeInduk}",
          "rrn": null,
          "no_dokumen": null,
          "no_reff": null,
          // "flag_trn": "0"
        },
        "range_tanggal": {
          "from": "${DateFormat('y-MM-dd').format(DateTime.now())}",
          "to": "${DateFormat('y-MM-dd').format(DateTime.now())}",
        },
        "range_tanggal_valuta": {"from": "", "to": ""},
        "akun": {"dracc": null, "cracc": null},
        "range_nominal": {"min": null, "max": null}
      },
      "pagination": {"page": 1},
      "sort": {"by": "tgl_transaksi", "order": "desc"}
    };
    Setuprepository.setup(token, NetworkURL.search(), jsonEncode(data))
        .then((value) {
      if (value['code'] == "000") {
        for (Map<String, dynamic> i in value['data']) {
          listTransaksiBack.add(TransaksiModel.fromJson(i));
        }
        if (listTransaksiBack.isNotEmpty) {
          for (var i = 0;
              i < listTransaksiBack.where((e) => e.kodeTrans != "9998").length;
              i++) {
            final data = listTransaksiBack
                .where((e) => e.kodeTrans != "9998")
                .toList()[i];
            listTransaksiAdd.add(TransaksiPendModel(
                id: data.id,
                tglTransaksi: data.tglTrans,
                tglValuta: data.tglVal,
                batch: data.batch,
                trxType: "",
                trxCode: data.trxCode,
                otor: data.otor,
                kodeTrn: data.kodeTrans,
                dracc: data.debetAcc,
                namaDr: data.namaDebet,
                cracc: data.creditAcc,
                namaCr: data.namaCredit,
                rrn: data.rrn,
                noDokumen: data.nomorDok,
                modul: "",
                keteranganOtor: data.keterangan,
                alasan: data.alasan,
                noRef: data.nomorRef,
                nominal: data.nominal,
                keterangan: data.keterangan,
                kodePt: data.kodePt,
                kodeKantor: data.kodeKantor,
                kodeInduk: data.kodeInduk,
                stsValidasi: data.statusValidasi,
                kodeAoDr: data.kodeAoDebet,
                kodeColl: data.kodeColl,
                kodeAoCr: data.kodeAoCredit,
                userinput: data.inpuser,
                userterm: data.inpterm,
                inputtgljam: data.inptgljam,
                otoruser: data.autrevuser,
                otorterm: data.autrevterm,
                otortgljam: data.autrevtgljam,
                flagTrn: data.flagTrn,
                merchant: data.merchant,
                sourceTrx: data.sourceTrx,
                noKontrak: data.noKontrak,
                noInvoice: data.noInvoice,
                createddate: data.inptgljam,
                status:
                    "${data.statusTransaksi == "1" ? "COMPLETED" : "CANCEL"}"));
          }
        }
        isLoadingData = false;
        notifyListeners();
      } else {
        isLoadingData = false;
        notifyListeners();
      }
    });
  }

  List<InqueryGlModel> list = [];
  List<AoModel> listAo = [];
  List<AoModel> listAoAdd = [];
  getAoMarketing() async {
    isLoading = true;
    listAo.clear();
    listAoAdd.clear();
    notifyListeners();
    var data = {"kode_pt": users!.kodePt};
    Setuprepository.setup(token, NetworkURL.getAoMarketing(), jsonEncode(data))
        .then((value) {
      if (value['status'].toString().toLowerCase().contains("success")) {
        for (Map<String, dynamic> i in value['data']) {
          listAo.add(AoModel.fromJson(i));
        }
        if (listAo.isNotEmpty) {
          listAoAdd.addAll(listAo.where((e) => e.nonaktif == "N").toList());
        }
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  InqueryGlModel? inqueryGlModeldeb;
  InqueryGlModel? inqueryGlModelcre;
  var isLoadingInquery = true;
  List<InqueryGlModel> listGl = [];
  TextEditingController nosbbdeb = TextEditingController();
  TextEditingController nossbcre = TextEditingController();
  Future<List<InqueryGlModel>> getInquery(String query) async {
    if (query.isNotEmpty && query.length > 2) {
      isLoadingInquery = true;
      listGl.clear();
      notifyListeners();

      var data = {"kode_pt": "001"};

      try {
        final response = await Setuprepository.setup(
          token,
          NetworkURL.getInqueryGL(),
          jsonEncode(data),
        );

        if (response['status'].toString().toLowerCase().contains("success")) {
          final List<Map<String, dynamic>> jnsAccBItems =
              extractJnsAccB(response['data']);
          listGl = jnsAccBItems
              .map((item) => InqueryGlModel.fromJson(item))
              .where((model) =>
                  model.nosbb.toLowerCase().contains(query.toLowerCase()) ||
                  model.namaSbb.toLowerCase().contains(query.toLowerCase()) &&
                      model.typePosting == "Y")
              .toList();
        }
        notifyListeners();
      } catch (e) {
        print("Error: $e");
      } finally {
        isLoadingInquery = false;
        notifyListeners();
      }
    } else {
      listGl.clear(); // clear on short query
    }

    return listGl;
  }

  TextEditingController namaSbbDeb = TextEditingController();
  TextEditingController namaSbbCre = TextEditingController();

  SetupTransModel? setupTransModel;
  pilihTransModel(SetupTransModel value) {
    setupTransModel = value;
    namaTransaksi.text = setupTransModel!.kdTrans;
    inqueryGlModeldeb =
        listGl.where((e) => e.nosbb == setupTransModel!.glDeb).isEmpty
            ? null
            : listGl.where((e) => e.nosbb == setupTransModel!.glDeb).first;
    inqueryGlModelcre =
        listGl.where((e) => e.nosbb == setupTransModel!.glKre).isEmpty
            ? null
            : listGl.where((e) => e.nosbb == setupTransModel!.glKre).first;
    nosbbdeb.text = setupTransModel!.namaDeb;
    namaSbbDeb.text = setupTransModel!.glDeb;
    nossbcre.text = setupTransModel!.namaKre;
    namaSbbCre.text = setupTransModel!.glKre;
    notifyListeners();
  }

  pilihAkunDeb(InqueryGlModel value) {
    inqueryGlModeldeb = value;
    nosbbdeb.text = value.namaSbb;
    namaSbbDeb.text = value.nosbb;
    notifyListeners();
  }

  pilihAkunCre(InqueryGlModel value) {
    inqueryGlModelcre = value;
    nossbcre.text = value.namaSbb;
    namaSbbCre.text = value.nosbb;
    notifyListeners();
  }

  Future getInqueryAll() async {
    listGl.clear();
    notifyListeners();
    var data = {"kode_pt": users!.kodePt};
    Setuprepository.setup(token, NetworkURL.getInqueryGL(), jsonEncode(data))
        .then((value) {
      if (value['status'].toString().toLowerCase().contains("success")) {
        final List<Map<String, dynamic>> jnsAccBItems =
            extractJnsAccB(value['data']);
        listGl =
            jnsAccBItems.map((item) => InqueryGlModel.fromJson(item)).toList();
        notifyListeners();
      }
    });
  }

  var isLoading = true;
  Future getSetupTrans() async {
    isLoading = true;
    listData.clear();
    notifyListeners();
    var data = {"kode_pt": users!.kodePt};
    Setuprepository.setup(token, NetworkURL.getSetupTrans(), jsonEncode(data))
        .then((value) {
      if (value['status'].toString().toLowerCase().contains("success")) {
        for (Map<String, dynamic> i in value['data']) {
          listData.add(SetupTransModel.fromJson(i));
        }
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  List<Map<String, dynamic>> extractJnsAccB(List<dynamic> rawData) {
    List<Map<String, dynamic>> result = [];

    void traverse(List<dynamic> items) {
      for (var item in items) {
        if (item is Map<String, dynamic>) {
          if (item['jns_acc'] == 'C' && item['type_posting'] == "Y") {
            result.add(item);
          }

          if (item.containsKey('items') && item['items'] is List) {
            traverse(item['items']);
          }
        }
      }
    }

    traverse(rawData);
    return result;
  }

  confirmPrint() {
    showDialog(
        context: context,
        builder: (context) {
          return const Dialog();
        });
  }

  DateTime? tglBackDate = DateTime.now();
  Future tanggalBackDate() async {
    var pickedendDate = (await showDatePicker(
      context: context,
      initialDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
                DateTime.now(),
              )) -
              1),
      firstDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())) - 10,
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      lastDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
                DateTime.now(),
              )) -
              1),
    ));
    if (pickedendDate != null) {
      tglBackDate = pickedendDate;
      tglBackDatetext.text = DateFormat("dd-MMM-yyyy")
          .format(DateTime.parse(pickedendDate.toString()));
      notifyListeners();
    }
  }

  DateTime? tglTransaksi;
  Future pilihTanggalBuka() async {
    var pickedendDate = (await showDatePicker(
      context: context,
      initialDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      firstDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())),
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
      lastDate: DateTime(
          int.parse(DateFormat('y').format(DateTime.now())) + 10,
          int.parse(DateFormat('MM').format(
            DateTime.now(),
          )),
          int.parse(DateFormat('dd').format(
            DateTime.now(),
          ))),
    ));
    if (pickedendDate != null) {
      tglTransaksi = pickedendDate;
      tglTransaksiText.text = DateFormat("dd-MMM-yyyy")
          .format(DateTime.parse(pickedendDate.toString()));
      notifyListeners();
    }
  }

  TextEditingController nominal = TextEditingController();
  TextEditingController tglTransaksiText = TextEditingController();
  TextEditingController tglBackDatetext = TextEditingController();
  TextEditingController nomorDok = TextEditingController();
  TextEditingController nomorRef = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  bool dialog = false;
  tambah() {
    clear();
    dialog = true;
    notifyListeners();
  }

  bool backDate = false;
  gantibackDate() {
    backDate = !backDate;
    notifyListeners();
  }

  tutup() {
    dialog = false;
    notifyListeners();
  }

  clear() {
    setupTransModel = null;
    namaTransaksi.clear();
    nomorDok.clear();
    nomorRef.clear();
    sbbAset = null;
    namaSbbCre.clear();
    nossbcre.clear();
    nosbbdeb.clear();
    namaSbbDeb.clear();
    sbbpenyusutan = null;
    nominal.clear();
    keterangan.clear();
    aoModel = null;
    aoModelKRedit = null;
    dialog = false;

    notifyListeners();
  }

  List<SetupTransModel> listData = [];

  TextEditingController namaSbbAset = TextEditingController();
  TextEditingController namaTransaksi = TextEditingController();
  CoaModel? sbbAset;
  pilihSbbAset(CoaModel value) {
    sbbAset = value;
    namaSbbAset.text = value.nosbb;
    notifyListeners();
  }

  TextEditingController masasusut = TextEditingController();
  TextEditingController namaSbbpenyusutan = TextEditingController();
  CoaModel? sbbpenyusutan;
  pilihSbbpenyusutan(CoaModel value) {
    sbbpenyusutan = value;
    namaSbbpenyusutan.text = value.nosbb;
    notifyListeners();
  }

  // List<AoModel> listAo = [];
  AoModel? aoModel;
  AoModel? aoModelKRedit;
  pilihAoModelDebet(AoModel value) {
    aoModel = value;
    notifyListeners();
  }

  final keyForm = GlobalKey<FormState>();

  cek() {
    if (users!.limitAkses == "Y") {
      if (double.parse(users!.maksimalTransaksi) <
          double.parse(nominal.text
              .replaceAll("Rp ", "")
              .replaceAll(".", "")
              .replaceAll(",", "."))) {
        DialogCustom().showLoading(context);
        var invoice = DateTime.now().millisecondsSinceEpoch.toString();
        var data = {
          "tgl_transaksi": DateFormat('y-MM-dd').format(DateTime.now()),
          "tgl_valuta": backDate
              ? DateFormat('y-MM-dd').format(tglBackDate!)
              : DateFormat('y-MM-dd').format(DateTime.now()),
          "batch": users!.batch,
          "trx_type": "TRX",
          "trx_code": backDate ? "110" : "100",
          "otor": "0",
          "kode_trn": setupTransModel == null ? "" : setupTransModel!.kdTrans,
          "nama_dr": nosbbdeb.text,
          "dracc": namaSbbDeb.text,
          "nama_cr": nossbcre.text,
          "cracc": namaSbbCre.text,
          "rrn": invoice,
          "no_dokumen": nomorDok.text,
          "no_ref": nomorRef.text,
          "nominal": double.parse(nominal.text
              .replaceAll("Rp ", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")),
          "keterangan": keterangan.text,
          "kode_pt": users!.kodePt,
          "kode_kantor": users!.kodeKantor,
          "kode_induk": users!.kodeInduk,
          "sts_validasi": "N",
          "kode_ao_dr": aoModel == null ? "" : aoModel!.kode,
          "kode_coll": "",
          "kode_ao_cr": aoModelKRedit == null ? "" : aoModelKRedit!.kode,
          "userinput": users!.namauser,
          "userterm": "114.80.90.54",
          "keterangan_otorisasi": "Melebihi Maksimal Limit Transaksi",
          "inputtgljam": DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now()),
          "otoruser": "",
          "otorterm": "",
          "otortgljam": "",
          "flag_trn": "0",
          "merchant": "",
          "source_trx": "",
          "status": "PENDING",
          "modul": "Satu Transaksi",
        };

        print("REQUEST $data");
        Setuprepository.setup(token, NetworkURL.transaksi(), jsonEncode(data))
            .then((value) {
          Navigator.pop(context);
          if (value['status'] == "success") {
            getTransaksi();
            clear();
            informationDialog(context, "Information", value['message']);
          } else {
            informationDialog(context, "Warning", value['message']);
          }
        });
      } else {
        DialogCustom().showLoading(context);
        var invoice = DateTime.now().millisecondsSinceEpoch.toString();
        var data = {
          "tgl_transaksi": DateFormat('y-MM-dd').format(DateTime.now()),
          "tgl_valuta": backDate
              ? DateFormat('y-MM-dd').format(tglBackDate!)
              : DateFormat('y-MM-dd').format(DateTime.now()),
          "batch": users!.batch,
          "trx_type": "TRX",
          "trx_code": backDate ? "110" : "100",
          "otor": "0",
          "kode_trn": setupTransModel == null ? "" : setupTransModel!.kdTrans,
          "nama_dr": nosbbdeb.text,
          "dracc": namaSbbDeb.text,
          "nama_cr": nossbcre.text,
          "cracc": namaSbbCre.text,
          "rrn": invoice,
          "no_dokumen": nomorDok.text,
          "no_ref": nomorRef.text,
          "nominal": double.parse(nominal.text
              .replaceAll("Rp ", "")
              .replaceAll(".", "")
              .replaceAll(",", ".")),
          "keterangan": keterangan.text,
          "kode_pt": users!.kodePt,
          "kode_kantor": users!.kodeKantor,
          "kode_induk": users!.kodeInduk,
          "sts_validasi": "N",
          "kode_ao_dr": aoModel == null ? "" : aoModel!.kode,
          "kode_coll": "",
          "kode_ao_cr": aoModelKRedit == null ? "" : aoModelKRedit!.kode,
          "userinput": users!.namauser,
          "userterm": "114.80.90.54",
          "inputtgljam": DateFormat('y-MM-dd HH:mm:ss').format(DateTime.now()),
          "otoruser": "",
          "otorterm": "",
          "otortgljam": "",
          "flag_trn": "0",
          "merchant": "",
          "source_trx": "",
          "status": "COMPLETED",
          "modul": "Satu Transaksi",
        };
        Setuprepository.setup(token, NetworkURL.transaksi(), jsonEncode(data))
            .then((value) {
          Navigator.pop(context);
          if (value['status'] == "success") {
            getTransaksi();
            clear();
            informationDialog(context, "Information", value['message']);
          } else {
            informationDialog(context, "Warning", value['message']);
          }
        });
      }
    } else {
      informationDialog(context, "Warning", "Tidak bisa melakukan transaksi");
    }
  }

  cancelKode() async {
    inqueryGlModelcre = null;
    inqueryGlModelcre = null;
    setupTransModel = null;
    namaTransaksi.clear();
    namaSbbCre.clear();
    nossbcre.clear();
    nosbbdeb.clear();
    namaSbbDeb.clear();
    notifyListeners();
  }

  pilihAoModelKredit(AoModel value) {
    aoModelKRedit = value;
    notifyListeners();
  }
}
