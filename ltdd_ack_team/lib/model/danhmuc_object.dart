class DanhMucObject {
  final int ID;
  final String TENDANHMUC;
  final String HINHANH;
  final int TRANGTHAI;

  DanhMucObject(
    this.ID,
    this.TENDANHMUC,
    this.HINHANH,
    this.TRANGTHAI,
  );

  DanhMucObject.fromJson(Map<String, dynamic> res)
      : ID = res["id"],
        TENDANHMUC = res["TENDANHMUC"],
        HINHANH = res["HINHANH"],
        TRANGTHAI = res["TRANGTHAI"];
}
