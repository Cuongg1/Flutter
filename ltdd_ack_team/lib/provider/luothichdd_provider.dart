import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/luothichdd_object.dart';
import '../diachiIP.dart';

class LTDDProvider {
  static Future<List<dynamic>> readJsonData(
      String ID_NGUOIYEUTHICH, String ID_DIADANHYEUTHICH) async {
    var url = DiaChiIP().IP + "connect_db/laytrangthai.php";
    var response = await http.post(Uri.parse(url), body: {
      'ID_NGUOIYEUTHICH': ID_NGUOIYEUTHICH,
      'ID_DIADANHYEUTHICH': ID_DIADANHYEUTHICH
    });
    var data1 = json.decode(response.body);
    return data1["data"];
  }

  static Future<List<LTDDObject>> getAll(
      String ID_NGUOIYEUTHICH, String ID_DIADANHYEUTHICH) async {
    List<LTDDObject> lsResult = [];
    List<dynamic> data1 =
        await readJsonData(ID_NGUOIYEUTHICH, ID_DIADANHYEUTHICH);
    lsResult = data1.map((e) => LTDDObject.fromJson(e)).toList();
    return lsResult;
  }
}
