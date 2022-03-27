import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/chitietdiadanh.dart';

import '../provider/diadanh_dataprovider.dart';
import '../model/diadanh_object.dart';

class TimKiem1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimKiem1State();
  }
}

class TimKiem1State extends State<TimKiem1> {
  List<DiaDanhObject> lsdiadanh = [];
  List<DiaDanhObject> lsdiadanh1 = [];
  void _Loadlsdiadanh() async {
    final data = await DiaDanhProvider.getAll();
    setState(() {});
    lsdiadanh = data;
    lsdiadanh1 = data;
  }

  @override
  void initState() {
    super.initState();
    _Loadlsdiadanh();
    setState(() {
      lsdiadanh1 = lsdiadanh;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tìm Kiếm"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listDiaDanh(index - 1);
        },
        itemCount: lsdiadanh1.length + 1,
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(hintText: 'Nhập tên địa danh'),
        onChanged: (Text) {
          Text = Text..toLowerCase();
          setState(() {
            lsdiadanh1 = lsdiadanh.where((note) {
              var noteTitle = note.TENDIADANH.toLowerCase();
              return noteTitle.contains(Text);
            }).toList();
          });
        },
      ),
    );
  }

  _listDiaDanh(index) {
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
        child: ListTile(
          title: Image.network(lsdiadanh1[index].HINHANH),
          subtitle: Text(
            lsdiadanh1[index].TENDIADANH,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChiTiet(DiaDanh: lsdiadanh[index])));
          },
        ),
      ),
    );
  }
}
