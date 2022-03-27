import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ltdd_ack_team/manhinh/baiviet.dart';
import 'package:ltdd_ack_team/manhinh/loading.dart';
import 'package:ltdd_ack_team/manhinh/trangchu.dart';
import 'package:http/http.dart' as http;
import 'package:ltdd_ack_team/manhinh/trangchu_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../diachiIP.dart';

class DangNhap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DangNhapState();
  }
}

class DangNhapState extends State<DangNhap> {
  bool _XemMK = true;
  var _EmailLoi = "Email không hợp lệ";
  var _MatKhauLoi = "Mật khẩu trên 6 ký tự";
  var _Email = false;
  var _Matkhau = false;
  TextEditingController Email = TextEditingController();
  TextEditingController MatKhau = TextEditingController();
  Future login() async {
    var url = DiaChiIP().IP + "connect_db/dangnhap.php";
    var response = await http.post(Uri.parse(url), body: {
      "EMAIL": Email.text,
      "MATKHAU": MatKhau.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Đăng nhập thành công",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Loading()));
    } else {
      Fluttertoast.showToast(
          msg: "Email hoặc mật khẩu không chính xác !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
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
        body: Container(
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
                  height: 200,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 5),
                        child: Text(
                          'Đăng Nhập',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email Không Được Để Trống';
                            }
                            return null;
                          },
                          controller: Email,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            labelText: 'Email....',
                            errorText: _Email ? _EmailLoi : null,
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mật Khẩu Không Được Để Trống';
                                }
                                return null;
                              },
                              controller: MatKhau,
                              obscureText: _XemMK, //gia tri nguoc
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key_sharp,
                                  color: Colors.white,
                                ),
                                labelText: 'Mật khẩu.....',
                                errorText: _Matkhau ? _MatKhauLoi : null,
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 310,
                              child: GestureDetector(
                                onTap: XemMatKhau,
                                child: Icon(
                                  _XemMK
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              SharedPreferences ThongTinCaNhan =
                                  await SharedPreferences.getInstance();
                              ThongTinCaNhan.setString('EMAIL', Email.text);
                              login();
                            }
                            KiemTraDangNhap();
                          },
                          child: Text(
                            'Đăng nhập',
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
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Quên mật khẩu!',
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontFamily: 'SFUIDisplay',
                              ),
                            ),
                          ),
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
    );
  }

  //hien mat khau
  void XemMatKhau() {
    setState(() {
      _XemMK = !_XemMK;
    });
  }

  void KiemTraDangNhap() {
    setState(() {
      if (Email.text.length < 6 || !Email.text.contains("@")) {
        _Email = true;
      } else {
        _Email = false;
      }
    });
  }
}
