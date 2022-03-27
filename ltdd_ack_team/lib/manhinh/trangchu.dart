import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/baiviet.dart';
import 'package:ltdd_ack_team/manhinh/danhmuc.dart';
import 'package:ltdd_ack_team/manhinh/diadanh.dart';
import 'package:ltdd_ack_team/manhinh/manhinhtrangcanhan.dart';
import 'package:ltdd_ack_team/manhinh/map.dart';
import 'package:ltdd_ack_team/manhinh/timkiem.dart';
import 'package:ltdd_ack_team/manhinh/trangchu_main.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tab_baiviet.dart';

class TrangChu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TrangChuState();
  }
}

class TrangChuState extends State<TrangChu> {
  bool clickedCentreFAB = false;
  int _selectedIndex = 0;

  List<Widget> _listScreens = [
    TrangChuMain(),
    DiaDanh(),
    TabBaiViet(),
    DanhMuc(),
    TrangCaNhan(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget tabscreen = TrangChuMain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listScreens[_selectedIndex],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.blue.shade200,
          selectedItemBackgroundColor: Colors.blue,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: _selectedIndex,
        onSelectTab: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Trang chủ',
          ),
          FFNavigationBarItem(
            iconData: Icons.location_on,
            label: 'Địa danh',
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.plus,
            label: 'Bài Viết',
          ),
          FFNavigationBarItem(
            iconData: Icons.list_alt,
            label: 'Danh Mục',
          ),
          FFNavigationBarItem(
            iconData: Icons.account_circle,
            label: 'Tài khoản',
          ),
        ],
      ),
    );
  }
}
