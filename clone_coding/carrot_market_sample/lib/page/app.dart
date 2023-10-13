import 'package:carrot_market_sample/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  Widget _bodyWidget() {
    if (_currentPageIndex != 0) {
      return Center(
        child: Text("Page $_currentPageIndex"),
      );
    }
    return const Home();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          "assets/svg/${iconName}_off.svg",
          width: 22,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          "assets/svg/${iconName}_on.svg",
          width: 22,
        ),
      ),
      label: label,
    );
  }

  Widget _bottomWidget() {
    return BottomNavigationBar(
      items: [
        _bottomNavigationBarItem("home", "Home"),
        _bottomNavigationBarItem("notes", "Notes"),
        _bottomNavigationBarItem("location", "Location"),
        _bottomNavigationBarItem("chat", "Chat"),
        _bottomNavigationBarItem("user", "User"),
      ],
      onTap: (idx) {
        setState(() {
          _currentPageIndex = idx;
        });
      },
      currentIndex: _currentPageIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _bodyWidget(), bottomNavigationBar: _bottomWidget());
  }
}
