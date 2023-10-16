import 'package:carrot_market_sample/page/detail.dart';
import 'package:carrot_market_sample/repository/contents_repository.dart';
import 'package:carrot_market_sample/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentLocation = 0;
  final List<String> locationStr = [
    "아라동",
    "오라동",
    "연동",
  ];
  final ContentsRepository contentsRepository = ContentsRepository();

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      //leading: title 왼쪽 부분임. 사용 안함
      elevation: 1,
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: PopupMenuButton<int>(
          onSelected: (value) {
            print(value);
            setState(() {
              currentLocation = value;
            });
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(value: 0, child: Text(locationStr[0])),
              PopupMenuItem(value: 1, child: Text(locationStr[1])),
              PopupMenuItem(value: 2, child: Text(locationStr[2])),
            ];
          },
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            1,
          ),
          offset: const Offset(0, 30),
          child: Row(
            children: [
              Text(locationStr[currentLocation]),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        // onLongPress: () {
        //   print("long press");
        // },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/svg/bell.svg",
            width: 22,
          ),
        ),
      ],
      // backgroundColor: Colors.white,
    );
  }

  Future<List<Map<String, String>>> _loadContents() {
    return contentsRepository
        .loadContentsFromLocation(locationStr[currentLocation]);
  }

  ListView _makeDataList(List<Map<String, String>> datas) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => DetailContentView(
                      data: datas[index],
                    )));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Hero(
                    tag: datas[index]["cid"]!,
                    child: Image.asset(
                      datas[index]["image"]!,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    // color: Colors.yellow, // to see the size of the container
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          datas[index]["title"]!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          datas[index]["location"]!,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.3)),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          DataUtils.calcStringToWon(datas[index]["price"]!),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/heart_off.svg",
                              width: 13,
                              height: 13,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(datas[index]["likes"]!),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(height: 1, color: Colors.black.withOpacity(0.1));
      },
      itemCount: datas.length,
    );
  }

  Widget _bodyWidget() {
    return FutureBuilder(
      future: _loadContents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.hasData == false) {
          return const Center(
            child: Text("데이터 오류"),
          );
        }
        if (snapshot.data!.isNotEmpty) {
          return _makeDataList(snapshot.data!);
        } else {
          return const Center(
            child: Text("해당 지역 데이터가 없습니다."),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }
}
