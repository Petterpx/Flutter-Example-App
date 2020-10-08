import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //页面控制器
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text("首页"),
        ),
      );
}
