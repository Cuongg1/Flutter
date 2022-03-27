class DDYeuThichObject {
  final String TENDIADANH;
  final int ID_TINHTHANH;
  final int ID_DANHMUC;
  final String KINHDO;
  final String VIDO;
  final String MOTA;
  final int LUOTTHICH;
  final String HINHANH;
  final int ID_NGUOIYEUTHICH;
  final int ID_DIADANHYEUTHICH;
  final String EMAIL;

  DDYeuThichObject(
      this.TENDIADANH,
      this.ID_TINHTHANH,
      this.ID_DANHMUC,
      this.KINHDO,
      this.VIDO,
      this.MOTA,
      this.LUOTTHICH,
      this.HINHANH,
      this.ID_NGUOIYEUTHICH,
      this.ID_DIADANHYEUTHICH,
      this.EMAIL);

  DDYeuThichObject.fromJson(Map<String, dynamic> res)
      : TENDIADANH = res['TENDIADANH'],
        ID_TINHTHANH = res['ID_TINHTHANH'],
        ID_DANHMUC = res['ID_DANHMUC'],
        KINHDO = res['KINHDO'],
        VIDO = res['VIDO'],
        MOTA = res['MOTA'],
        LUOTTHICH = res['LUOTTHICH'],
        HINHANH = res['HINHANH'],
        ID_NGUOIYEUTHICH = res['ID_NGUOIYEUTHICH'],
        ID_DIADANHYEUTHICH = res['ID_DIADANHYEUTHICH'],
        EMAIL = res['EMAIL'];
}
