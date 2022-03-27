import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/themdiadanh.dart';

import '../diachiIP.dart';
import '../model/diadanh_object.dart';
import '../provider/diadanh_dataprovider.dart';

class DiaDanh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiaDanhState();
  }
}

class DiaDanhState extends State<DiaDanh> {
  List<DiaDanhObject> lsdiadanh = [];
  void _Loaddiadanh() async {
    final data = await DiaDanhProvider.getAll();
    setState(() {});
    lsdiadanh = data;
  }

  @override
  void initState() {
    super.initState();
    _Loaddiadanh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: TextButton(
              child: Text("Thêm địa danh",
                  style: TextStyle(fontSize: 14, color: Colors.black)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.cyanAccent)))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThemDiaDanh()));
              },
            ),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: lsdiadanh.length,
            itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Row(
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
                                      Text(
                                        lsdiadanh[index].TENDIADANH,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          color: Colors.white,
                                          child: Icon(
                                            Icons.location_pin,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        lsdiadanh[index].KINHDO +
                                            "," +
                                            lsdiadanh[index].VIDO,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          color: Colors.white,
                                          padding: EdgeInsets.all(0),
                                          child: Icon(
                                            Icons.favorite,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        lsdiadanh[index].LUOTTHICH.toString(),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                child: Text(
                                  "- " + lsdiadanh[index].MOTA,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
