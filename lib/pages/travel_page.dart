import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  //页面控制器
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text("旅拍"),
        ),
      );
}
