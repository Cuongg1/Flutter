import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ltdd_ack_team/manhinh/baiviet.dart';
import 'package:ltdd_ack_team/model/diadanh_object.dart';
import 'package:ltdd_ack_team/manhinh/trangchu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../diachiIP.dart';
import '../provider/diadanh_dataprovider.dart';
import '../model/taikhoan_object.dart';
import '../provider/taikhoan_pr.dart';
import 'package:http/http.dart' as http;

class DangBai extends StatefulWidget {
  final DiaDanhObject DiaDanh;
  const DangBai({Key? key, required this.DiaDanh}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DangBaiState(DiaDanh: DiaDanh);
  }
}

late int idnguoidang;
late int iddiadanh;
late String hinhanh;

class DangBaiState extends State<DangBai> {
  TextEditingController noidung = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Future<void> filePicker() async {
    final XFile? SelectImage =
        await _picker.pickImage(source: ImageSource.gallery);
    //print(SelectImage!.path);
    setState(() {
      image = SelectImage;
    });
  }

  final DiaDanhObject DiaDanh;
  DangBaiState({required this.DiaDanh});
  String EMAIL = '';
  List<TaiKhoanObject> lstaikhoan = [];
  List<DiaDanhObject> lstdiadanh = [];
  void _LoadThongTin() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final data1 = await DiaDanhProvider.getAll();
    final data2 = await TaiKhoanProvider.getAll(EMAIL);
    setState(() {});
    lstdiadanh = data1;
    lstaikhoan = data2;
  }

  void _Loaddiadanh() async {
    final data = await DiaDanhProvider.getAll();
    setState(() {});
    lstdiadanh = data;
  }

  Future dangbai() async {
    var url = DiaChiIP().IP + "connect_db/dangbaiviet.php";
    var response = await http.post(Uri.parse(url), body: {
      "ID_NGUOIDANG": idnguoidang.toString(),
      "ID_DIADANH": iddiadanh.toString(),
      "NOIDUNG": noidung.text,
      "HINHANH": hinhanh.toString(),
      "NGAYDANG": DateTime.now().toString(),
      "THICH": "0",
      "KHONGTHICH": "0",
      "TRANGTHAI": "1"
    });
  }

  Future uploadImage() async {
    final uri = Uri.parse(DiaChiIP().IP + "connect_db/doiavt.php");
    var request = http.MultipartRequest('POST', uri);
    var pic = await http.MultipartFile.fromPath("HINHANH", image!.path);
    request.files.add(pic);
    var response = await request.send();
  }

  @override
  void initState() {
    super.initState();
    _Loaddiadanh();
    _LoadThongTin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              child: ListView.builder(
                  itemCount: lstaikhoan.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TrangChu()));
                                  },
                                  icon: Icon(Icons.close),
                                  color: Colors.black,
                                ),
                                Text(
                                  'Đăng bài viết',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 180,
                                ),
                                TextButton(
                                  onPressed: () {
                                    idnguoidang = lstaikhoan[index].ID;
                                    iddiadanh = DiaDanh.ID;
                                    hinhanh = image!.name.toString();
                                    dangbai();
                                    uploadImage();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TrangChu()));
                                  },
                                  child: Text("Đăng",
                                      style: TextStyle(
                                        color: Colors.black,
                                      )),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                  ),
                                )
                              ],
                            ),
                            color: Colors.lightBlue,
                          ),
                          Container(
                              child: Row(
                            children: [
                              Text(lstaikhoan[index].HOTEN +
                                  " đang ở " +
                                  DiaDanh.TENDIADANH),
                            ],
                          )),
                          Container(
                            child: TextField(
                              controller: noidung,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Bạn đang nghĩ gì?",
                              ),
                            ),
                            height: 300,
                          ),
                          Container(
                            color: Colors.lightBlue,
                            height: 200,
                            child: image == null
                                ? Image.network(
                                    "https://thegioigiay.net/wp-content/uploads/2018/03/noimage.png",
                                  )
                                : Image.file(
                                    File(image!.path),
                                  ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: Colors.grey[200]),
                                      width: 50,
                                      height: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          filePicker();
                                        },
                                        icon: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ))),
        ));
  }
}
