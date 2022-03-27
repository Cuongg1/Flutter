import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/dangbai.dart';
import 'package:ltdd_ack_team/model/baiviet_object.dart';
import 'package:ltdd_ack_team/manhinh/chitietbaiviet.dart';
import 'package:ltdd_ack_team/model/luothtichbaiviet_object.dart';
import 'package:ltdd_ack_team/provider/diadanh_dataprovider.dart';
import 'package:ltdd_ack_team/model/diadanh_object.dart';
import 'package:ltdd_ack_team/manhinh/menu.dart';
import 'package:ltdd_ack_team/provider/luotthichbv_provider.dart';
import 'package:ltdd_ack_team/provider/taikhoan_pr.dart';
import '../provider/baiviet_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ltdd_ack_team/manhinh/timkiem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../diachiIP.dart';
import '../model/taikhoan_object.dart';
import '../provider/taikhoan_provider.dart';

class BaiViet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaiVietState();
  }
}

class BaiVietState extends State<BaiViet> {
  String EMAIL = '';
  List<LTBVObject> lstluotthich = [];
  void LayThongTinDN() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final data = await TaiKhoanProvider.getAll(EMAIL);
    setState(() {});
    lstaikhoan = data;
  }

  List<TaiKhoanObject> lstaikhoan = [];

  List<BaiVietObject> lstBV = [];
  List<DiaDanhObject> lstdiadanh = [];
  List<TaiKhoanObject> lsttaikhoan = [];
  String Email = '';
  void _Loadlbaiviet() async {
    final data = await BaivietProvider.getAll();
    final data1 = await DiaDanhProvider.getAll();
    final data2 = await TaiKhoanProvider1.getAll();
    setState(() {});
    lstBV = data;
    lstdiadanh = data1;
    lsttaikhoan = data2;
  }

  // bool _isfavorite(int id_bv) {
  //   if (lstluotthich.length == 0) {
  //     return false;
  //   } else {
  //     if (lstluotthich[id_bv].TRANGTHAI == 1) {
  //       return true;
  //     }
  //     return false;
  //   }
  // }

  late int idbv;
  late int idnguoithich = lstaikhoan[0].ID;
  Future _click() async {
    setState(() {});
    //_isfavoriteState = !_isfavoriteState;
    //_isfavorite() == true ? false : true;
    //_favoriteCounter += _isfavorite == true ? 1 : -1;
    //xulitymactive();
    xulilike();
  }

  Future xulilike() async {
    var url = DiaChiIP().IP + "connect_db/xllike.php";
    var response = await http.post(Uri.parse(url), body: {
      "ID_NGUOITHICH": idnguoithich.toString(),
      "ID_BAIVIET": idbv.toString(),
    }).whenComplete(() => _Loadlbaiviet());
  }

  @override
  void initState() {
    super.initState();
    _Loadlbaiviet();
    LayThongTinDN();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          child: ListView.builder(
              itemCount: lstBV.length,
              itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Card(
                            child: Column(
                          children: [
                            Container(
                              child: ListTile(
                                  title: Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              lsttaikhoan[lstBV[index]
                                                          .ID_NGUOIDANG -
                                                      1]
                                                  .HOTEN,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          child: TextButton(
                                              onPressed: () {
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
//         builder: (context) => ChiTiet()));
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.red,
                                                  ),
                                                  Text(
                                                    lstdiadanh[lstBV[index]
                                                                .ID_DIADANH -
                                                            1]
                                                        .TENDIADANH,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                ],
                                              )),
                                          width: 300,
                                        )
                                      ],
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 25.0,
                                    child: ClipRRect(
                                      child: Image.network(
                                        DiaChiIP().IP +
                                            "connect_db/avt/${lsttaikhoan[lstBV[index].ID_NGUOIDANG - 1].HINHANH}",
                                        height: 200,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        lstBV[index].NGAYDANG.toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          child: Text(lstBV[index].NOIDUNG),
                                          width: 360,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 10)),
                                  Container(
                                    child: Image.network(DiaChiIP().IP +
                                        "connect_db/avt/${lstBV[index].HINHANH}"),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(lstBV[index].THICH.toString()),
                                    IconButton(
                                        onPressed: () {
                                          idbv = lstBV[index].ID;
                                          idnguoithich = lstaikhoan[0].ID;
                                          xulilike();
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Text(lstBV[index].KHONGTHICH.toString()),
                                //     IconButton(
                                //         onPressed: () {},
                                //         icon: Icon(
                                //           Icons.thumb_down_alt_outlined,
                                //           color: Colors.red,
                                //         ))
                                //   ],
                                // ),
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChiTietBaiViet(
                                                  ID_BaiViet: lstBV[index].ID,
                                                  HinhAnhBaiViet:
                                                      lstBV[index].HINHANH,
                                                  NoiDungBaiViet:
                                                      lstBV[index].NOIDUNG,
                                                  NgayDang:
                                                      lstBV[index].NGAYDANG,
                                                  TaiKhoan: lsttaikhoan[
                                                          lstBV[index]
                                                                  .ID_NGUOIDANG -
                                                              1]
                                                      .HOTEN,
                                                  DiaDanh:
                                                      lstdiadanh[lstBV[index].ID_DIADANH - 1]
                                                          .TENDIADANH,
                                                  HinhAnh: lsttaikhoan[
                                                          lstBV[index]
                                                                  .ID_NGUOIDANG -
                                                              1]
                                                      .HINHANH)));
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 55,
                                        ),
                                        Icon(
                                          Icons.comment,
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "  Bình luận",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 55,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  )),
        )));
  }
}
