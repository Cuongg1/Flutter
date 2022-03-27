import 'package:flutter/material.dart';

class DoiMatKhau extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoiMatKhauState();
  }
}

class DoiMatKhauState extends State<DoiMatKhau> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
              child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(450, 70, 50, 10)),
          Text(
            'Đổi mật khẩu',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                  hintText: "Nhập mật khẩu hiện tại",
                )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                  hintText: "Nhập mật khẩu mới",
                )),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                  hintText: "Nhập lại mật khẩu",
                )),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Đổi mật khẩu",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue)),
                ),
              ],
            ),
          )
        ],
      ))),
    );
  }
}
