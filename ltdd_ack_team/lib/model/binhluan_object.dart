class BinhLuanObject {
  final int id;
  final int ID_NGUOIDANG;
  final int ID_BAIVIET;
  final String NOIDUNG;
  final int TRANGTHAI;
  BinhLuanObject(
    this.id,
    this.ID_NGUOIDANG,
    this.ID_BAIVIET,
    this.NOIDUNG,
    this.TRANGTHAI,
  );
  BinhLuanObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        ID_NGUOIDANG = res['ID_NGUOIDANG'],
        ID_BAIVIET = res['ID_BAIVIET'],
        NOIDUNG = res['NOIDUNG'],
        TRANGTHAI = res['TRANGTHAI'];
}
