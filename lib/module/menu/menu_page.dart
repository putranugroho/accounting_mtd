import 'package:accounting/module/akses_point/akses_point_page.dart';
import 'package:accounting/module/aktivasi_users/aktivasi_users_page.dart';
import 'package:accounting/module/closing_eom/closing_eom_page.dart';
import 'package:accounting/module/dashboard/dashboard_page.dart';
import 'package:accounting/module/gl/gl_page.dart';
import 'package:accounting/module/hutang_piutang/hutang_piutang_page.dart';
import 'package:accounting/module/hutang_piutang/laporan_hutang_piutang_page.dart';
import 'package:accounting/module/inventaris/jual_beli/jual_beli_page.dart';
import 'package:accounting/module/inventaris/laporan/laporan_inventaris_page.dart';
import 'package:accounting/module/inventaris/otorisasi/otorisasi_inventaris_page.dart';
import 'package:accounting/module/inventaris/penempatan/penempatan_page.dart';
import 'package:accounting/module/inventaris/pengadaan/pengadaan_page.dart';
import 'package:accounting/module/inventaris/revaluasi/revaluasi_page.dart';
import 'package:accounting/module/jurnal/jurnal_page.dart';
import 'package:accounting/module/laba_rugi/laba_rugi_berjalan_page.dart';
import 'package:accounting/module/laba_rugi/laba_rugi_periode_page.dart';
import 'package:accounting/module/level_user/level_user_page.dart';
import 'package:accounting/module/master/ao/ao_page.dart';
import 'package:accounting/module/master/bank/bank_page.dart';
import 'package:accounting/module/master/customer/customer_page.dart';
import 'package:accounting/module/master/laporan/laporan_master_page.dart';
import 'package:accounting/module/master/master_barang/master_barang_page.dart';
import 'package:accounting/module/master/master_barcode/master_barcode_page.dart';
import 'package:accounting/module/master/master_mover/master_mover_page.dart';
import 'package:accounting/module/master/master_user/master_user_page.dart';
import 'package:accounting/module/master/otorisasi/otorisasi_master_page.dart';
// import 'package:accounting/module/master/terminal/akses_point_page.dart';
import 'package:accounting/module/master/terminal/user_akses_page.dart';
import 'package:accounting/module/master/users/users_page.dart';
import 'package:accounting/module/menu/menu_notifier.dart';
import 'package:accounting/module/menu/menu_widget.dart';
import 'package:accounting/module/neraca/neraca_berjalan_page.dart';
import 'package:accounting/module/pejabat/pejabat_page.dart';
import 'package:accounting/module/pembayaran_hutang/pembayaran_hutang_page.dart';
import 'package:accounting/module/perantara/perantara_aktiva_page.dart';
import 'package:accounting/module/perantara/perantara_pasiva_page.dart';
import 'package:accounting/module/rekonsiliasi/rekonsiliasi_aset_page.dart';
import 'package:accounting/module/rekonsiliasi/rekonsiliasi_bank_page.dart';
import 'package:accounting/module/rekonsiliasi/rekonsiliasi_hutang_page.dart';
import 'package:accounting/module/rekonsiliasi/rekonsiliasi_perantara_page.dart';
import 'package:accounting/module/rekonsiliasi/rekonsiliasi_perantara_pasiva_page.dart';
import 'package:accounting/module/rekonsiliasi/rekonsiliasi_piutang_page.dart';
import 'package:accounting/module/rekonsiliasi/rekonsiliasi_transaksi_pending_page.dart';
import 'package:accounting/module/setup/aktivasi/aktivasi_page.dart';
import 'package:accounting/module/setup/coa/coa_page.dart';
import 'package:accounting/module/setup/gol_barang/golongan_barang_page.dart';
import 'package:accounting/module/setup/golongan_aset/golongan_aset_page.dart';
import 'package:accounting/module/setup/jabatan/jabatan_page.dart';
import 'package:accounting/module/setup/jenis_barang/jenis_barang_page.dart';
import 'package:accounting/module/setup/kantor/kantor_page.dart';
import 'package:accounting/module/setup/kategori_barang/kategori_barang_page.dart';
import 'package:accounting/module/setup/kel_barang/kelompok_barang_page.dart';
import 'package:accounting/module/setup/kelompok_aset/kelompok_aset_page.dart';
import 'package:accounting/module/setup/laporan/laporan_setup_page.dart';
import 'package:accounting/module/setup/level/level_page.dart';
import 'package:accounting/module/setup/pajak/setup_pajak_page.dart';
import 'package:accounting/module/setup/penyusutan/penyusutan_page.dart';
import 'package:accounting/module/setup/perusahaan/perusahaan_page.dart';
import 'package:accounting/module/setup/satuan_barang/satuan_barang_page.dart';
import 'package:accounting/module/setup/sbb_hutang_piutang/sbb_hutang_piutang_page.dart';
import 'package:accounting/module/setup/sbb_kas/setup_sbb_page.dart';
import 'package:accounting/module/setup/sbb_khsus/sbb_khusus_page.dart';
import 'package:accounting/module/setup/sbb_khsus/tambah_kelompok_sbb_khusus_page.dart';
import 'package:accounting/module/setup/setup_transaksi/setup_transaksi_page.dart';
import 'package:accounting/module/setup/status_pengiriman/status_pengiriman_page.dart';
import 'package:accounting/module/setup_closing_eom/setup_closing_eom_page.dart';
import 'package:accounting/module/setup_otorisasi/setup_otorisasi_page.dart';
import 'package:accounting/module/transaksi/back_date/back_date_page.dart';
import 'package:accounting/module/transaksi/bank/bank_transaksi_page.dart';
import 'package:accounting/module/transaksi/banyak_transaksi/banyak_transaksi_page.dart';
import 'package:accounting/module/transaksi/bayar_dimuka/bayar_dimuka_page.dart';
import 'package:accounting/module/transaksi/hutang/hutang_page.dart';
import 'package:accounting/module/transaksi/kas_kecil/kas_kecil_page.dart';
import 'package:accounting/module/transaksi/kas_kecil/kasbon_page.dart';
import 'package:accounting/module/transaksi/kas_kecil/laporan_kas_kecil_page.dart';
import 'package:accounting/module/transaksi/koreksi_barang/koreksi_barang_page.dart';
import 'package:accounting/module/transaksi/laporan/laporan_transaksi_page.dart';
import 'package:accounting/module/transaksi/mutasi_barang/mutasi_barang_page.dart';
import 'package:accounting/module/transaksi/otorisasi/otorisasi_transaksi_page.dart';
import 'package:accounting/module/transaksi/pembatalan_transaksi/pembatalan_transaksi_page.dart';
import 'package:accounting/module/transaksi/piutang/piutang_page.dart';
import 'package:accounting/module/transaksi/satu_transaksi/satu_transaksi_page.dart';
import 'package:accounting/module/transaksi/penerimaan/penerimaan_page.dart';
import 'package:accounting/module/transaksi/pengeluaran/pengeluaran_page.dart';
import 'package:accounting/module/transaksi/tracking_pengiriman/tracking_pengiriman_page.dart';
import 'package:accounting/module/transaksi/transaksi_hutang/transaksi_hutang_page.dart';
import 'package:accounting/module/user_akses_point/user_akses_point_page.dart';
import 'package:accounting/utils/colors.dart';
import 'package:accounting/utils/images_path.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../neraca/neraca_periode_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuNotifier(context: context),
      child: Consumer<MenuNotifier>(
        builder: (context, value, child) => SafeArea(
            child: Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 340,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color: colorPrimary),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () => value.gantimenu(0),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.dashboard,
                                    height: 30,
                                    color: value.page == 0 ? Colors.white : Colors.white70,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Dashboard",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: value.page == 0 ? Colors.white : Colors.white70,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          MenuSetupWidget(value: value),
                          const SizedBox(
                            height: 24,
                          ),
                          MenuMasterWidget(
                            value: value,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          MenuTransaksiWidget(value: value),
                          const SizedBox(
                            height: 24,
                          ),
                          MenuHutangPiutangWidget(value: value),
                          const SizedBox(
                            height: 24,
                          ),
                          MenuInventarisWidget(value: value),
                          const SizedBox(
                            height: 24,
                          ),
                          MenuLaporanWidget(value: value),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () => value.gantimenu(26),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              decoration: BoxDecoration(
                                color: value.page == 26 ? Colors.white : Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.user,
                                    height: 30,
                                    color: value.page == 26 ? Colors.black : Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "AKTIVASI USER",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: value.page == 26 ? Colors.black : Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => value.gantimenu(28),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              decoration: BoxDecoration(
                                color: value.page == 28 ? Colors.white : Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.settings,
                                    height: 30,
                                    color: value.page == 28 ? Colors.black : Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "SETINGS",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: value.page == 28 ? Colors.black : Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 125, 228)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              value.users?.namauser ?? "Memuat user...",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () {
                              value.confirm();
                            },
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    value.confirm();
                                  },
                                  child: Image.asset(
                                    ImageAssets.logout,
                                    height: 30,
                                    color: value.page == 30 ? Colors.black : Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "SIGN OUT",
                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: value.page == 0
                      ? const DashboardPage()
                      : value.page == 1
                          ? const KantorPage()
                          : value.page == 2
                              ? const CoaPage()
                              : value.page == 3
                                  ? const PenyusutanPage()
                                  : value.page == 4
                                      ? const SetupTransaksiPage()
                                      : value.page == 5
                                          ? const LaporanSetupPage()
                                          : value.page == 6
                                              ? const UsersPage()
                                              : value.page == 7
                                                  ? const BankPage()
                                                  : value.page == 8
                                                      ? const CustomerPage()
                                                      : value.page == 9
                                                          ? const OtorisasiMasterPage()
                                                          : value.page == 10
                                                              ? const LaporanMasterPage()
                                                              : value.page == 11
                                                                  ? const PengadaanPage()
                                                                  : value.page == 12
                                                                      ? const PenempatanPage()
                                                                      : value.page == 13
                                                                          ? const RevaluasiPage()
                                                                          : value.page == 14
                                                                              ? const JualBeliPage()
                                                                              : value.page == 15
                                                                                  ? const OtorisasiInventarisPage()
                                                                                  : value.page == 16
                                                                                      ? const LaporanInventarisPage()
                                                                                      : value.page == 17
                                                                                          ? const SatuTransaksiPage()
                                                                                          : value.page == 18
                                                                                              ? const BanyakTransaksiPage()
                                                                                              : value.page == 19
                                                                                                  ? const KasKecilPage()
                                                                                                  : value.page == 20
                                                                                                      ? const BankTransaksiPage()
                                                                                                      : value.page == 21
                                                                                                          ? const HutangPage()
                                                                                                          : value.page == 22
                                                                                                              ? const PiutangPage()
                                                                                                              : value.page == 23
                                                                                                                  ? const BackDatePage()
                                                                                                                  : value.page == 24
                                                                                                                      ? const OtorisasiTransaksiPage()
                                                                                                                      : value.page == 25
                                                                                                                          ? const LaporanTransaksiPage()
                                                                                                                          : value.page == 26
                                                                                                                              ? const AktivasiUsersPage()
                                                                                                                              : value.page == 27
                                                                                                                                  ? const ClosingEomPage()
                                                                                                                                  : value.page == 28
                                                                                                                                      ? const PerusahaanPage()
                                                                                                                                      : value.page ==
                                                                                                                                              29
                                                                                                                                          ? const JabatanPage()
                                                                                                                                          : value.page ==
                                                                                                                                                  30
                                                                                                                                              ? const PejabatPage()
                                                                                                                                              : value.page ==
                                                                                                                                                      31
                                                                                                                                                  ? const LevelPage()
                                                                                                                                                  : value.page == 32
                                                                                                                                                      ? const SetupPajakPage()
                                                                                                                                                      : value.page == 33
                                                                                                                                                          ? const KelompokAsetPage()
                                                                                                                                                          : value.page == 34
                                                                                                                                                              ? const GolonganAsetPage()
                                                                                                                                                              : value.page == 35
                                                                                                                                                                  ? const AoPage()
                                                                                                                                                                  : value.page == 36
                                                                                                                                                                      ? const AktivasiPage()
                                                                                                                                                                      : value.page == 37
                                                                                                                                                                          ? const SbbKhususPage()
                                                                                                                                                                          : value.page == 38
                                                                                                                                                                              ? const SetupClosingEomPage()
                                                                                                                                                                              : value.page == 39
                                                                                                                                                                                  ? const SetupOtorisasiPage()
                                                                                                                                                                                  : value.page == 43
                                                                                                                                                                                      ? const JurnalPage()
                                                                                                                                                                                      : value.page == 44
                                                                                                                                                                                          ? const NeracaBerjalanPage()
                                                                                                                                                                                          : value.page == 45
                                                                                                                                                                                              ? const NeracaPeriodePage()
                                                                                                                                                                                              : value.page == 46
                                                                                                                                                                                                  ? const LabaRugiBerjalanPage()
                                                                                                                                                                                                  : value.page == 47
                                                                                                                                                                                                      ? const TambahKelompokSbbKhususPage()
                                                                                                                                                                                                      : value.page == 48
                                                                                                                                                                                                          ? const GlPage()
                                                                                                                                                                                                          : value.page == 49
                                                                                                                                                                                                              ? const LabaRugiPeriodePage()
                                                                                                                                                                                                              : value.page == 50
                                                                                                                                                                                                                  ? const RekonsiliasiBankPage()
                                                                                                                                                                                                                  : value.page == 51
                                                                                                                                                                                                                      ? const RekonsiliasiHutangPage()
                                                                                                                                                                                                                      : value.page == 52
                                                                                                                                                                                                                          ? const RekonsiliasiPiutangPage()
                                                                                                                                                                                                                          : value.page == 53
                                                                                                                                                                                                                              ? const RekonsiliasiAsetPage()
                                                                                                                                                                                                                              : value.page == 54
                                                                                                                                                                                                                                  ? const RekonsiliasiTransaksiPendingPage()
                                                                                                                                                                                                                                  : value.page == 55
                                                                                                                                                                                                                                      ? const RekonsiliasiPerantaraPage()
                                                                                                                                                                                                                                      : value.page == 57
                                                                                                                                                                                                                                          ? const PerantaraAktivaPage()
                                                                                                                                                                                                                                          : value.page == 58
                                                                                                                                                                                                                                              ? const PembayaranHutangPage()
                                                                                                                                                                                                                                              : value.page == 59
                                                                                                                                                                                                                                                  ? const BayarDimukaPage()
                                                                                                                                                                                                                                                  : value.page == 60
                                                                                                                                                                                                                                                      ? const LevelUserPage()
                                                                                                                                                                                                                                                      : value.page == 61
                                                                                                                                                                                                                                                          ? const HutangPiutangPage(tipe: 1)
                                                                                                                                                                                                                                                          : value.page == 62
                                                                                                                                                                                                                                                              ? const KasbonPage()
                                                                                                                                                                                                                                                              : value.page == 65
                                                                                                                                                                                                                                                                  ? const SbbHutangPiutangPage()
                                                                                                                                                                                                                                                                  : value.page == 66
                                                                                                                                                                                                                                                                      ? const AksesPointPage()
                                                                                                                                                                                                                                                                      : value.page == 67
                                                                                                                                                                                                                                                                          ? const PembatalanTransaksiPage()
                                                                                                                                                                                                                                                                          : value.page == 68
                                                                                                                                                                                                                                                                              ? const UserAksesPointPage()
                                                                                                                                                                                                                                                                              : value.page == 69
                                                                                                                                                                                                                                                                                  ? const SetupSbbPage()
                                                                                                                                                                                                                                                                                  : value.page == 70
                                                                                                                                                                                                                                                                                      ? const LaporanKasKecilPage()
                                                                                                                                                                                                                                                                                      : value.page == 71
                                                                                                                                                                                                                                                                                          ? const LaporanHutangPiutangPage(
                                                                                                                                                                                                                                                                                              tipe: 1,
                                                                                                                                                                                                                                                                                            )
                                                                                                                                                                                                                                                                                          : value.page == 72
                                                                                                                                                                                                                                                                                              ? const PenerimaanPage()
                                                                                                                                                                                                                                                                                              : value.page == 73
                                                                                                                                                                                                                                                                                                  ? const PengeluaranPage()
                                                                                                                                                                                                                                                                                                  : value.page == 74
                                                                                                                                                                                                                                                                                                      ? const GolonganBarangPage()
                                                                                                                                                                                                                                                                                                      : value.page == 75
                                                                                                                                                                                                                                                                                                          ? const KelompokBarangPage()
                                                                                                                                                                                                                                                                                                          : value.page == 76
                                                                                                                                                                                                                                                                                                              ? const JenisBarangPage()
                                                                                                                                                                                                                                                                                                              : value.page == 77
                                                                                                                                                                                                                                                                                                                  ? const KategoriBarangPage()
                                                                                                                                                                                                                                                                                                                  : value.page == 78
                                                                                                                                                                                                                                                                                                                      ? const StatusPengirimanPage()
                                                                                                                                                                                                                                                                                                                      : value.page == 79
                                                                                                                                                                                                                                                                                                                          ? const MasterUserPage()
                                                                                                                                                                                                                                                                                                                          : value.page == 80
                                                                                                                                                                                                                                                                                                                              ? const MasterBarangPage()
                                                                                                                                                                                                                                                                                                                              : value.page == 81
                                                                                                                                                                                                                                                                                                                                  ? const MasterMoverPage()
                                                                                                                                                                                                                                                                                                                                  : value.page == 82
                                                                                                                                                                                                                                                                                                                                      ? const MutasiBarangPage()
                                                                                                                                                                                                                                                                                                                                      : value.page == 83
                                                                                                                                                                                                                                                                                                                                          ? const TrackingPengirimanPage()
                                                                                                                                                                                                                                                                                                                                          : value.page == 84
                                                                                                                                                                                                                                                                                                                                              ? const MasterBarcodePage()
                                                                                                                                                                                                                                                                                                                                              : value.page == 85
                                                                                                                                                                                                                                                                                                                                                  ? const SatuanBarangPage()
                                                                                                                                                                                                                                                                                                                                                  : value.page == 86
                                                                                                                                                                                                                                                                                                                                                      ? const KoreksiBarangPage()
                                                                                                                                                                                                                                                                                                                                                      : Container())
            ],
          ),
        )),
      ),
    );
  }
}
