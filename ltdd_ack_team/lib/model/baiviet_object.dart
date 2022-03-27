class BaiVietObject {
  final int ID;
  final String HINHANH;
  final int ID_DIADANH;
  final int ID_NGUOIDANG;
  final String NOIDUNG;
  final String NGAYDANG;
  final int THICH;
  final int KHONGTHICH;
  final int TRANGTHAI;
  BaiVietObject(this.ID, this.HINHANH, this.ID_DIADANH, this.ID_NGUOIDANG,
      this.NOIDUNG, this.NGAYDANG, this.THICH, this.KHONGTHICH, this.TRANGTHAI);
  BaiVietObject.fromJson(Map<String, dynamic> res)
      : ID = res['id'],
        HINHANH = res['HINHANH'],
        ID_DIADANH = res['ID_DIADANH'],
        ID_NGUOIDANG = res['ID_NGUOIDANG'],
        NOIDUNG = res['NOIDUNG'],
        NGAYDANG = res['NGAYDANG'],
        THICH = res['THICH'],
        KHONGTHICH = res['KHONGTHICH'],
        TRANGTHAI = res['TRANGTHAI'];
}
