import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ltdd_ack_team/manhinh/dangnhap.dart';
import 'package:http/http.dart' as http;

import '../diachiIP.dart';

class DangKy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DangKyState();
  }
}

class GioiTinh {
  String gt;
  GioiTinh(this.gt);

  static List<GioiTinh> getGioiTinh() {
    return <GioiTinh>[GioiTinh('Nam'), GioiTinh('Nữ')];
  }
}

class DangKyState extends State<DangKy> {
  TextEditingController hoten = TextEditingController();
  TextEditingController diachi = TextEditingController();
  TextEditingController ngaysinh = TextEditingController();
  TextEditingController sdt = TextEditingController();
  TextEditingController phai = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController matKhau = TextEditingController();
  List<GioiTinh> _gt = GioiTinh.getGioiTinh();
  late List<DropdownMenuItem<GioiTinh>> _dropdownMenuItems;
  late GioiTinh _selectedGt;
  var _EmailLoi = "Email không đúng định dạng";
  var _MatKhauLoi = "";
  var _Email = false;
  var _Matkhau = false;
  Future dangky() async {
    var url = DiaChiIP().IP + "connect_db/dangky.php";
    var response = await http.post(Uri.parse(url), body: {
      "HOTEN": hoten.text,
      "DIACHI": diachi.text,
      "SDT": sdt.text,
      "PHAI": _selectedGt.gt,
      "EMAIL": email.text,
      "MATKHAU": matKhau.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: "Email đã tồn tại",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
          msg: "Đăng ký thành công!",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DangNhap()));
    }
  }

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_gt);
    _selectedGt = _dropdownMenuItems[0].value!;
    super.initState();
  }

  List<DropdownMenuItem<GioiTinh>> buildDropdownMenuItems(List gioitinh) {
    List<DropdownMenuItem<GioiTinh>> items = [];
    for (GioiTinh gtinh in gioitinh) {
      items.add(DropdownMenuItem(value: gtinh, child: Text(gtinh.gt)));
    }
    return items;
  }

  onChangeDropdownIteam(GioiTinh? selectedgt) {
    setState(() {
      _selectedGt = selectedgt!;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/anhnen.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: EdgeInsets.all(23),
              child: ListView(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            'Đăng Ký',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Họ Tên Không Được Để Trống';
                              }
                              return null;
                            },
                            controller: hoten,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_box_outlined,
                                color: Colors.white,
                              ),
                              labelText: 'Họ và tên',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  30,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Địa Chỉ Không Được Để Trống';
                            }
                            return null;
                          },
                          controller: diachi,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.home_outlined,
                              color: Colors.white,
                            ),
                            labelText: 'Địa chỉ',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'SDT Không Được Để Trống';
                            }
                            return null;
                          },
                          controller: sdt,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            labelText: 'SDT',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton(
                              value: _selectedGt,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownIteam,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              dropdownColor: Colors.black,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email Không Được Để Trống';
                            }
                            return null;
                          },
                          controller: email,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            labelText: 'Email',
                            errorText: _Email ? _EmailLoi : null,
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mật Khẩu Không Được Để Trống';
                            }
                            return null;
                          },
                          controller: matKhau,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            labelText: 'Mật Khẩu',
                            errorText: _Matkhau ? _MatKhauLoi : null,
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                dangky();
                              }
                              KiemTraDangKy();
                            },
                            child: Text(
                              'Đăng ký',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.red,
                            elevation: 0,
                            minWidth: 350,
                            height: 60,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void KiemTraDangKy() {
    setState(() {
      if (email.text.length < 6 || !email.text.contains("@")) {
        _Email = true;
      } else {
        _Email = false;
      }
      if (matKhau.text.length < 6) {
        _Matkhau = true;
      } else {
        _Matkhau = false;
      }
    });
  }
}
