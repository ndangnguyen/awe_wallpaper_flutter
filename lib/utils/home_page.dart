import 'package:awe_wallpaper/bloc/home_bloc.dart';
import 'package:awe_wallpaper/data/model/random_response.dart';
import 'package:awe_wallpaper/di/get_it_manager.dart';
import 'package:flutter/material.dart';

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
        child: StreamBuilder(
          stream: _homeBloc.randomImage.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      _buildAppBar(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                            height: 200,
                            child: PageView(
                              controller: _pageController,
                              children: <Widget>[
                                Image.network(
                                  (snapshot.data as RandomResponse).urls.small,
                                  fit: BoxFit.cover,
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
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container(
              color: Colors.green,
            );
          },
        ),
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
}
