import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/manhinh/manhinhtrangcanhan.dart';
import 'package:ltdd_ack_team/model/taikhoan_object.dart';
import 'package:ltdd_ack_team/provider/taikhoan_pr.dart';
import 'package:ltdd_ack_team/manhinh/trangchu.dart';
import 'package:ltdd_ack_team/manhinh/trangchu_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../diachiIP.dart';

class DoiAVT extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoiAVTState();
  }
}

class DoiAVTState extends State<DoiAVT> {
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

  Future uploadImage() async {
    final uri = Uri.parse(DiaChiIP().IP + "connect_db/doiavt.php");
    var request = http.MultipartRequest('POST', uri);
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    if (image == null) return;
    request.fields['EMAIL'] = EMAIL;
    var pic = await http.MultipartFile.fromPath("HINHANH", image!.path);
    request.files.add(pic);
    var response = await request.send();
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
          title: Row(children: [
            SizedBox(
              width: 40,
            ),
            Text(
              'Đổi ảnh đại diện',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ]),
        ),
        body: ListView.builder(
          itemCount: lstaikhoan.length,
          itemBuilder: (context, index) => Container(
            child: Align(
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 100.0,
                            child: ClipRRect(
                              child: image == null
                                  ? Image.network(
                                      "http://192.168.1.3/connect_db/avt/${lstaikhoan[index].HINHANH}",
                                    )
                                  : Image.file(
                                      File(image!.path),
                                    ),
                              borderRadius: BorderRadius.circular(150.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                      height: 700,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 170,
                          ),
                          IconButton(
                            onPressed: () {
                              filePicker();
                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                            ),
                            iconSize: 50,
                          ),
                        ],
                      )),
                  Container(
                      height: 800,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 170,
                          ),
                          Container(
                            color: Colors.deepOrange,
                            child: TextButton(
                                onPressed: () {
                                  uploadImage();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TrangChuMain()));
                                },
                                child: Text('Lưu')),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
