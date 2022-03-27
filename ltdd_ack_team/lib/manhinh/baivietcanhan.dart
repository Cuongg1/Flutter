import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/chitietbaiviet.dart';
import 'package:ltdd_ack_team/manhinh/manhinhtrangcanhan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/baiviettheoid_object.dart';
import '../provider/baiviettheoid_provider.dart';
import '../diachiIP.dart';
import '../provider/diadanh_dataprovider.dart';
import '../model/diadanh_object.dart';
import '../model/taikhoan_object.dart';
import '../provider/taikhoan_pr.dart';
import '../provider/taikhoan_provider.dart';
import 'package:http/http.dart' as http;

class BaiVietCaNhan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BaiVietCaNhanState();
  }
}

class BaiVietCaNhanState extends State<BaiVietCaNhan>
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
  List<BaiVietTheoIDObject> lstBV = [];
  List<DiaDanhObject> lstdiadanh = [];
  List<TaiKhoanObject> lsttaikhoan = [];
  void _Loadlbaiviet() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final dataBV = await BaiVietTheoIDProvider.getAllbyEmail(EMAIL);
    final data1 = await DiaDanhProvider.getAll();
    final data2 = await TaiKhoanProvider1.getAll();
    setState(() {});
    lstBV = dataBV;
    lstdiadanh = data1;
    lsttaikhoan = data2;
  }

  late int idbv1;
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
      "ID_BAIVIET": idbv1.toString(),
    }).whenComplete(() => _Loadlbaiviet());
  }

  @override
  void initState() {
    super.initState();

    _Loadlbaiviet();
    LayThongTinDN();
  }

  late int idbv;
  Future xoabaiviet() async {
    var url = DiaChiIP().IP + "connect_db/xoabaiviet.php";
    var response = await http.post(Uri.parse(url), body: {
      "ID_BAIVIET": idbv.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trang cá nhân",
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
                                              width: 8,
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
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.red,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //     context,
                                                    //     MaterialPageRoute(
//         builder: (context) => ChiTiet()));
                                                  },
                                                  child: Column(
                                                    children: [
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
                                            ],
                                          ),
                                          width: 300,
                                        ),
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
                                        "connect_db/avt/${lstBV[index].HINHANHBV}"),
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
                                          idbv1 = lstBV[index].ID;
                                          idnguoithich = lstaikhoan[0].ID;
                                          xulilike();
                                        },
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChiTietBaiViet(
                                                  ID_BaiViet: lstBV[index].ID,
                                                  HinhAnhBaiViet:
                                                      lstBV[index].HINHANHBV,
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
                                Row(
                                  children: [
                                    PopupMenuButton(
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                child: TextButton(
                                                  onPressed: () {
                                                    idbv = lstBV[index].ID;
                                                    xoabaiviet();
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                BaiVietCaNhan()));
                                                  },
                                                  child: Text("Xoá"),
                                                ),
                                              ),
                                            ])
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
