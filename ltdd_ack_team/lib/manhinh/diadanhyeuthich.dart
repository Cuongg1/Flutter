import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/chitietbaiviet.dart';
import 'package:ltdd_ack_team/model/danhmuc_object.dart';
import 'package:ltdd_ack_team/model/ddyeuthich_object.dart';
import 'package:ltdd_ack_team/provider/danhmuc_pr.dart';
import 'package:ltdd_ack_team/provider/ddyeuthich_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/baiviettheoid_object.dart';
import '../provider/baiviettheoid_provider.dart';
import '../diachiIP.dart';
import '../provider/diadanh_dataprovider.dart';
import '../model/diadanh_object.dart';
import '../model/taikhoan_object.dart';
import '../provider/taikhoan_pr.dart';
import '../provider/taikhoan_provider.dart';

class TrangYeuThich extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrangYeuThichState();
  }
}

class TrangYeuThichState extends State<TrangYeuThich>
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
  List<DDYeuThichObject> lstddyeuthich = [];
  List<TaiKhoanObject> lsttaikhoan = [];
  List<DanhMucObject> lstDanhMuc = [];
  List<DiaDanhObject> lsdiadanh = [];
  void _Loadlsdiadanh() async {
    final data = await DiaDanhProvider.getAll();
    final data1 = await DanhMucProvider.getAll();
    setState(() {});
    lsdiadanh = data;
    lstDanhMuc = data1;
  }

  void _Loadlbaiviet() async {
    SharedPreferences LayEMAIL = await SharedPreferences.getInstance();
    EMAIL = (LayEMAIL.getString('EMAIL') ?? '');
    final dataBV = await BaiVietTheoIDProvider.getAllbyEmail(EMAIL);
    final data = await DDYeyThichProvider.getAll(EMAIL);
    final data2 = await TaiKhoanProvider1.getAll();
    setState(() {});
    lstBV = dataBV;
    lstddyeuthich = data;
    lsttaikhoan = data2;
  }

  @override
  void initState() {
    super.initState();

    _Loadlbaiviet();
    LayThongTinDN();
    _Loadlsdiadanh();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Trang cá nhân",
      home: Scaffold(
        body: Container(
          child: ListView.builder(
            itemCount: lstddyeuthich.length,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(20),
              height: 150,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: lstddyeuthich[index].HINHANH.substring(0, 5) ==
                              "https"
                          ? Image.network(
                              lstddyeuthich[index].HINHANH,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              DiaChiIP().IP +
                                  "connect_db/avt/${lstddyeuthich[index].HINHANH}",
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20.0,
                    bottom: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ChiTiet(
                            //               DiaDanh: lsdiadanh[index],
                            //             )));
                          },
                          child: Text(
                            lstddyeuthich[index].TENDIADANH,
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
                              lstddyeuthich[index].KINHDO,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                letterSpacing: 1.2,
                              ),
                            ),
                            Text(
                              lstddyeuthich[index].VIDO,
                              style: TextStyle(
                                color: Colors.blue,
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
                              height: 0,
                            ),
                            Text(
                              lstddyeuthich[index].LUOTTHICH.toString(),
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
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
            ),
          ),
        ),
      ),
    );
  }
}
