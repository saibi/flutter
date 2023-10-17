import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_sample/components/manor_temp_widget.dart';
import 'package:carrot_market_sample/repository/contents_repository.dart';
import 'package:carrot_market_sample/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailContentView extends StatefulWidget {
  final Map<String, String> data;
  const DetailContentView({super.key, required this.data});

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

const imageMax = 5;

class _DetailContentViewState extends State<DetailContentView>
    with SingleTickerProviderStateMixin {
  late Size size;
  int _current = 0;
  double scrollpositionToAlpha = 0;
  final ScrollController _controller = ScrollController();

  late AnimationController _animationController;
  late Animation _colorTween;
  bool isMyFavoriteContent = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ContentsRepository contentsRepository = ContentsRepository();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _colorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);

    _controller.addListener(() {
      setState(() {
        scrollpositionToAlpha = _controller.offset;
        _animationController.value = scrollpositionToAlpha / 255;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  Widget _makeIcon(IconData icon) {
    return AnimatedBuilder(
        animation: _colorTween,
        builder: (context, child) => Icon(
              icon,
              color: _colorTween.value,
            ));
  }

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.white.withAlpha(scrollpositionToAlpha.toInt()),
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: _makeIcon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: _makeIcon(Icons.share),
        ),
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

  Widget _line() {
    return Container(
      height: 1,
      color: Colors.grey.withOpacity(0.3),
      margin: const EdgeInsets.symmetric(horizontal: 15),
    );
  }

  Widget _contentDetail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            widget.data["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text(
            "디지털/가전 ∙ 22시간 전",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "선물받은 새상품이고 사용한적이 없어요~\n거래는 직거래만 가능하며, 택배거래는 불가합니다.",
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "채팅 3 ∙ 관심 17 ∙ 조회 295",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _otherCellContents() {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "판매자님의 판매 상품",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "모두보기",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _makeSliderImage(),
              _sellerSimpleInfo(),
              _line(),
              _contentDetail(),
              _line(),
              _otherCellContents(),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildListDelegate(
              List.generate(
                20,
                (index) {
                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Colors.yellow,
                            height: 120,
                          ),
                        ),
                        const Text(
                          "상품제목",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          "금액",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 55,
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isMyFavoriteContent = !isMyFavoriteContent;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text(
                    isMyFavoriteContent
                        ? "Added to favorites"
                        : "Removed from favorites",
                  ),
                ),
              );
              // scaffoldKey.currentState!.showSnackBar(const SnackBar(
              //   duration: Duration(seconds: 1),
              //   content: Text(),
              // ));
            },
            child: SvgPicture.asset(
                isMyFavoriteContent
                    ? "assets/svg/heart_on.svg"
                    : "assets/svg/heart_off.svg",
                width: 20,
                height: 20,
                color: const Color(0xfff08f4f)),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 10),
            width: 1,
            height: 40,
            color: Colors.grey.withOpacity(0.2),
          ),
          Column(
            children: [
              Text(
                DataUtils.calcStringToWon(widget.data["price"]!),
              ),
              const Text(
                "가격제안불가",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xfff08f4f),
                  ),
                  child: const Text(
                    "채팅으로 거래하기",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: _appBarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
