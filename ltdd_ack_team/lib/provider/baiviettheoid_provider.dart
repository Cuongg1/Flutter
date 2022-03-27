import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/baiviettheoid_object.dart';
import '../diachiIP.dart';

class BaiVietTheoIDProvider {
  static Future<List<dynamic>> readJsonData(String EMAIL) async {
    var url = DiaChiIP().IP + "connect_db/baiviettheoid.php";
    var response = await http.post(Uri.parse(url), body: {'EMAIL': EMAIL});
    var data = json.decode(response.body);
    return data["data1"];
  }

  static Future<List<BaiVietTheoIDObject>> getAllbyEmail(String EMAIL) async {
    List<BaiVietTheoIDObject> lsResult = [];
    List<dynamic> data1 = await readJsonData(EMAIL);
    lsResult = data1.map((e) => BaiVietTheoIDObject.fromJson(e)).toList();
    return lsResult;
  }
}
