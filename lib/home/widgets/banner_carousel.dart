import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  final double deviceWidth;
  final double deviceHeight;
  final List images;
  BannerCarousel({
    required this.deviceHeight,
    required this.deviceWidth,
    required this.images,
  });

  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final CarouselController _carouselController = CarouselController();
  // final images = [
  //   'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
  //   'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__480.jpg',
  //   'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__480.jpg',
  //   'https://st.depositphotos.com/1428083/2946/i/600/depositphotos_29460297-stock-photo-bird-cage.jpg',
  // ];
  int myIndex = 0;
  String i = '';

  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty
        ? const SizedBox()
        : Container(
            margin: EdgeInsets.only(bottom: widget.deviceWidth * 0.01),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: widget.deviceWidth * 0.47,
                  child: CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      aspectRatio: 1,
                      autoPlay: true,
                      viewportFraction: 0.92,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 400),
                      autoPlayInterval: const Duration(seconds: 10),
                      onPageChanged: (i, _) {
                        setState(() {
                          myIndex = i;
                        });
                      },
                    ),
                    items: [
                      ...widget.images
                          .asMap()
                          .map((i, banner) {
                            return MapEntry(
                              i,
                              Banners(
                                banner: banner,
                              ),
                            );
                          })
                          .values
                          .toList()
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...widget.images
                        .asMap()
                        .map((index, image) {
                          return MapEntry(
                            index,
                            Container(
                              width: index == myIndex ? 22 : 5.0,
                              height: 6.0,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 1.5,
                              ),
                              decoration: index == myIndex
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Theme.of(context).primaryColor,
                                    )
                                  : const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                            ),
                          );
                        })
                        .values
                        .toList()
                  ],
                ),
              ],
            ),
          );
  }
}

class Banners extends StatelessWidget {
  final String banner;
  const Banners({
    Key? key,
    required this.banner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: banner,
          placeholder: (_, __) => Image.asset(
            'assets/png/placeholder.webp',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
