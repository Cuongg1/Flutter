import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/baivietcanhan.dart';
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

class TrangCaNhan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrangCaNhanState();
  }
}

class TrangCaNhanState extends State<TrangCaNhan>
    with TickerProviderStateMixin {
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
                          padding: EdgeInsets.only(top: 20),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 36.0,
                              child: ClipRRect(
                                child: Image.network(
                                  DiaChiIP().IP +
                                      "connect_db/avt/${lstaikhoan[index].HINHANH}",
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            title: Text(
                              lstaikhoan[index].HOTEN,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      lstaikhoan[index].SDT,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.email),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      lstaikhoan[index].EMAIL,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ManHinhCaNhan(),
                                  ));
                            },
                            child: Text(
                              'Chỉnh sửa chi tiết thông tin',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'SFUIDisplay',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            color: Colors.blue,
                            elevation: 0,
                            minWidth: 100,
                            height: 30,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
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
                                    Text('Bài Viết Cá Nhân',
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
                                    Text('Địa Danh Yêu Thích',
                                        style: TextStyle(fontSize: 15))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 420,
                          child: TabBarView(
                            controller: _tabcontroller,
                            children: [
                              BaiVietCaNhan(),
                              TrangYeuThich(),
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
