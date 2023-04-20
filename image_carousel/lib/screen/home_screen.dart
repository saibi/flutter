import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      print('running!');
      int? page = pageController.page?.toInt();
      if (page == null) {
        return;
      }

      page = (page + 1) % 5;
      pageController.animateToPage(page,
          duration: Duration(milliseconds: 2000), curve: Curves.decelerate);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1, 2, 3, 4, 5]
            .map(
              (number) => Image.asset('asset/img/image_$number.jpeg',
                  fit: BoxFit.cover),
            )
            .toList(),
      ),
    );
  }
}
