import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltdd_ack_team/manhinh/trangchu.dart';
import 'package:ltdd_ack_team/manhinh/trangchu_main.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}

class LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => TrangChu(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              width: 120.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
