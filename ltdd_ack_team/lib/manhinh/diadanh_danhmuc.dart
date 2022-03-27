import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/chitietdiadanh.dart';
import 'package:ltdd_ack_team/provider/ddtheodm_pr.dart';
import 'package:ltdd_ack_team/provider/diadanh_dataprovider.dart';
import 'package:ltdd_ack_team/model/diadanh_object.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/danhmuc_object.dart';
import '../provider/danhmuc_pr.dart';

class DanhMucDiaDanh extends StatefulWidget {
  final DanhMucObject DiaDanhTheoDM;
  const DanhMucDiaDanh({Key? key, required this.DiaDanhTheoDM})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DanhMucDiaDanhState(DiaDanhTheoDM: DiaDanhTheoDM);
  }
}

class DanhMucDiaDanhState extends State<DanhMucDiaDanh> {
  List<DiaDanhObject> lsdiadanh = [];
  void _Loadlsdiadanh() async {
    final data = await DiaDanhProvider.getAll();
    setState(() {});
    lsdiadanh = data;
  }

  //
  final DanhMucObject DiaDanhTheoDM;
  DanhMucDiaDanhState({required this.DiaDanhTheoDM});
  List<DiaDanhObject> lsdanhmuc = [];
  void LayDanhMuc() async {
    final LayIDDanhMuc =
        await DiaDanhtheodmProvider.getAll(DiaDanhTheoDM.ID.toString());
    setState(() {});
    lsdanhmuc = LayIDDanhMuc;
  }

  @override
  void initState() {
    super.initState();
    LayDanhMuc();
    _Loadlsdiadanh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        title: Container(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 65,
              ),
              Text(
                DiaDanhTheoDM.TENDANHMUC,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: lsdanhmuc.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(lsdanhmuc[index].TENDIADANH),
              subtitle: Text(DiaDanhTheoDM.TENDANHMUC),
              leading: Image(
                image: NetworkImage(lsdanhmuc[index].HINHANH),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChiTiet(
                              DiaDanh: lsdiadanh[index],
                            )));
              },
            ),
          ),
        ),
      ),
    );
  }
}
