import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/ddyeuthich_object.dart';
import '../diachiIP.dart';
import '../model/diadanh_object.dart';

class DDYeyThichProvider {
  static Future<List<dynamic>> readJsonData(String EMAIL) async {
    var url = DiaChiIP().IP + "connect_db/diadanhyeuthich.php";
    var response = await http.post(Uri.parse(url), body: {'EMAIL': EMAIL});
    var data = json.decode(response.body);
    return data["ddyeuthich"];
  }

  static Future<List<DDYeuThichObject>> getAll(String EMAIL) async {
    List<DDYeuThichObject> lsResult = [];
    List<dynamic> data = await readJsonData(EMAIL);
    lsResult = data.map((e) => DDYeuThichObject.fromJson(e)).toList();
    return lsResult;
  }
}
