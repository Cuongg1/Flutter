class BaiVietTheoIDObject {
  final int ID;
  final String HINHANHBV;
  final int ID_DIADANH;
  final int ID_NGUOIDANG;
  final String NOIDUNG;
  final String NGAYDANG;
  final int THICH;
  final int KHONGTHICH;
  final int TRANGTHAIBV;
  final String HOTEN;
  final String DIACHI;
  final String SDT;
  final String PHAI;
  final String HINHANHND;
  final String EMAIL;
  final String MATKHAU;
  final int PHANQUYEN;
  final int TRANGTHAIND;
  BaiVietTheoIDObject(
      this.ID,
      this.HINHANHBV,
      this.ID_DIADANH,
      this.ID_NGUOIDANG,
      this.NOIDUNG,
      this.NGAYDANG,
      this.THICH,
      this.KHONGTHICH,
      this.TRANGTHAIBV,
      this.HOTEN,
      this.DIACHI,
      this.SDT,
      this.PHAI,
      this.HINHANHND,
      this.EMAIL,
      this.MATKHAU,
      this.PHANQUYEN,
      this.TRANGTHAIND);
  BaiVietTheoIDObject.fromJson(Map<String, dynamic> res)
      : ID = res['ID'],
        HINHANHBV = res['HINHANHBV'],
        ID_DIADANH = res['ID_DIADANH'],
        ID_NGUOIDANG = res['ID_NGUOIDANG'],
        NOIDUNG = res['NOIDUNG'],
        NGAYDANG = res['NGAYDANG'],
        THICH = res['THICH'],
        KHONGTHICH = res['KHONGTHICH'],
        TRANGTHAIBV = res['TRANGTHAIBV'],
        HOTEN = res["HOTEN"],
        DIACHI = res["DIACHI"],
        SDT = res["SDT"],
        PHAI = res["PHAI"],
        HINHANHND = res["HINHANHND"],
        EMAIL = res["EMAIL"],
        MATKHAU = res["MATKHAU"],
        PHANQUYEN = res["PHANQUYEN"],
        TRANGTHAIND = res["TRANGTHAIND"];
}
