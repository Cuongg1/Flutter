class TaiKhoanObject {
  final int ID;
  final String HOTEN;
  final String DIACHI;
  final String SDT;
  final String PHAI;
  final String HINHANH;
  final String EMAIL;
  final String MATKHAU;
  final int PHANQUYEN;
  final int TRANGTHAI;

  TaiKhoanObject(this.ID, this.HOTEN, this.DIACHI, this.SDT, this.PHAI,
      this.HINHANH, this.EMAIL, this.MATKHAU, this.PHANQUYEN, this.TRANGTHAI);
  TaiKhoanObject.fromJson(Map<String, dynamic> res)
      : ID = res["id"],
        HOTEN = res["HOTEN"],
        DIACHI = res["DIACHI"],
        SDT = res["SDT"],
        PHAI = res["PHAI"],
        HINHANH = res["HINHANH"],
        EMAIL = res["EMAIL"],
        MATKHAU = res["MATKHAU"],
        PHANQUYEN = res["PHANQUYEN"],
        TRANGTHAI = res["TRANGTHAI"];
}
