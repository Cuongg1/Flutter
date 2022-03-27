class TinhThanhObject {
  final int ID;
  final String TENTINHTHANH;
  final int ID_MIEN;
  final int TRANGTHAI;

  TinhThanhObject(
    this.ID,
    this.TENTINHTHANH,
    this.ID_MIEN,
    this.TRANGTHAI,
  );

  TinhThanhObject.fromJson(Map<String, dynamic> res)
      : ID = res["id"],
        TENTINHTHANH = res["TENTINHTHANH"],
        ID_MIEN = res["ID_MIEN"],
        TRANGTHAI = res["TRANGTHAI"];
}
