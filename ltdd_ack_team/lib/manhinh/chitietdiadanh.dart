import 'dart:core';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/baivietlienquan.dart';
import 'package:ltdd_ack_team/manhinh/map.dart';
import 'package:ltdd_ack_team/manhinh/trangchu.dart';
import 'package:ltdd_ack_team/model/luothichdd_object.dart';
import 'package:ltdd_ack_team/provider/luothichdd_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../diachiIP.dart';
import '../provider/diadanh_dataprovider.dart';
import '../model/diadanh_object.dart';
import '../model/taikhoan_object.dart';
import '../provider/taikhoan_pr.dart';
import 'dangbaichiase.dart';
import 'package:http/http.dart' as http;

class ChiTiet extends StatefulWidget {
  final DiaDanhObject DiaDanh;
  const ChiTiet({Key? key, required this.DiaDanh}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ChiTietState(DiaDanh: DiaDanh);
  }
}

class ChiTietState extends State<ChiTiet> with TickerProviderStateMixin {
  final DiaDanhObject DiaDanh;
  List<TaiKhoanObject> lstaikhoan = [];
  List<LTDDObject> lstluotthich = [];
  ChiTietState({required this.DiaDanh});
  List<DiaDanhObject> lsdiadanh = [];
  void _Loadlsdiadanh() async {
    final data = await DiaDanhProvider.getAll();
    setState(() {});
    lsdiadanh = data;
  }

  late var id_nguoitym;
  late var id_diadanh;
  String EMAIL = '';
  void LayThongTinDN() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final data = await TaiKhoanProvider.getAll(EMAIL);
    final data1 =
        await LTDDProvider.getAll(data[0].ID.toString(), DiaDanh.ID.toString());
    setState(() {});
    lstaikhoan = data;
    lstluotthich = data1;
  }

  //late bool _isfavoriteState = _isfavorite();
  bool _isfavorite() {
    if (lstluotthich.length == 0) {
      return false;
    } else {
      if (lstluotthich[0].TRANGTHAI == 1) {
        return true;
      }
      return false;
    }
  }

  Future _click() async {
    setState(() {});
    //_isfavoriteState = !_isfavoriteState;
    //_isfavorite() == true ? false : true;
    //_favoriteCounter += _isfavorite == true ? 1 : -1;
    id_diadanh = DiaDanh.ID;
    id_nguoitym = lstaikhoan[0].ID;
    //xulitymactive();
    xulitym();
  }

  Future xulitym() async {
    var url = DiaChiIP().IP + "connect_db/xlluotthichdd.php";
    var response = await http.post(Uri.parse(url), body: {
      "ID_NGUOIYEUTHICH": id_nguoitym.toString(),
      "ID_DIADANHYEUTHICH": id_diadanh.toString(),
    });
  }

  // Future xulitymactive() async {
  //   var url = DiaChiIP().IP + "connect_db/laytrangthai.php";
  //   var response = await http.post(Uri.parse(url), body: {
  //     "ID_NGUOIYEUTHICH": id_nguoitym.toString(),
  //     "ID_DIADANHYEUTHICH": id_diadanh.toString()
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _Loadlsdiadanh();
    LayThongTinDN();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TrangChu()));
            },
          ),
          title: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "CHI TIẾT ĐỊA DANH",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                child: DiaDanh.HINHANH.substring(0, 5) == "https"
                    ? Image.network(
                        DiaDanh.HINHANH,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        DiaChiIP().IP + "connect_db/avt/${DiaDanh.HINHANH}",
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 340,
                      child: Text(
                        DiaDanh.TENDIADANH,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.edit_location_alt_rounded,
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          DiaDanh.KINHDO,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Text(
                          DiaDanh.VIDO,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Row(
                          children: [
                            Text('Yêu thích : '),
                            IconButton(
                              onPressed: () {
                                _click();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChiTiet(DiaDanh: DiaDanh)));
                              },
                              icon: _isfavorite()
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border),
                              iconSize: 30,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mô tả:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                child: Expanded(
                  child: Text(
                    DiaDanh.MOTA,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BaiVietLienQuan(DiaDanh: DiaDanh)));
                          },
                          icon: Icon(Icons.menu_book_rounded),
                          iconSize: 50,
                          color: Colors.green,
                        ),
                        Text(
                          'Bài viết liên quan',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenHomeMap()));
                          },
                          icon: Icon(Icons.map),
                          iconSize: 50,
                          color: Colors.purple,
                        ),
                        Text(
                          'Vị trí',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DangBai(DiaDanh: DiaDanh)));
                          },
                          icon: Icon(Icons.share_rounded),
                          iconSize: 50,
                          color: Colors.yellow,
                        ),
                        Text(
                          'Chia sẻ bài viết',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
