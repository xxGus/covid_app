import 'package:flutter/material.dart';

import 'package:covid_app/utils/styles.dart' as styles;

class TabManager extends StatefulWidget {
  static const String routeName = '/tab-manager';

  @override
  _TabManagerState createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> {
  PageController _pageController;
  int _selectedIndex = 0;
  bool editScreen = true;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buttonTabBar({IconData icon, String text, int index}) {
      return Expanded(
        child: RaisedButton(
          elevation: 0,
          highlightElevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          padding: EdgeInsets.zero,
          highlightColor: Colors.white,
          color: Colors.white,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          disabledColor: Colors.transparent,
          onPressed: () => _onItemTapped(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 28,
                    ),
                    Text(
                      text.toUpperCase(),
                    ),
                  ],
                ),
              ),
              _selectedIndex == index
                  ? Container(
                      width: double.infinity,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : Center(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            styles.accentColor,
            styles.primaryColor,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          tileMode: TileMode.clamp
          ),
        ),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8.0,
        color: Colors.white,
        child: Container(
          width: double.infinity,
          height: 80,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              _buttonTabBar(icon: Icons.home, text: 'Home', index: 0),
              _buttonTabBar(icon: Icons.invert_colors, text: 'Lavar', index: 1),
              _buttonTabBar(icon: Icons.event_note, text: 'Risco', index: 2),
            ],
          ),
        ),
      ),
    );
  }
}
