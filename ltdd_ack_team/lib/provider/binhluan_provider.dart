import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/binhluan_object.dart';
import '../diachiIP.dart';

class BinhLuanProvider {
  static Future<List<dynamic>> readJsonData(String ID) async {
    var url = DiaChiIP().IP + "connect_db/binhluan.php";
    var response = await http.post(Uri.parse(url), body: {'id': ID});
    var data = json.decode(response.body);
    print(data);
    return data["data"];
  }

  static Future<List<BinhLuanObject>> getAll(String ID) async {
    List<BinhLuanObject> lsResult = [];
    List<dynamic> data = await readJsonData(ID);
    lsResult = data.map((e) => BinhLuanObject.fromJson(e)).toList();
    return lsResult;
  }
}
