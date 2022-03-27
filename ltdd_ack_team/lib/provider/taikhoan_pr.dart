import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/taikhoan_object.dart';
import '../diachiIP.dart';
import '../model/diadanh_object.dart';

class TaiKhoanProvider {
  static Future<List<dynamic>> readJsonData(String EMAIL) async {
    var url = DiaChiIP().IP + "connect_db/taikhoan.php";
    var response = await http.post(Uri.parse(url), body: {'EMAIL': EMAIL});
    var data1 = json.decode(response.body);
    return data1["user"];
  }

  static Future<List<TaiKhoanObject>> getAll(String EMAIL) async {
    List<TaiKhoanObject> lsResult = [];
    List<dynamic> data1 = await readJsonData(EMAIL);
    lsResult = data1.map((e) => TaiKhoanObject.fromJson(e)).toList();
    return lsResult;
  }
}
