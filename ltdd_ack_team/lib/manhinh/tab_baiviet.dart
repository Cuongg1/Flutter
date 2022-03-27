import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/baivietcanhan.dart';
import 'package:ltdd_ack_team/manhinh/dangbaichiase.dart';
import 'package:ltdd_ack_team/manhinh/themdiadanh.dart';
import 'package:ltdd_ack_team/provider/baiviettheoid_provider.dart';
import 'package:ltdd_ack_team/manhinh/hosocanhan.dart';
import 'package:ltdd_ack_team/manhinh/diadanhyeuthich.dart';
import 'package:ltdd_ack_team/model/taikhoan_object.dart';
import 'package:ltdd_ack_team/provider/taikhoan_pr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/baiviet_object.dart';
import '../provider/baiviet_provider.dart';
import '../diachiIP.dart';
import '../provider/diadanh_dataprovider.dart';
import '../provider/taikhoan_provider.dart';
import 'baiviet.dart';
import 'baivietnoibat.dart';
import 'dangbai.dart';
import 'diadanh.dart';
import 'menu.dart';

class TabBaiViet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBaiVietState();
  }
}

class TabBaiVietState extends State<TabBaiViet> with TickerProviderStateMixin {
  String EMAIL = '';
  void LayThongTinDN() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final data = await TaiKhoanProvider.getAll(EMAIL);
    setState(() {});
    lstaikhoan = data;
  }

  List<TaiKhoanObject> lstaikhoan = [];

  @override
  void initState() {
    super.initState();
    LayThongTinDN();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 2, vsync: this);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trang cá nhân",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Menu()));
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 18.0,
                        child: ClipRRect(
                          child: Image.asset(
                            'images/avt02.jpg',
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: TextField(
                          onChanged: (String text) {
                            setState(() {});
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          minLines: 1,
                          decoration: InputDecoration.collapsed(
                              hintText: "Bạn đang nghĩ gì?"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DangBaiViet()));
                            },
                            icon: Icon(Icons.camera_alt_outlined),
                            color: Colors.green,
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: lstaikhoan.length,
            itemBuilder: (context, index) => Container(
              child: Column(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Container(
                          child: TabBar(
                            controller: _tabcontroller,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Tab(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.menu_book_sharp,
                                      color: Colors.green,
                                    ),
                                    Text('Bài Viết Mới',
                                        style: TextStyle(fontSize: 15))
                                  ],
                                ),
                              ),
                              Tab(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.thumb_up_sharp,
                                      color: Colors.blue,
                                    ),
                                    Text('Bài Viết Nổi Bật',
                                        style: TextStyle(fontSize: 15))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 550,
                          child: TabBarView(
                            controller: _tabcontroller,
                            children: [
                              BaiViet(),
                              BaiVietNoiBat(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
