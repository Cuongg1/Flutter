import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/taikhoan_object.dart';
import '../diachiIP.dart';
import '../model/diadanh_object.dart';

class TaiKhoanProvider1 {
  static Future<List<dynamic>> readJsonData() async {
    var url = DiaChiIP().IP + "connect_db/taikhoan1.php";
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "application/json"});
    var data = json.decode(response.body);
    return data["user1"];
  }

  static Future<List<TaiKhoanObject>> getAll() async {
    List<TaiKhoanObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => TaiKhoanObject.fromJson(e)).toList();
    return lsResult;
  }
}
