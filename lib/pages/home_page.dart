import 'package:flutter/material.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:flutter/painting.dart';
import 'package:my_app/widgets/app_text.dart';
import 'package:my_app/pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Menu Text..
            Container(
                padding: EdgeInsets.only(left: 20, top: 70),
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black54,
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 40),
            //Discover Text..
            Container(
              margin: EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover", size: 30),
            ),
            SizedBox(height: 35),
            //tabar...
            Container(
                // padding: EdgeInsets.only(left: 20),
                child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  labelPadding: const EdgeInsets.only(right: 40),
                  labelColor: Colors.black,
                  controller: _tabController,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.label,
                  // indicator: UnderlineTabIndicator(
                  //   borderSide: BorderSide(width: 3, color: Colors.blue),
                  // ),
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions"),
                  ]),
            )),
            Container(
              margin: const EdgeInsets.only(left: 20),
              height: MediaQuery.of(context).size.height * 0.32,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      String imagePath = index == 0
                          ? "assets/img/mountain.jpeg"
                          : index == 1
                              ? "assets/img/mountain2.jpg"
                              : "assets/img/Mountain4.jpeg";

                      String locationName = index == 0
                          ? "Cascade"
                          : index == 1
                              ? "Yosemite"
                              : "Alps";

                      String locationDetail = index == 0
                          ? "Canada, Banff"
                          : index == 1
                              ? "USA, California"
                              : "Switzerland";

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomSlideTransition(
                              DetailPage(
                                key: UniqueKey(),
                                name: locationName,
                                location: locationDetail,
                                img: imagePath,
                                price: index == 0
                                    ? 220
                                    : index == 1
                                        ? 250
                                        : 190,
                                stars: 4,
                                description:
                                    "You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.",
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15, top: 10),
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: locationName,
                                  color: Colors.white,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: AppColors.mainColor),
                                    SizedBox(width: 5),
                                    AppText(
                                      text: locationDetail,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomSlideTransition(
                              DetailPage(
                                key: UniqueKey(),
                                name: index == 0
                                    ? "Mountain Hiking"
                                    : "Mountain Camping",
                                location: index == 0
                                    ? "Various Mountains"
                                    : "Alpine Peaks",
                                img: index == 0
                                    ? "assets/img/MountainHiking.jpg"
                                    : "assets/img/Campaign.png",
                                price: index == 0 ? 180 : 200,
                                stars: 5,
                                description:
                                    "Experience the thrill of mountain adventures. Perfect for nature lovers and adventure seekers.",
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15, top: 10),
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(index == 0
                                  ? "assets/img/MountainHinking.jpg"
                                  : "assets/img/Campning2.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: index == 0
                                      ? "Mountain Hiking"
                                      : "Mountain Camping",
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5),
                                AppText(
                                  text: index == 0
                                      ? "Adventure Awaits"
                                      : "Under the Stars",
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final emotions = [
                        {
                          "title": "Peaceful Retreat",
                          "subtitle": "Find your zen",
                          "image": "assets/img/peaceful1.webp",
                          "mood": "Relaxing",
                        },
                        {
                          "title": "Adventure Rush",
                          "subtitle": "Feel the thrill",
                          "image": "assets/img/RushAdventure.jpeg",
                          "mood": "Exciting",
                        },
                        {
                          "title": "Nature Escape",
                          "subtitle": "Connect with nature",
                          "image": "assets/img/NatureEscape.jpg",
                          "mood": "Refreshing",
                        },
                      ];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomSlideTransition(
                              DetailPage(
                                key: UniqueKey(),
                                name: emotions[index]["title"]!,
                                location: emotions[index]["mood"]!,
                                img: emotions[index]["image"]!,
                                price: 160 + (index * 30),
                                stars: 5,
                                description:
                                    "Experience a journey that matches your mood. Perfect for those seeking ${emotions[index]["mood"]!.toLowerCase()} adventures.",
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15, top: 10),
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(emotions[index]["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppLargeText(
                                  text: emotions[index]["title"]!,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5),
                                AppText(
                                  text: emotions[index]["subtitle"]!,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: AppText(
                                    text: emotions[index]["mood"]!,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: "Explore more", size: 22),
                  AppText(text: "See all", color: AppColors.textColor1),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomSlideTransition(
                              DetailPage(
                                key: UniqueKey(),
                                name: images.values.elementAt(index),
                                location: "Various Locations",
                                img:
                                    "assets/img/${images.keys.elementAt(index)}",
                                price: 150,
                                stars: 4,
                                description:
                                    "You must go for a travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.",
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/img/${images.keys.elementAt(index)}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7),
                                Container(
                                  child: AppText(
                                      text: images.values.elementAt(index),
                                      color: AppColors.textColor2),
                                ),
                              ]),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

//Tab Indicator... that circle inidcator Below the TabBar...

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

class CustomSlideTransition extends PageRouteBuilder {
  final Widget page;

  CustomSlideTransition(this.page)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutCubic;

            var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );

            var fadeAnimation = Tween(
              begin: 0.0,
              end: 1.0,
            ).chain(CurveTween(curve: curve)).animate(animation);

            return FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: animation.drive(tween),
                child: child,
              ),
            );
          },
        );
}
