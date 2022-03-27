import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/model/baivietlienquan_object.dart';
import '../diachiIP.dart';

class BaiVietLienQuanProvider {
  static Future<List<dynamic>> readJsonData(String ID_DIADANH) async {
    var url = DiaChiIP().IP + "connect_db/baivietlienquan.php";
    var response =
        await http.post(Uri.parse(url), body: {'ID_DIADANH': ID_DIADANH});
    var data = json.decode(response.body);
    return data["data"];
  }

  static Future<List<BaiVietLienQuanObject>> getAll(String ID_DIADANH) async {
    List<BaiVietLienQuanObject> lsResult = [];
    List<dynamic> data1 = await readJsonData(ID_DIADANH);
    lsResult = data1.map((e) => BaiVietLienQuanObject.fromJson(e)).toList();
    return lsResult;
  }
}
