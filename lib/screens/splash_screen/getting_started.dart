import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/login_screen/login_screen.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({super.key});

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  CarouselSliderController carouselController = CarouselSliderController();
  List<Widget> list = [
    const SliderItems(
      ImageUrl: "assets/popcorn.png",
      text1: "Choose A Tasty Dish",
      text2: "Order anything you want from your \nFavorite restaurant.",
    ),
    const SliderItems(
      ImageUrl: "assets/payment.png",
      text1: "Easy Payment",
      text2:
          "Payment mode easy through debiy \ncard,credit card & more ways to pay \nfor your food",
    ),
    const SliderItems(
      ImageUrl: "assets/enjoyFood.png",
      text1: "Enjoy the Taste!",
      text2:
          "Healthy eating means eating a variety \nof foods that give you the nutrients you \need to maintain your health",
    ),
  ];
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: size.height / 2,
                viewportFraction: 0.9, //use to chage slide width
                autoPlay: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            carouselController: carouselController,
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    child: i,
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _current == entry.key ? Colors.amber : Colors.grey),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 5,
          ),
          Stack(
            children: [
              Image.asset(
                "assets/bottom1.png",
                width: size.width,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                bottom: 55,
                right: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => carouselController.nextPage(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SliderItems extends StatelessWidget {
  final String ImageUrl;
  final String text1;
  final String text2;
  const SliderItems(
      {super.key,
      required this.ImageUrl,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          ImageUrl,
          width: 200,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text1,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
