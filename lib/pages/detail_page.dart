import 'package:flutter/material.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:my_app/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String location;
  final String img;
  final int price;
  final int stars;
  final String description;

  const DetailPage({
    super.key,
    required this.name,
    required this.location,
    required this.img,
    required this.price,
    required this.stars,
    required this.description,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(children: [
          // Background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Back Button and Menu
          Positioned(
            left: 20,
            top: 50,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // White Card Content
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                // Add ScrollView for content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: widget.name,
                          color: Colors.black87,
                          size: 28,
                        ),
                        AppLargeText(
                          text: "\$ ${widget.price}",
                          color: AppColors.mainColor,
                          size: 28,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor),
                        SizedBox(width: 5),
                        AppText(
                          text: widget.location,
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < widget.stars
                                  ? AppColors.starColor
                                  : Colors.grey.withOpacity(0.3),
                              size: 24,
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        AppText(
                          text: "(${widget.stars}.0)",
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    AppLargeText(
                      text: "People",
                      color: Colors.black87,
                      size: 22,
                    ),
                    SizedBox(height: 5),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainTextColor,
                    ),
                    SizedBox(height: 10),
                    // Number Buttons
                    Container(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.grey.withOpacity(0.2),
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black87,
                      size: 22,
                    ),
                    SizedBox(height: 10),
                    AppText(
                      text: widget.description,
                      color: AppColors.mainTextColor,
                    ),
                    SizedBox(height: 100), // Space for bottom buttons
                  ],
                ),
              ),
            ),
          ),
          // Bottom Buttons
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: Border.all(
                      color: isFavorite
                          ? Colors.red
                          : Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 28,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                    child: Center(
                      child: Text(
                        "Book Trip Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
