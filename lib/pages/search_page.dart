import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //页面控制器
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Text("搜索"),
        ),
      );
}
