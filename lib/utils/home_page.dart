import 'package:awe_wallpaper/bloc/home_bloc.dart';
import 'package:awe_wallpaper/data/model/random_response.dart';
import 'package:awe_wallpaper/di/get_it_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  HomeBloc _homeBloc;
  PageController _pageController;

  @override
  void initState() {
    _homeBloc = GetItManager().get<HomeBloc>();
    _pageController = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _homeBloc.getRandomImage();
    return Material(
        child: Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _buildAppBar(),
              _buildRandomImage(),
              SizedBox(
                height: 20,
              ),
              _buildCategory(),
            ],
          ),
        ),
      ),
    ));
  }

  _buildRandomImage() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(offset: Offset(2, 2), blurRadius: 5)],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: StreamBuilder(
            stream: _homeBloc.randomImage.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return PageView(
                  controller: _pageController,
                  children: <Widget>[
                    Image.network(
                      (snapshot.data as RandomResponse).urls.small,
                      fit: BoxFit.fitWidth,
                    ),
                    Image.network(
                      (snapshot.data as RandomResponse).urls.small,
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      (snapshot.data as RandomResponse).urls.small,
                      fit: BoxFit.cover,
                    ),
                  ],
                );
              return Container();
            }),
      ),
    );
  }

  _buildAppBar() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            child: Icon(Icons.menu),
          ),
          SizedBox(
            width: 40,
          ),
          Expanded(
              child: Text(
            'Trang chủ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )),
          GestureDetector(
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  _buildCategory() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.apps,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text(
              'Phân loại',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            )),
            Text(
              'Nhiều hơn',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Icon(
              Icons.arrow_right,
              size: 18,
            ),
          ],
        ),
        _buildItemCategory(),
      ],
    );
  }

  _buildItemCategory() {
    return Container(
        height: 100,
        color: Colors.amber,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 100,
                color: Colors.red,
              ),
            );
          },
        ),
      );
  }
}
