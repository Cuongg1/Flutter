import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/trangbatdau.dart';

import 'dangnhap.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Center(
            child: Text(
              "THÔNG TIN CÁ NHÂN",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: ListTile(
                  title: Text(
                    "Mạnh Cường",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 36.0,
                    child: ClipRRect(
                      child: Image.asset(
                        'images/avt01.png',
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  subtitle: Text('Số điện thoại:0339994239',
                      style: TextStyle(color: Colors.white)),
                ),
                color: Colors.blue,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Card(
                    child: Row(
                      children: [
                        Card(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                          ),
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Bài viết yêu thích",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Card(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.share_outlined),
                          ),
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Bài viết đã chia sẻ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Card(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu_book_outlined),
                          ),
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Chính sách và quy định",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Card(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.info_outline),
                          ),
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Giới thiệu",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Card(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManHinhBatDau()));
                            },
                            icon: Icon(Icons.rotate_left_outlined),
                          ),
                          color: Colors.purple,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManHinhBatDau()));
                            },
                            child: Text(
                              "Đăng xuất",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
