import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../models/card_swiper_model.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Swiper(
            itemCount: sliderItems.length,
            autoplay: true,
            autoplayDelay: 5000,
            curve: Curves.easeIn,
            layout: SwiperLayout.DEFAULT,
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(),
            ),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                semanticContainer: true,
                elevation: 10,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 30,
                  left: 10,
                  right: 10,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CardSwiperModel(
                  sliderItems[index],
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
