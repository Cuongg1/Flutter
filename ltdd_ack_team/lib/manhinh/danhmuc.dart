import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/diadanh_danhmuc.dart';
import 'package:ltdd_ack_team/provider/diadanh_dataprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/danhmuc_object.dart';
import '../provider/danhmuc_pr.dart';
import '../model/diadanh_object.dart';

class DanhMuc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DanhMucState();
  }
}

class DanhMucState extends State<DanhMuc> {
  List<DanhMucObject> lsdanhmuc = [];
  void _Loadlsdiadanh() async {
    final data = await DanhMucProvider.getAll();
    setState(() {});
    lsdanhmuc = data;
  }

  @override
  void initState() {
    super.initState();
    _Loadlsdiadanh();
    _Loaddiadanh();
  }

  List<DiaDanhObject> lsdiadanh = [];
  void _Loaddiadanh() async {
    final data = await DiaDanhProvider.getAll();
    setState(() {});
    lsdiadanh = data;
  }

  // List<CategoryObject> lstDanhMuc = [];

  // void _LoadDanhSachDanhMuc() async {
  //   final data = await CategoryProvider.getAllCategory();
  //   setState(() {});
  //   lstDanhMuc = data;
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _LoadDanhSachDanhMuc();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        automaticallyImplyLeading: false,
        title: Text('Danh Mục'),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.white,
                Colors.blue.shade200,
                Colors.blue.shade300,
                Colors.blue.shade400,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: lsdanhmuc.length,
                itemBuilder: (context, index) => Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DanhMucDiaDanh(
                                    DiaDanhTheoDM: lsdanhmuc[index],
                                  )));
                    },
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                lsdanhmuc[index].HINHANH,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.white,
                                      padding: EdgeInsets.all(0),
                                      child: Icon(
                                        Icons.ac_unit,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    lsdanhmuc[index].TENDANHMUC,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
