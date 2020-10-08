import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageUrls = [
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2171756432,1932813666&fm=26&gp=0.jpg',
    ''
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=293024887,2996913267&fm=26&gp=0.jpg',
    ''
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1765232562,2313752077&fm=26&gp=0.jpg'
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
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
              )
            ],
          ),
        ),
      );
}
