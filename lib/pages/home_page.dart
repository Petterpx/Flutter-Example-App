import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const APPBAR_SCROLL_OFFSET = 100;

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2171756432,1932813666&fm=26&gp=0.jpg',
    ''
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=293024887,2996913267&fm=26&gp=0.jpg',
    ''
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1765232562,2313752077&fm=26&gp=0.jpg'
  ];

  double appBarAlpha = 0;

  _onScroll(offset) {
    //计算当前滚动的比例
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    //到达顶端，继续向上滚动
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(alpha);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          //默认子元素按照左上角位置排列，类似Android中的 FrameLayout
          body: Stack(
        children: [
          // MediaQuery.removePadding 可以移除padding的
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            //布局监听
            child: NotificationListener(
                //监听listView的滚动,如何元素更新，并且是第0个元素时才触发滚动监听，即只有列表滚动才监听
                //scrollNotification.depth 元素深度
                // ignore: missing_return
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification &&
                      scrollNotification.depth == 0) {
                    //滚动且列表在滚动时
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                //列表布局
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imageUrls[index],
                            //fill 按图片的宽高比填充到view中
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(title: Text('test')),
                    )
                  ],
                )),
          ),
          //透明度设置
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              //背景
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ));
}
