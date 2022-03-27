class BaiVietLienQuanObject {
  final int ID;
  final String HINHANHBV;
  final int ID_DIADANH;
  final int ID_NGUOIDANG;
  final String NOIDUNG;
  final String NGAYDANG;
  final int THICH;
  final int KHONGTHICH;
  final int TRANGTHAIBV;
  final String TENDIADANH;
  final int ID_TINHTHANH;
  final int ID_DANHMUC;
  final String KINHDO;
  final String VIDO;
  final int LUOTTHICH;
  final String MOTA;
  final String HINHANHDD;
  final int TRANGTHAIDD;
  BaiVietLienQuanObject(
      this.ID,
      this.HINHANHBV,
      this.ID_DIADANH,
      this.ID_NGUOIDANG,
      this.NOIDUNG,
      this.NGAYDANG,
      this.THICH,
      this.KHONGTHICH,
      this.TRANGTHAIBV,
      this.TENDIADANH,
      this.ID_TINHTHANH,
      this.ID_DANHMUC,
      this.KINHDO,
      this.VIDO,
      this.LUOTTHICH,
      this.MOTA,
      this.HINHANHDD,
      this.TRANGTHAIDD);
  BaiVietLienQuanObject.fromJson(Map<String, dynamic> res)
      : ID = res['ID'],
        HINHANHBV = res['HINHANHBV'],
        ID_DIADANH = res['ID_DIADANH'],
        ID_NGUOIDANG = res['ID_NGUOIDANG'],
        NOIDUNG = res['NOIDUNG'],
        NGAYDANG = res['NGAYDANG'],
        THICH = res['THICH'],
        KHONGTHICH = res['KHONGTHICH'],
        TRANGTHAIBV = res['TRANGTHAIBV'],
        TENDIADANH = res["TENDIADANH"],
        ID_TINHTHANH = res["ID_TINHTHANH"],
        ID_DANHMUC = res["ID_DANHMUC"],
        KINHDO = res["KINHDO"],
        VIDO = res["VIDO"],
        LUOTTHICH = res["LUOTTHICH"],
        MOTA = res["MOTA"],
        HINHANHDD = res["HINHANHDD"],
        TRANGTHAIDD = res["TRANGTHAIDD"];
}
