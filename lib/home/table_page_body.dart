// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/icon_and_text.dart';
import 'package:my_first_app/widgets/small_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TablePageBody extends StatefulWidget {
  const TablePageBody({super.key});

  @override
  State<TablePageBody> createState() => _TablePageBodyState();
}

class _TablePageBodyState extends State<TablePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 5,
          effect: const ColorTransitionEffect(
            activeDotColor: AppColors.mainColor,
            dotColor: AppColors.textColor,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      ],
    );
  }

// Page Scrolling Effect Function Matrix4
  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      // changing position (starting condition)
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // first transition ( first condition)
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // second transition (second condition)
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);

      // third transition (third condition)
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: index.isEven ? Colors.blue : Colors.purple,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/image/corner.jpg",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Rainbow'),
                    Gap(Dimensions.height10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: AppColors.yellowColor,
                              size: 15,
                            ),
                          ),
                        ),
                        const Gap(10),
                        SmallText(text: '4.5'),
                        const Gap(10),
                        SmallText(text: '1267'),
                        const Gap(6),
                        SmallText(text: 'comments'),
                      ],
                    ),
                    Gap(Dimensions.height15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndText(
                          text: 'Normal',
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.iconColor1,
                        ),
                        IconAndText(
                          text: '1.7km',
                          icon: Icons.location_pin,
                          iconColor: AppColors.iconColor2,
                        ),
                        IconAndText(
                          text: '32min',
                          icon: Icons.access_time_rounded,
                          iconColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
