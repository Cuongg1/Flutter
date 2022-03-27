import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../diachiIP.dart';
import '../model/diadanh_object.dart';

class DiaDanhtheodmProvider {
  static Future<List<dynamic>> readJsonData(String ID_DANHMUC1) async {
    var url = DiaChiIP().IP + "connect_db/diadanhtheodm.php";
    var response =
        await http.post(Uri.parse(url), body: {'ID_DANHMUC': ID_DANHMUC1});
    var data1 = json.decode(response.body);
    return data1["danhmucs"];
  }

  static Future<List<DiaDanhObject>> getAll(String ID_DANHMUC1) async {
    List<DiaDanhObject> lsResult = [];
    List<dynamic> data1 = await readJsonData(ID_DANHMUC1);
    lsResult = data1.map((e) => DiaDanhObject.fromJson(e)).toList();
    return lsResult;
  }
}
