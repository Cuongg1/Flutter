import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../diachiIP.dart';
import '../model/diadanh_object.dart';

class DiaDanhProvider {
  static Future<List<dynamic>> readJsonData() async {
    var url = DiaChiIP().IP + "connect_db/diadanh.php";
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "application/json"});
    var data1 = json.decode(response.body);
    return data1["data"];
  }

  static Future<List<DiaDanhObject>> getAll() async {
    List<DiaDanhObject> lsResult = [];
    List<dynamic> data1 = await readJsonData();
    lsResult = data1.map((e) => DiaDanhObject.fromJson(e)).toList();
    return lsResult;
  }
}
