import 'package:sample/Functions/fetch_community_data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselCommunities extends StatefulWidget {
  const CarouselCommunities({super.key});

  @override
  CarouselCommunitiesState createState() => CarouselCommunitiesState();
}

class CarouselCommunitiesState extends State<CarouselCommunities> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCommunityData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Widget>? carouselItems = snapshot.data;
          return Column(
            children: <Widget>[
              CarouselSlider(
                items: carouselItems!,
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval:
                      const Duration(seconds: 3), // Duration for each slide
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  initialPage: 2,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
