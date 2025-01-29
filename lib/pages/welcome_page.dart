import 'package:flutter/material.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/pages/navpages/main_page.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:my_app/widgets/app_text.dart';
import 'package:my_app/widgets/responsive_button.dart';
// import 'package:my_app/pages/home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "assets/img/welcome-one.png",
    "assets/img/welcome-two.png",
    "assets/img/welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.08),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: "Trips",
                              size: screenWidth * 0.08,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            AppText(
                              text: "Mountain",
                              size: screenWidth * 0.07,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: screenWidth * 0.6,
                              ),
                              child: AppText(
                                text:
                                    "Mountain hikes give you an incredible sense of freedom along with endurance test",
                                color: AppColors.textColor2,
                                size: screenWidth * 0.035,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.04),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                );
                              },
                              child: Container(
                                width: screenWidth * 0.3,
                                child: ResponsiveButton(
                                  width: screenWidth * 0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: List.generate(3, (indexDots) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 4),
                              width: 8,
                              height: index == indexDots ? 25 : 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? AppColors.mainColor
                                    : AppColors.mainColor.withOpacity(0.3),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.easeInOutCubic;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        );
}
