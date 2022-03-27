import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/danhmuc_object.dart';
import '../diachiIP.dart';

class DanhMucProvider {
  static Future<List<dynamic>> readJsonData() async {
    var url = DiaChiIP().IP + "connect_db/danhmuc.php";
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "application/json"});
    var data1 = json.decode(response.body);
    return data1["data"];
  }

  static Future<List<DanhMucObject>> getAll() async {
    List<DanhMucObject> lsResult = [];
    List<dynamic> data1 = await readJsonData();
    lsResult = data1.map((e) => DanhMucObject.fromJson(e)).toList();
    return lsResult;
  }
}
