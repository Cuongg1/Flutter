import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ltdd_ack_team/manhinh/doimatkhau.dart';
import 'package:ltdd_ack_team/manhinh/manhinhtrangcanhan.dart';
import 'package:ltdd_ack_team/model/taikhoan_object.dart';
import 'package:ltdd_ack_team/provider/taikhoan_pr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../diachiIP.dart';
import 'doiavatar.dart';

class ManHinhCaNhan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ManHinhCaNhanState();
  }
}

class ManHinhCaNhanState extends State<ManHinhCaNhan> {
  TextEditingController Hoten = TextEditingController();
  TextEditingController Diachi = TextEditingController();
  TextEditingController Sdt = TextEditingController();
  String Email = '';

  Future suathongtin() async {
    var url = DiaChiIP().IP + "connect_db/doithongtin.php";
    var response = await http.post(Uri.parse(url), body: {
      "HOTEN": Hoten.text,
      "DIACHI": Diachi.text,
      "SDT": Sdt.text,
      "EMAIL": Email,
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TrangCaNhan()));
  }

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String EMAIL = '';
  void LayThongTinDN() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final data = await TaiKhoanProvider.getAll(EMAIL);
    setState(() {});
    lstaikhoan = data;
  }

  List<TaiKhoanObject> lstaikhoan = [];
  Future<void> filePicker() async {
    final XFile? SelectImage =
        await _picker.pickImage(source: ImageSource.gallery);
    //print(SelectImage!.path);
    setState(() {
      image = SelectImage;
    });
  }

  @override
  void initState() {
    super.initState();
    LayThongTinDN();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: Align(
            child: Text(
              'CHỈNH SỬA THÔNG TIN',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: lstaikhoan.length,
          itemBuilder: (context, index) => Container(
            child: Column(
              children: [
                Align(
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 36.0,
                                child: ClipRRect(
                                  child: Image.network(
                                    DiaChiIP().IP +
                                        "connect_db/avt/${lstaikhoan[index].HINHANH}",
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              Text(
                                lstaikhoan[index].HOTEN,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text('Số điện thoại: ' + lstaikhoan[index].SDT,
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                        ],
                      ),
                      Container(
                          height: 130,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 200,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DoiAVT()));
                                  },
                                  icon: Icon(Icons.camera_alt_outlined)),
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Text(
                        'Thông tin cá nhân',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      TextField(
                          controller: Hoten,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0)),
                            labelText: "Họ và tên",
                            hintText: lstaikhoan[index].HOTEN,
                          )),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                          controller: Diachi,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0)),
                            labelText: "Địa chỉ",
                            hintText: lstaikhoan[index].DIACHI,
                          )),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                          controller: Sdt,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0)),
                            labelText: "Số điện thoại",
                            hintText: lstaikhoan[index].SDT,
                          )),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      // TextField(
                      //     decoration: InputDecoration(
                      //   border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //       borderSide:
                      //           BorderSide(color: Colors.grey, width: 2.0)),
                      //   labelText: "Phái",
                      //   hintText: lstaikhoan[index].PHAI,
                      // )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Email = lstaikhoan[0].EMAIL;
                                suathongtin();
                              },
                              child: Text(
                                "Lưu lại",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.lightBlue)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Huỷ",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey)),
                            ),
                          ]),
                      Container(
                        width: 350,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoiMatKhau()));
                          },
                          child: Text(
                            "Đổi mật khẩu",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.lightBlue)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
