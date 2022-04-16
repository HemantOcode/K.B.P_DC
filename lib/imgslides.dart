import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class slideimg extends StatelessWidget {
  const slideimg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Image> img;
    return (Scaffold(
      body: Container(
        child: Center(
            child: ListView(
          children: [
            SizedBox(
                height: 225,
                width: double.infinity,
                child: CarouselSlider(
                  items: img = [
                    Image.asset(
                      "assets/slide1.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/slide2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/slide3.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/slide4.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/slide5.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/slide6.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/slide7.jpg",
                      fit: BoxFit.cover,
                    ),
                  ],
                  options:
                      CarouselOptions(autoPlay: true, enlargeCenterPage: true),
                ))
          ],
        )),
      ),
    ));
  }
}
