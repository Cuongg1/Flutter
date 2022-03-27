import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/xacnhanma.dart';

class QuenMatKhau extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuenMatKhauState();
  }
}

class QuenMatKhauState extends State<QuenMatKhau> {
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 5),
                        child: Text(
                          'Quên mật khẩu',
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
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Nhập email',
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
                        padding: EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => XacNhanMa(),
                                ));
                          },
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          color: Colors.brown[100],
                          elevation: 0,
                          minWidth: 350,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
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
