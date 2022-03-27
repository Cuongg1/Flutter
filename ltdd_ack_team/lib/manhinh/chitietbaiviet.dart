import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/model/baiviet_object.dart';
import 'package:ltdd_ack_team/model/baiviettheoid_object.dart';
import 'package:ltdd_ack_team/model/binhluan_object.dart';
import 'package:ltdd_ack_team/model/diadanh_object.dart';
import 'package:ltdd_ack_team/model/taikhoan_object.dart';
import 'package:ltdd_ack_team/provider/baiviettheoid_provider.dart';
import 'package:ltdd_ack_team/provider/binhluan_provider.dart';
import 'package:ltdd_ack_team/provider/diadanh_dataprovider.dart';
import 'package:ltdd_ack_team/provider/taikhoan_pr.dart';
import 'package:ltdd_ack_team/provider/taikhoan_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../diachiIP.dart';
import 'package:http/http.dart' as http;

class ChiTietBaiViet extends StatefulWidget {
  final int ID_BaiViet;
  final String HinhAnhBaiViet;
  final String NoiDungBaiViet;
  final String NgayDang;
  final String TaiKhoan;
  final String DiaDanh;
  final String HinhAnh;
  const ChiTietBaiViet(
      {Key? key,
      required this.ID_BaiViet,
      required this.HinhAnhBaiViet,
      required this.NoiDungBaiViet,
      required this.NgayDang,
      required this.TaiKhoan,
      required this.DiaDanh,
      required this.HinhAnh})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ChiTietBaiVietState(
        ID_BaiViet: ID_BaiViet,
        HinhAnhBaiViet: HinhAnhBaiViet,
        NoiDungBaiViet: NoiDungBaiViet,
        NgayDang: NgayDang,
        TaiKhoan: TaiKhoan,
        DiaDanh: DiaDanh,
        HinhAnh: HinhAnh);
  }
}

late int idnguoidang;
late int idbaiviet;
late String noidung;

class ChiTietBaiVietState extends State<ChiTietBaiViet>
    with TickerProviderStateMixin {
  TextEditingController noidung = TextEditingController();
  final int ID_BaiViet;
  final String HinhAnhBaiViet;
  final String NoiDungBaiViet;
  final String NgayDang;
  final String TaiKhoan;
  final String DiaDanh;
  final String HinhAnh;
  String EMAIL = ''; //truyen email
  void LayThongTinDN() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final data = await TaiKhoanProvider.getAll(EMAIL);
    setState(() {});
    lstaikhoan = data;
  }

  ChiTietBaiVietState(
      {required this.ID_BaiViet,
      required this.HinhAnhBaiViet,
      required this.NoiDungBaiViet,
      required this.NgayDang,
      required this.TaiKhoan,
      required this.DiaDanh,
      required this.HinhAnh});
  List<TaiKhoanObject> lstaikhoan = [];
  List<BaiVietTheoIDObject> lstBV = [];
  List<DiaDanhObject> lstdiadanh = [];
  List<TaiKhoanObject> lsttaikhoan = [];
  List<BinhLuanObject> lstbinhluan = [];
  void _Loadlbaiviet() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final dataBV = await BaiVietTheoIDProvider.getAllbyEmail(EMAIL);
    final data1 = await DiaDanhProvider.getAll();
    final data2 = await TaiKhoanProvider1.getAll();
    final data3 = await TaiKhoanProvider.getAll(EMAIL);
    setState(() {});
    lstBV = dataBV;
    lstdiadanh = data1;
    lsttaikhoan = data2;
    lstaikhoan = data3;
  }

  void _LoadBinhLuan() async {
    final data1 = await BinhLuanProvider.getAll(ID_BaiViet.toString());
    setState(() {});
    lstbinhluan = data1;
  }

  Future ThemBinhLuan() async {
    var url = DiaChiIP().IP + "connect_db/thembinhluan.php";
    var response = await http.post(Uri.parse(url), body: {
      "ID_NGUOIDANG": idnguoidang.toString(),
      "ID_BAIVIET": idbaiviet.toString(),
      "NOIDUNG": noidung.text,
      "TRANGTHAI": "1"
    }).whenComplete(() => _LoadBinhLuan());
    noidung.clear();
  }

  @override
  void initState() {
    super.initState();
    _Loadlbaiviet();
    _LoadBinhLuan();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chi tiết bài viết",
      home: Scaffold(
          body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Card(
                    child: Column(
                  children: [
                    Container(
                      child: ListTile(
                        title: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    TaiKhoan,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.red,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      DiaDanh,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 22.0,
                          child: ClipRRect(
                            child: Image.network(
                              DiaChiIP().IP + "connect_db/avt/${HinhAnh}",
                              height: 200,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              NgayDang,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(NoiDungBaiViet),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 2)),
                          Container(
                            child: Image.network(DiaChiIP().IP +
                                "connect_db/avt/${HinhAnhBaiViet}"),
                            width: 300,
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            ),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 16.0,
                        child: ClipRRect(
                          child: Image.network(
                            DiaChiIP().IP +
                                "connect_db/avt/${lstaikhoan.isEmpty ? "image_picker5010209163243659154.jpg" : lstaikhoan[0].HINHANH}",
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: TextField(
                          controller: noidung,
                          onChanged: (String text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          minLines: 1,
                          decoration: InputDecoration.collapsed(
                              hintText: "Viết bình luận"),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            idnguoidang = lstaikhoan[0].ID;
                            idbaiviet = ID_BaiViet;
                            ThemBinhLuan();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: lstbinhluan.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 200,
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 16.0,
                        child: ClipRRect(
                          child: Image.network(
                            DiaChiIP().IP +
                                "connect_db/avt/${lstaikhoan.isEmpty ? "image_picker5010209163243659154.jpg" : lstaikhoan[0].HINHANH}",
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      title: Text(
                          lstaikhoan.isEmpty ? "abc" : lstaikhoan[0].HOTEN),
                      subtitle: Text(
                        lstbinhluan[index].NOIDUNG,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
