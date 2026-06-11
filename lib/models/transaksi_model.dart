import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class TransaksiModel {
  static int _toInt(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is double) return value.toInt();

    return int.tryParse(value.toString()) ?? defaultValue;
  }

  const TransaksiModel({
    required this.id,
    required this.tglTrans,
    required this.tglVal,
    required this.transUser,
    required this.batch,
    required this.noTrans,
    required this.kodeTrans,
    required this.debetAcc,
    required this.namaDebet,
    required this.creditAcc,
    required this.namaCredit,
    required this.rrn,
    required this.nomorDok,
    required this.nomorRef,
    required this.nominal,
    required this.keterangan,
    required this.kodePt,
    required this.kodeKantor,
    required this.kodeInduk,
    required this.statusValidasi,
    required this.kodeAoDebet,
    required this.kodeAoCredit,
    required this.statusTransaksi,
    required this.transid,
    required this.merchant,
    required this.sourceTrx,
    required this.inpuser,
    required this.inptgljam,
    required this.inpterm,
    required this.chguser,
    required this.chgtgljam,
    required this.chgterm,
    required this.autuser,
    required this.auttgljam,
    required this.autterm,
    required this.flagTrn,
    required this.autrevuser,
    required this.autrevtgljam,
    required this.autrevterm,
    required this.kodeColl,
    required this.trxCode,
    required this.otor,
    required this.alasan,
    required this.noKontrak,
    required this.noInvoice,
  });

  final int id;
  final String tglTrans;
  final String tglVal;
  final String transUser;
  final String batch;
  final int noTrans;
  final String kodeTrans;
  final String debetAcc;
  final String namaDebet;
  final String creditAcc;
  final String namaCredit;
  final String rrn;
  final String nomorDok;
  final String nomorRef;
  final String nominal;
  final String keterangan;
  final String kodePt;
  final String kodeKantor;
  final String kodeInduk;
  final String statusValidasi;
  final String kodeAoDebet;
  final String kodeAoCredit;
  final String statusTransaksi;
  final String transid;
  final String merchant;
  final String sourceTrx;
  final String inpuser;
  final String inptgljam;
  final String inpterm;
  final dynamic chguser;
  final dynamic chgtgljam;
  final dynamic chgterm;
  final String autuser;
  final dynamic auttgljam;
  final String autterm;
  final String flagTrn;
  final dynamic autrevuser;
  final dynamic autrevtgljam;
  final dynamic autrevterm;
  final String kodeColl;
  final String trxCode;
  final String otor;
  final dynamic alasan;
  final String noKontrak;
  final String noInvoice;

  factory TransaksiModel.fromJson(Map<String, dynamic> json) => TransaksiModel(
      id: _toInt(json['id']),
      tglTrans: json['tgl_trans'].toString(),
      tglVal: json['tgl_val'].toString(),
      transUser: json['trans_user'].toString(),
      batch: json['batch'].toString(),
      noTrans: _toInt(json['no_trans']),
      kodeTrans: json['kode_trans'].toString(),
      debetAcc: json['debet_acc'].toString(),
      namaDebet: json['nama_debet'].toString(),
      creditAcc: json['credit_acc'].toString(),
      namaCredit: json['nama_credit'].toString(),
      rrn: json['rrn'].toString(),
      nomorDok: json['nomor_dok'].toString(),
      nomorRef: json['nomor_ref'].toString(),
      nominal: json['nominal'].toString(),
      keterangan: json['keterangan'].toString(),
      kodePt: json['kode_pt'].toString(),
      kodeKantor: json['kode_kantor'].toString(),
      kodeInduk: json['kode_induk'].toString(),
      statusValidasi: json['status_validasi'].toString(),
      kodeAoDebet: json['kode_ao_debet'].toString(),
      kodeAoCredit: json['kode_ao_credit'].toString(),
      statusTransaksi: json['status_transaksi'].toString(),
      transid: json['transid'].toString(),
      merchant: json['merchant'].toString(),
      sourceTrx: json['source_trx'].toString(),
      inpuser: json['inpuser'].toString(),
      inptgljam: json['inptgljam'].toString(),
      inpterm: json['inpterm'].toString(),
      chguser: json['chguser'] as dynamic,
      chgtgljam: json['chgtgljam'] as dynamic,
      chgterm: json['chgterm'] as dynamic,
      autuser: json['autuser'].toString(),
      auttgljam: json['auttgljam'] as dynamic,
      autterm: json['autterm'].toString(),
      flagTrn: json['flag_trn'].toString(),
      autrevuser: json['autrevuser'] as dynamic,
      autrevtgljam: json['autrevtgljam'] as dynamic,
      autrevterm: json['autrevterm'] as dynamic,
      kodeColl: json['kode_coll'].toString(),
      trxCode: json['trx_code'].toString(),
      otor: json['otor'].toString(),
      alasan: json['alasan'] as dynamic,
      noKontrak: json['no_kontrak'].toString(),
      noInvoice: json['no_invoice'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'tgl_trans': tglTrans,
        'tgl_val': tglVal,
        'trans_user': transUser,
        'batch': batch,
        'no_trans': noTrans,
        'kode_trans': kodeTrans,
        'debet_acc': debetAcc,
        'nama_debet': namaDebet,
        'credit_acc': creditAcc,
        'nama_credit': namaCredit,
        'rrn': rrn,
        'nomor_dok': nomorDok,
        'nomor_ref': nomorRef,
        'nominal': nominal,
        'keterangan': keterangan,
        'kode_pt': kodePt,
        'kode_kantor': kodeKantor,
        'kode_induk': kodeInduk,
        'status_validasi': statusValidasi,
        'kode_ao_debet': kodeAoDebet,
        'kode_ao_credit': kodeAoCredit,
        'status_transaksi': statusTransaksi,
        'transid': transid,
        'merchant': merchant,
        'source_trx': sourceTrx,
        'inpuser': inpuser,
        'inptgljam': inptgljam,
        'inpterm': inpterm,
        'chguser': chguser,
        'chgtgljam': chgtgljam,
        'chgterm': chgterm,
        'autuser': autuser,
        'auttgljam': auttgljam,
        'autterm': autterm,
        'flag_trn': flagTrn,
        'autrevuser': autrevuser,
        'autrevtgljam': autrevtgljam,
        'autrevterm': autrevterm,
        'kode_coll': kodeColl,
        'trx_code': trxCode,
        'otor': otor,
        'alasan': alasan,
        'no_kontrak': noKontrak,
        'no_invoice': noInvoice
      };

  TransaksiModel clone() => TransaksiModel(
      id: id,
      tglTrans: tglTrans,
      tglVal: tglVal,
      transUser: transUser,
      batch: batch,
      noTrans: noTrans,
      kodeTrans: kodeTrans,
      debetAcc: debetAcc,
      namaDebet: namaDebet,
      creditAcc: creditAcc,
      namaCredit: namaCredit,
      rrn: rrn,
      nomorDok: nomorDok,
      nomorRef: nomorRef,
      nominal: nominal,
      keterangan: keterangan,
      kodePt: kodePt,
      kodeKantor: kodeKantor,
      kodeInduk: kodeInduk,
      statusValidasi: statusValidasi,
      kodeAoDebet: kodeAoDebet,
      kodeAoCredit: kodeAoCredit,
      statusTransaksi: statusTransaksi,
      transid: transid,
      merchant: merchant,
      sourceTrx: sourceTrx,
      inpuser: inpuser,
      inptgljam: inptgljam,
      inpterm: inpterm,
      chguser: chguser,
      chgtgljam: chgtgljam,
      chgterm: chgterm,
      autuser: autuser,
      auttgljam: auttgljam,
      autterm: autterm,
      flagTrn: flagTrn,
      autrevuser: autrevuser,
      autrevtgljam: autrevtgljam,
      autrevterm: autrevterm,
      kodeColl: kodeColl,
      trxCode: trxCode,
      otor: otor,
      alasan: alasan,
      noKontrak: noKontrak,
      noInvoice: noInvoice);

  TransaksiModel copyWith(
          {int? id,
          String? tglTrans,
          String? tglVal,
          String? transUser,
          String? batch,
          int? noTrans,
          String? kodeTrans,
          String? debetAcc,
          String? namaDebet,
          String? creditAcc,
          String? namaCredit,
          String? rrn,
          String? nomorDok,
          String? nomorRef,
          String? nominal,
          String? keterangan,
          String? kodePt,
          String? kodeKantor,
          String? kodeInduk,
          String? statusValidasi,
          String? kodeAoDebet,
          String? kodeAoCredit,
          String? statusTransaksi,
          String? transid,
          String? merchant,
          String? sourceTrx,
          String? inpuser,
          String? inptgljam,
          String? inpterm,
          dynamic? chguser,
          dynamic? chgtgljam,
          dynamic? chgterm,
          String? autuser,
          dynamic? auttgljam,
          String? autterm,
          String? flagTrn,
          dynamic? autrevuser,
          dynamic? autrevtgljam,
          dynamic? autrevterm,
          String? kodeColl,
          String? trxCode,
          String? otor,
          dynamic? alasan,
          String? noKontrak,
          String? noInvoice}) =>
      TransaksiModel(
        id: id ?? this.id,
        tglTrans: tglTrans ?? this.tglTrans,
        tglVal: tglVal ?? this.tglVal,
        transUser: transUser ?? this.transUser,
        batch: batch ?? this.batch,
        noTrans: noTrans ?? this.noTrans,
        kodeTrans: kodeTrans ?? this.kodeTrans,
        debetAcc: debetAcc ?? this.debetAcc,
        namaDebet: namaDebet ?? this.namaDebet,
        creditAcc: creditAcc ?? this.creditAcc,
        namaCredit: namaCredit ?? this.namaCredit,
        rrn: rrn ?? this.rrn,
        nomorDok: nomorDok ?? this.nomorDok,
        nomorRef: nomorRef ?? this.nomorRef,
        nominal: nominal ?? this.nominal,
        keterangan: keterangan ?? this.keterangan,
        kodePt: kodePt ?? this.kodePt,
        kodeKantor: kodeKantor ?? this.kodeKantor,
        kodeInduk: kodeInduk ?? this.kodeInduk,
        statusValidasi: statusValidasi ?? this.statusValidasi,
        kodeAoDebet: kodeAoDebet ?? this.kodeAoDebet,
        kodeAoCredit: kodeAoCredit ?? this.kodeAoCredit,
        statusTransaksi: statusTransaksi ?? this.statusTransaksi,
        transid: transid ?? this.transid,
        merchant: merchant ?? this.merchant,
        sourceTrx: sourceTrx ?? this.sourceTrx,
        inpuser: inpuser ?? this.inpuser,
        inptgljam: inptgljam ?? this.inptgljam,
        inpterm: inpterm ?? this.inpterm,
        chguser: chguser ?? this.chguser,
        chgtgljam: chgtgljam ?? this.chgtgljam,
        chgterm: chgterm ?? this.chgterm,
        autuser: autuser ?? this.autuser,
        auttgljam: auttgljam ?? this.auttgljam,
        autterm: autterm ?? this.autterm,
        flagTrn: flagTrn ?? this.flagTrn,
        autrevuser: autrevuser ?? this.autrevuser,
        autrevtgljam: autrevtgljam ?? this.autrevtgljam,
        autrevterm: autrevterm ?? this.autrevterm,
        kodeColl: kodeColl ?? this.kodeColl,
        trxCode: trxCode ?? this.trxCode,
        otor: otor ?? this.otor,
        alasan: alasan ?? this.alasan,
        noKontrak: noKontrak ?? this.noKontrak,
        noInvoice: noInvoice ?? this.noInvoice,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransaksiModel &&
          id == other.id &&
          tglTrans == other.tglTrans &&
          tglVal == other.tglVal &&
          transUser == other.transUser &&
          batch == other.batch &&
          noTrans == other.noTrans &&
          kodeTrans == other.kodeTrans &&
          debetAcc == other.debetAcc &&
          namaDebet == other.namaDebet &&
          creditAcc == other.creditAcc &&
          namaCredit == other.namaCredit &&
          rrn == other.rrn &&
          nomorDok == other.nomorDok &&
          nomorRef == other.nomorRef &&
          nominal == other.nominal &&
          keterangan == other.keterangan &&
          kodePt == other.kodePt &&
          kodeKantor == other.kodeKantor &&
          kodeInduk == other.kodeInduk &&
          statusValidasi == other.statusValidasi &&
          kodeAoDebet == other.kodeAoDebet &&
          kodeAoCredit == other.kodeAoCredit &&
          statusTransaksi == other.statusTransaksi &&
          transid == other.transid &&
          merchant == other.merchant &&
          sourceTrx == other.sourceTrx &&
          inpuser == other.inpuser &&
          inptgljam == other.inptgljam &&
          inpterm == other.inpterm &&
          chguser == other.chguser &&
          chgtgljam == other.chgtgljam &&
          chgterm == other.chgterm &&
          autuser == other.autuser &&
          auttgljam == other.auttgljam &&
          autterm == other.autterm &&
          flagTrn == other.flagTrn &&
          autrevuser == other.autrevuser &&
          autrevtgljam == other.autrevtgljam &&
          autrevterm == other.autrevterm &&
          kodeColl == other.kodeColl &&
          trxCode == other.trxCode &&
          otor == other.otor &&
          alasan == other.alasan &&
          noKontrak == other.noKontrak &&
          noInvoice == other.noInvoice;

  @override
  int get hashCode =>
      id.hashCode ^
      tglTrans.hashCode ^
      tglVal.hashCode ^
      transUser.hashCode ^
      batch.hashCode ^
      noTrans.hashCode ^
      kodeTrans.hashCode ^
      debetAcc.hashCode ^
      namaDebet.hashCode ^
      creditAcc.hashCode ^
      namaCredit.hashCode ^
      rrn.hashCode ^
      nomorDok.hashCode ^
      nomorRef.hashCode ^
      nominal.hashCode ^
      keterangan.hashCode ^
      kodePt.hashCode ^
      kodeKantor.hashCode ^
      kodeInduk.hashCode ^
      statusValidasi.hashCode ^
      kodeAoDebet.hashCode ^
      kodeAoCredit.hashCode ^
      statusTransaksi.hashCode ^
      transid.hashCode ^
      merchant.hashCode ^
      sourceTrx.hashCode ^
      inpuser.hashCode ^
      inptgljam.hashCode ^
      inpterm.hashCode ^
      chguser.hashCode ^
      chgtgljam.hashCode ^
      chgterm.hashCode ^
      autuser.hashCode ^
      auttgljam.hashCode ^
      autterm.hashCode ^
      flagTrn.hashCode ^
      autrevuser.hashCode ^
      autrevtgljam.hashCode ^
      autrevterm.hashCode ^
      kodeColl.hashCode ^
      trxCode.hashCode ^
      otor.hashCode ^
      alasan.hashCode ^
      noKontrak.hashCode ^
      noInvoice.hashCode;
}
