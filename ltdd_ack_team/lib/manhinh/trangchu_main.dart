import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/chitietdiadanh.dart';
import 'package:ltdd_ack_team/model/danhmuc_object.dart';
import 'package:ltdd_ack_team/provider/danhmuc_pr.dart';
import 'package:ltdd_ack_team/provider/diadanh_dataprovider.dart';
import 'package:ltdd_ack_team/manhinh/menu.dart';
import 'package:ltdd_ack_team/model/diadanh_object.dart';
import 'package:ltdd_ack_team/manhinh/timkiem.dart';

import '../diachiIP.dart';

class TrangChuMain extends StatefulWidget {
  get destination => null;

  @override
  State<StatefulWidget> createState() {
    return TrangChuMainState();
  }
}

class TrangChuMainState extends State<TrangChuMain> {
  final urlImages = [
    'https://haisanquangphong.com/upload/product/post_vinh-ha-long-054559201019.jpg',
    'https://vietnamhoc.net/wp-content/uploads/2019/12/vinh-ha-long-web-1-800x480.jpg',
    'https://media.mia.vn/uploads/blog-du-lich/banh-gat-gu-mon-banh-thom-ngon-dam-vi-ha-long-1641806999.jpg',
    'https://media.gody.vn/images/quang-ninh/vinh-ha-long/11-2016/20161107034318-vinh-ha-long-gody(19).jpg'
  ];

  List<DiaDanhObject> lsdiadanh = [];
  List<DanhMucObject> lstDanhMuc = [];
  void _Loadlsdiadanh() async {
    final data = await DiaDanhProvider.getAll();
    final data1 = await DanhMucProvider.getAll();
    setState(() {});
    lsdiadanh = data;
    lstDanhMuc = data1;
  }

  List<DiaDanhObject> lstaikhoan = [];
  void _Loadlstaikhoan() async {
    final data = await DiaDanhProvider.getAll();
    setState(() {});
    lstaikhoan = data;
  }

  @override
  void initState() {
    super.initState();
    _Loadlsdiadanh();
    _Loadlstaikhoan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Menu()));
          },
        ),
        title: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            Text('Du Lịch ACK_Team'),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimKiem1()));
                },
                icon: Icon(Icons.search_outlined)),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 5),
                ),
                itemCount: urlImages.length,
                itemBuilder: (Context, index, readIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                }),
          ),
          Row(
            children: [
              SizedBox(width: 20, height: 30),
              Text('Gợi ý',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lsdiadanh.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: lsdiadanh[index].HINHANH.substring(0, 5) ==
                                  "https"
                              ? Image.network(
                                  lsdiadanh[index].HINHANH,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  DiaChiIP().IP +
                                      "connect_db/avt/${lsdiadanh[index].HINHANH}",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 20.0,
                        bottom: 2.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChiTiet(
                                              DiaDanh: lsdiadanh[index],
                                            )));
                              },
                              child: Text(
                                lsdiadanh[index].TENDIADANH,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            Text(
                              (lstDanhMuc[lsdiadanh[index].ID_DANHMUC - 1]
                                  .TENDANHMUC),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.edit_location_outlined,
                                  color: Colors.red,
                                ),
                                Text(
                                  lsdiadanh[index].KINHDO,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  lsdiadanh[index].VIDO,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 270,
                                ),
                                Text(
                                  lsdiadanh[index].LUOTTHICH.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        // margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
