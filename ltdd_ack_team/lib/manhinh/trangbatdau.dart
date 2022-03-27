import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/dangky.dart';
import 'package:ltdd_ack_team/manhinh/dangnhap.dart';

class ManHinhBatDau extends StatefulWidget {
  const ManHinhBatDau({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ManHinhBatDauState();
  }
}

class ManHinhBatDauState extends State<ManHinhBatDau> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/anhnen.png'),
          fit: BoxFit.cover,
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
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Image.asset('images/logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DangNhap(),
                          ));
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
                  padding: EdgeInsets.all(10),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Bạn đã có tài khoản chưa?",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DangKy()));
                            },
                            child: Text("Đăng ký"))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
