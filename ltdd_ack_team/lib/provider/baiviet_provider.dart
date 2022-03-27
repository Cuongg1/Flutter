import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/diachiIP.dart';
import '../model/baiviet_object.dart';

class BaivietProvider {
  static Future<List<dynamic>> readJsonData() async {
    var url = DiaChiIP().IP + "connect_db/baiviet.php";
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "application/json"});
    var data = json.decode(response.body);
    return data["data"];
  }

  static Future<List<BaiVietObject>> getAll() async {
    List<BaiVietObject> lsResult = [];
    List<dynamic> data = await readJsonData();
    lsResult = data.map((e) => BaiVietObject.fromJson(e)).toList();
    return lsResult;
  }
}

class BaivietNoiBatProvider {
  static Future<List<dynamic>> readJsonData1() async {
    var url = DiaChiIP().IP + "connect_db/baivietnoibat.php";
    var response = await http
        .post(Uri.parse(url), headers: {"Accept": "application/json"});
    var data = json.decode(response.body);
    return data["data"];
  }

  static Future<List<BaiVietObject>> getbvnbAll() async {
    List<BaiVietObject> lsResult = [];
    List<dynamic> data = await readJsonData1();
    lsResult = data.map((e) => BaiVietObject.fromJson(e)).toList();
    return lsResult;
  }
}
