import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cloud/pages/home_page.dart';
import 'package:flutter_cloud/pages/my_page.dart';
import 'package:flutter_cloud/pages/search_page.dart';
import 'package:flutter_cloud/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  //未点击状态的颜色
  final _defaultColor = Colors.grey;

  //点击状态的颜色
  final _activeColor = Colors.blue;

  //当前index下标
  int _currentIndex = 0;

  //页面控制器
  final _controller = PageController(initialPage: 0);

  //滑动监听
  void _pageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageView(
          onPageChanged: _pageChanged,
          controller: _controller,
          children: <Widget>[
            HomePage(),
            SearchPage(),
            TravelPage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          //当前选中的
          currentIndex: _currentIndex,
          //点击时调用
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          //fixed 固定tab不变，shifting 随着点击变化
          type: BottomNavigationBarType.shifting,
          items: [
            getBottomItem('首页', Icons.home, _defaultColor, _activeColor,
                _currentIndex, 0),
            getBottomItem('搜索', Icons.search, _defaultColor, _activeColor,
                _currentIndex, 1),
            getBottomItem('旅拍', Icons.photo, _defaultColor, _activeColor,
                _currentIndex, 2),
            getBottomItem('我的', Icons.account_circle, _defaultColor,
                _activeColor, _currentIndex, 3)
          ],
        ),
      );
}

BottomNavigationBarItem getBottomItem(String title, IconData iconData,
    Color defaultColor, Color activeColor, int currentIndex, int index) {
  return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: defaultColor,
      ),
      activeIcon: Icon(
        iconData,
        color: activeColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: currentIndex != index ? defaultColor : activeColor),
      ));
}
