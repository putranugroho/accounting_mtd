const token = "715f8ab555438f985b579844ea227767";
const xusername = "core@2023";
const xpassword = "corevalue@20231234";

const dev = false;

const url = dev ? "https://geacct.medtrans.id" : "https://geacct.medtrans.id";

const url2 = "https://core.metimes.id";

class NetworkURL {
  static String login() {
    return "$url/sign-in";
  }

  static String gerPerusahaan() {
    return "$url/perusahaan";
  }

  static String getKantor() {
    return "$url/kantor";
  }

  static String addKantor() {
    return "$url/kantor/add";
  }

  static String updateKantor() {
    return "$url/kantor/update";
  }

  static String deletedKantor() {
    return "$url/kantor/deleted";
  }

  static String getLevelJabatan() {
    return "$url/leveljabatan";
  }

  static String addLevelJabatan() {
    return "$url/leveljabatan/add";
  }

  static String updateLevelJabatan() {
    return "$url/leveljabatan/update";
  }

  static String deletedLevelJabatan() {
    return "$url/leveljabatan/deleted";
  }

  static String getjabatan() {
    return "$url/jabatan";
  }

  static String addJabatan() {
    return "$url/jabatan/add";
  }

  static String updatedJabatan() {
    return "$url/jabatan/update";
  }

  static String deletedJabatan() {
    return "$url/jabatan/deleted";
  }

  static String getPejabat() {
    return "$url/pejabat";
  }

  static String getInventaris() {
    return "$url/inventaris";
  }

  static String addInventaris() {
    return "$url/inventaris/add";
  }

  static String editInventaris() {
    return "$url/inventaris/update";
  }

  static String deleteInventaris() {
    return "$url/inventaris/deleted";
  }

  static String penempatan() {
    return "$url/inventaris/penempatan";
  }

  static String revaluasi() {
    return "$url/inventaris/revaluasi";
  }

  static String jual() {
    return "$url/inventaris/jual";
  }

  static String hapusaset() {
    return "$url/inventaris/hapusaset";
  }

  static String cariInventaris() {
    return "$url/inventaris/cari";
  }

  static String addPejabat() {
    return "$url/pejabat/add";
  }

  static String updatedPejabat() {
    return "$url/pejabat/update";
  }

  static String deletedPejabat() {
    return "$url/pejabat/deleted";
  }

  static String getMasterGl() {
    return "$url/mastergl";
  }

  static String getMasterGlSubtree() {
    return "$url/mastergl/subtree";
  }

  static String addMasterGl() {
    return "$url/mastergl/add";
  }

  static String editMasterGl() {
    return "$url/mastergl/update";
  }

  static String deleteMasterGl() {
    return "$url/mastergl/deleted";
  }

  static String tutup() {
    return "$url/mastergl/tutup";
  }

  static String getMetodePenyusutan() {
    return "$url/metode_penyusutan";
  }

  static String editMetodePenyusutan() {
    return "$url/metode_penyusutan/update";
  }

  static String getKelompokAset() {
    return "$url/kelompokaset";
  }

  static String addKelompokAset() {
    return "$url/kelompokaset/add";
  }

  static String editKelompokAset() {
    return "$url/kelompokaset/update";
  }

  static String deleteKelompokAset() {
    return "$url/kelompokaset/deleted";
  }

  static String getGolonganAset() {
    return "$url/golonganaset";
  }

  static String addGolonganAset() {
    return "$url/golonganaset/add";
  }

  static String editGolonganAset() {
    return "$url/golonganaset/update";
  }

  static String deleteGolonganAset() {
    return "$url/golonganaset/deleted";
  }

  static String getGolonganSbb() {
    return "$url/golongansbb";
  }

  static String addGolonganSbb() {
    return "$url/golongansbb/add";
  }

  static String editGolonganSbb() {
    return "$url/golongansbb/update";
  }

  static String deleteGolonganSbb() {
    return "$url/golongansbb/deleted";
  }

  static String getInqueryGL() {
    return "$url/mastergl/inquery";
  }

  static String getSbbKhusus() {
    return "$url/sbbkhusus";
  }

  static String perantara() {
    return "$url/perantara";
  }

  static String transaksiHutangPiutang() {
    return "$url/transaksiHutangPiutang";
  }

  static String addSbbKhusus() {
    return "$url/sbbkhusus/add";
  }

  static String editSbbKhusus() {
    return "$url/sbbkhusus/update";
  }

  static String deleteSbbKhusus() {
    return "$url/sbbkhusus/deleted";
  }

  static String getSetupTrans() {
    return "$url/setuptrans";
  }

  static String getSetupPajak() {
    return "$url/setuppajak";
  }

  static String editSetupPajak() {
    return "$url/setuppajak/update";
  }

  static String addSetupPajak() {
    return "$url/setuppajak/add";
  }

  static String deleteSetupPajak() {
    return "$url/setuppajak/deleted";
  }

  static String addSetupTrans() {
    return "$url/setuptrans/add";
  }

  static String editSetupTrans() {
    return "$url/setuptrans/update";
  }

  static String deleteSetupTrans() {
    return "$url/setuptrans/deleted";
  }

  static String getSetupKasKecil() {
    return "$url/setupkaskecil";
  }

  static String addSetupKasKecil() {
    return "$url/setupkaskecil/add";
  }

  static String bayarHutangPiutang() {
    return "$url/hutangpiutangdetail/bayar";
  }

  static String getSetupHutangPiutang() {
    return "$url/setuphutangpiutang";
  }

  static String addSetupHutangPiutang() {
    return "$url/setuphutangpiutang/add";
  }

  static String getusers() {
    return "$url/users";
  }

  static String addusers() {
    return "$url/users/add";
  }

  static String editusers() {
    return "$url/users/update";
  }

  static String deleteusers() {
    return "$url/users/deleted";
  }

  static String getAktivasi() {
    return "$url/aktivasi";
  }

  static String addAktivasi() {
    return "$url/aktivasi/add";
  }

  static String editAktivasi() {
    return "$url/aktivasi/update";
  }

  static String deleteAktivasi() {
    return "$url/aktivasi/deleted";
  }

  static String getCustomer() {
    return "$url/customerssupplier";
  }

  static String addCustomer() {
    return "$url/customerssupplier/add";
  }

  static String editCustomer() {
    return "$url/customerssupplier/update";
  }

  static String deleteCustomer() {
    return "$url/customerssupplier/deleted";
  }

  static String getAoMarketing() {
    return "$url/aomarketing";
  }

  static String addAoMarketing() {
    return "$url/aomarketing/add";
  }

  static String editAoMarketing() {
    return "$url/aomarketing/update";
  }

  static String deleteAoMarketing() {
    return "$url/aomarketing/deleted";
  }

  static String nonaktif() {
    return "$url/aomarketing/nonaktif";
  }

  static String getHutangPiutang() {
    return "$url/hutangpiutang";
  }

  static String addHutangPiutang() {
    return "$url/hutangpiutang/add";
  }

  static String editHutangPiutang() {
    return "$url/hutangpiutang/update";
  }

  static String deleteHutangPiutang() {
    return "$url/hutangpiutang/deleted";
  }

  static String searchHutangPiutang() {
    return "$url/hutangpiutangdetail/search";
  }

  static String getBank() {
    return "$url/bank";
  }

  static String getSandiBank() {
    return "$url/sandi-bank";
  }

  static String addBank() {
    return "$url/bank/add";
  }

  static String editBank() {
    return "$url/bank/update";
  }

  static String deleteBank() {
    return "$url/bank/deleted";
  }

  static String getClosingEom() {
    return "$url/closingeomsetup";
  }

  static String addClosingEom() {
    return "$url/closingeomsetup/add";
  }

  static String editClosingEom() {
    return "$url/closingeomsetup/update";
  }

  static String getModul() {
    return "$url/modul";
  }

  static String getLevelUsers() {
    return "$url/leveluser";
  }

  static String addLevelUsers() {
    return "$url/leveluser/add";
  }

  static String editLevelUsers() {
    return "$url/leveluser/update";
  }

  static String editLevelUsersModul() {
    return "$url/leveluser/updatemodul";
  }

  static String deletdLevelUsers() {
    return "$url/leveluser/deleted";
  }

  static String getKaryawan() {
    return "$url/karyawan";
  }

  static String getUserAksesPoint() {
    return "$url/user-akses-point";
  }

  static String addUserAksesPoint() {
    return "$url/user-akses-point/add";
  }

  static String deletedUserAksesPoint() {
    return "$url/user-akses-point/deleted";
  }

  static String getUsersAksesPointAll() {
    return "$url/user-akses-point/viewall";
  }

  static String otorisasi() {
    return "$url/General-ledger/otorisasi";
  }

  static String neracaBerjalan() {
    return "$url/report";
  }

  static String neracaBerjalanV2() {
    return "$url/neraca-berjalan";
  }

  static String labaRugiBerjalan() {
    return "$url/labarugi-berjalan";
  }

  static String saldoGl() {
    return "$url/saldo-gl";
  }

  static String transaksi() {
    return "$url/transaksi";
  }

  static String search() {
    return "$url/transaksi/search";
  }

  static String bayardimuka() {
    return "$url/transaksi/bayardimuka";
  }

  static String bayardimukahapus() {
    return "$url/transaksi/bayardimukahapus";
  }

  static String bayardimukaubah() {
    return "$url/transaksi/bayardimukaubah";
  }

  static String viewbayardimuka() {
    return "$url/bayardimuka";
  }

  static String view() {
    return "$url/transaksi/view";
  }

  static String viewnokontrak() {
    return "$url/viewnokontrak";
  }

  static String otorisasiTransaksi() {
    return "$url/transaksi/otorisasi";
  }

  static String batal() {
    return "$url/transaksi/batal";
  }

  static String auth() {
    return "$url/login";
  }

  static String cariKaryawan() {
    return "$url/karyawan/search";
  }

  static String cariUsers() {
    return "$url/users/search";
  }

  static String getAksesPoint() {
    return "$url/akses-point";
  }

  static String insertAksesPoint() {
    return "$url/akses-point/add";
  }

  static String editAksesPoint(int id) {
    return "$url/akses-point/$id";
  }

  static String deleteAksesPoint(int id) {
    return "$url/akses-point/$id";
  }

  static String getProvinsi() {
    return "$url2/provinsi";
  }

  static String getKota(String id) {
    return "$url2/kota?id=$id";
  }

  static String getKecamatan(String id) {
    return "$url2/kecamatan?id=$id";
  }

  static String getKelurahan(String id) {
    return "$url2/kelurahan?id=$id";
  }
}
