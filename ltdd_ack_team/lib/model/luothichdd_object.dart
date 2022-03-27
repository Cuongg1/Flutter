class LTDDObject {
  final int ID_NGUOIYEUTHICH;
  final int ID_DIADANHYEUTHICH;
  final int TRANGTHAI;
  LTDDObject(this.ID_NGUOIYEUTHICH, this.ID_DIADANHYEUTHICH, this.TRANGTHAI);
  LTDDObject.fromJson(Map<String, dynamic> res)
      : ID_NGUOIYEUTHICH = res['ID_NGUOIYEUTHICH'],
        ID_DIADANHYEUTHICH = res['ID_DIADANHYEUTHICH'],
        TRANGTHAI = res['TRANGTHAI'];
}
