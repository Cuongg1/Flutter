class DiaDanhObject {
  final int ID;
  final String TENDIADANH;
  final int ID_TINHTHANH;
  final int ID_DANHMUC;
  final String KINHDO;
  final String VIDO;
  late final int LUOTTHICH;
  final String HINHANH;
  final String MOTA;
  final int TRANGTHAI;

  DiaDanhObject(
    this.ID,
    this.TENDIADANH,
    this.ID_TINHTHANH,
    this.ID_DANHMUC,
    this.KINHDO,
    this.VIDO,
    this.LUOTTHICH,
    this.HINHANH,
    this.MOTA,
    this.TRANGTHAI,
  );

  DiaDanhObject.fromJson(Map<String, dynamic> res)
      : ID = res["id"],
        TENDIADANH = res["TENDIADANH"],
        ID_TINHTHANH = res["ID_TINHTHANH"],
        ID_DANHMUC = res["ID_DANHMUC"],
        KINHDO = res["KINHDO"],
        VIDO = res["VIDO"],
        LUOTTHICH = res["LUOTTHICH"],
        HINHANH = res["HINHANH"],
        MOTA = res["MOTA"],
        TRANGTHAI = res["TRANGTHAI"];
}
