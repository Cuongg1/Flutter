import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/tinhthanh_object.dart';
import '../model/danhmuc_object.dart';
import '../diachiIP.dart';

class TinhThanhProvider {
  static Future<List<dynamic>> readJsonData() async {
    var url = DiaChiIP().IP + "connect_db/tinhthanh.php";
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "application/json"});
    var data = json.decode(response.body);
    return data["data"];
  }

  static Future<List<TinhThanhObject>> getAll() async {
    List<TinhThanhObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => TinhThanhObject.fromJson(e)).toList();
    return lsResult;
  }
}
