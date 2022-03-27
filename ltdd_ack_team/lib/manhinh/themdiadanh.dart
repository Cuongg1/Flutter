import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ltdd_ack_team/manhinh/diadanh.dart';
import 'package:ltdd_ack_team/manhinh/trangchu.dart';
import 'package:ltdd_ack_team/model/tinhthanh_object.dart';
import 'package:ltdd_ack_team/provider/danhmuc_pr.dart';
import 'package:ltdd_ack_team/provider/tinhthanh_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../diachiIP.dart';
import '../model/danhmuc_object.dart';
import '../model/diadanh_object.dart';
import '../model/taikhoan_object.dart';
import '../provider/diadanh_dataprovider.dart';
import 'package:http/http.dart' as http;

import '../provider/taikhoan_pr.dart';

class ThemDiaDanh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThemDiaDanhState();
  }
}

late int idtinhthanh;
late int iddanhmuc;
late String hinhanh;

class ThemDiaDanhState extends State<ThemDiaDanh> {
  TextEditingController mota = TextEditingController();
  TextEditingController tendiadanh = TextEditingController();
  TextEditingController kinhdo = TextEditingController();
  TextEditingController vido = TextEditingController();
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

  String EMAIL = '';
  List<TaiKhoanObject> lstaikhoan = [];
  List<DiaDanhObject> lstdiadanh = [];
  List<TinhThanhObject> lsttinhthanh = [];
  List<DanhMucObject> lsdanhmuc = [];
  void _LoadThongTin() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final data1 = await DiaDanhProvider.getAll();
    final data2 = await TaiKhoanProvider.getAll(EMAIL);
    final data3 = await TinhThanhProvider.getAll();
    final data4 = await DanhMucProvider.getAll();
    setState(() {});
    lstaikhoan = data2;
    lstdiadanh = data1;
    lsttinhthanh = data3;
    lsdanhmuc = data4;
  }

  String dropdownValue = '1';
  String dropdownValue1 = '1';
  Future themdiadanh() async {
    var url = DiaChiIP().IP + "connect_db/themdiadanh.php";
    var response = await http.post(Uri.parse(url), body: {
      "TENDIADANH": tendiadanh.text,
      "ID_TINHTHANH": idtinhthanh.toString(),
      "ID_DANHMUC": iddanhmuc.toString(),
      "KINHDO": kinhdo.text,
      "VIDO": vido.text,
      "LUOTTHICH": "0",
      "MOTA": mota.text,
      "HINHANH": hinhanh.toString(),
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
    _LoadThongTin();
    print(lsttinhthanh.length);
    print(lsdanhmuc.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
              child: ListView.builder(
                  itemCount: 1,
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
                                  'Thêm địa danh',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  width: 180,
                                ),
                                TextButton(
                                  onPressed: () {
                                    idtinhthanh = int.parse(dropdownValue);
                                    iddanhmuc = int.parse(dropdownValue1);
                                    hinhanh = image!.name.toString();
                                    themdiadanh();
                                    uploadImage();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DiaDanh()));
                                  },
                                  child: Text("Thêm",
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
                            child: TextField(
                              controller: tendiadanh,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Tên địa danh: ",
                              ),
                            ),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Text("Tỉnh Thành: "),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      for (int j = 1;
                                          j <= lsttinhthanh.length;
                                          j++)
                                        j.toString(),
                                    ].map<DropdownMenuItem<String>>(
                                        (String value1) {
                                      return DropdownMenuItem<String>(
                                        value: value1,
                                        child: Text(
                                            lsttinhthanh[int.parse(value1) - 1]
                                                .TENTINHTHANH),
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                            ],
                          )),
                          Container(
                              child: Row(
                            children: [
                              Text("Danh Mục: "),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DropdownButton<String>(
                                    value: dropdownValue1,
                                    icon: const Icon(Icons.arrow_downward),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue1 = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      for (int i = 1;
                                          i <= lsdanhmuc.length;
                                          i++)
                                        i.toString(),
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                            lsdanhmuc[int.parse(value) - 1]
                                                .TENDANHMUC),
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                            ],
                          )),
                          Container(
                            child: TextField(
                              controller: kinhdo,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Kinh độ",
                              ),
                            ),
                          ),
                          Container(
                            child: TextField(
                              controller: vido,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Vĩ độ",
                              ),
                            ),
                          ),
                          Container(
                            child: TextField(
                              controller: mota,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Mô tả địa danh",
                              ),
                            ),
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
