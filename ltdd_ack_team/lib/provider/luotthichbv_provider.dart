import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/luothtichbaiviet_object.dart';
import '../diachiIP.dart';

class LTBVProvider {
  static Future<List<dynamic>> readJsonData(
      String ID_NGUOITHICH, String ID_BAIVIET) async {
    var url = DiaChiIP().IP + "connect_db/laytrangthailike.php";
    var response = await http.post(Uri.parse(url), body: {
      'ID_NGUOIYEUTHICH': ID_NGUOITHICH,
      'ID_DIADANHYEUTHICH': ID_BAIVIET
    });
    var data1 = json.decode(response.body);
    return data1["data"];
  }

  static Future<List<LTBVObject>> getAll(
      String ID_NGUOITHICH, String ID_BAIVIET) async {
    List<LTBVObject> lsResult = [];
    List<dynamic> data1 = await readJsonData(ID_NGUOITHICH, ID_BAIVIET);
    lsResult = data1.map((e) => LTBVObject.fromJson(e)).toList();
    return lsResult;
  }
}
