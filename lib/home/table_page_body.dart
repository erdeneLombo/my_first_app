import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/widgets/big_text.dart';

class TablePageBody extends StatefulWidget {
  const TablePageBody({super.key});

  @override
  State<TablePageBody> createState() => _TablePageBodyState();
}

class _TablePageBodyState extends State<TablePageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(children: [
      Container(
        height: 220,
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
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
            height: 140,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: 'Rainbow'),
                    const Gap(10),
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
                      ],
                    )
                  ],
                ))),
      ),
    ]);
  }
}
