import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_sample/components/manor_temp_widget.dart';
import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  final Map<String, String> data;
  const DetailContentView({super.key, required this.data});

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

const imageMax = 5;

class _DetailContentViewState extends State<DetailContentView> {
  late Size size;
  int _current = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white)),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Colors.white)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white)),
      ],
    );
  }

  Widget _makeSliderImage() {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: widget.data["cid"]!,
            child: CarouselSlider(
              items: List.generate(imageMax, (index) {
                return Image.asset(
                  widget.data["image"]!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                );
              }),
              options: CarouselOptions(
                autoPlay: true,
                // enlargeCenterPage: true,
                viewportFraction: 1.0,
                initialPage: 0,
                height: size.width,
                onPageChanged: (index, reason) {
                  print(index);
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageMax, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sellerSimpleInfo() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(children: [
        // Manual way to make circle image
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(50),
        //   child: SizedBox(
        //     width: 50,
        //     height: 50,
        //     child: Image.asset("assets/images/user.png"),
        //   ),
        // ),
        CircleAvatar(
          radius: 25,
          backgroundImage: Image.asset("assets/images/user.png").image,
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("fake-seller",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text("Jeju-si"),
          ],
        ),
        Expanded(child: ManorTemperature(manorTemp: 37.5)),
      ]),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _makeSliderImage(),
        _sellerSimpleInfo(),
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      height: 55,
      width: double.infinity,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
