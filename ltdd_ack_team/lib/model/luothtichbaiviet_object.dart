class LTBVObject {
  final int ID_NGUOITHICH;
  final int ID_BAIVIET;
  final int TRANGTHAI;
  LTBVObject(this.ID_NGUOITHICH, this.ID_BAIVIET, this.TRANGTHAI);
  LTBVObject.fromJson(Map<String, dynamic> res)
      : ID_NGUOITHICH = res['ID_NGUOITHICH'],
        ID_BAIVIET = res['ID_BAIVIET'],
        TRANGTHAI = res['TRANGTHAI'];
}
