// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:my_first_app/home/table_page_body.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/small_text.dart';

class MainTablePage extends StatefulWidget {
  const MainTablePage({super.key});

  @override
  State<MainTablePage> createState() => _MainTablePageState();
}

class _MainTablePageState extends State<MainTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // showing the header
          Container(
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              margin: EdgeInsets.only(
                  top: Dimensions.height60, bottom: Dimensions.height15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Poland',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(text: 'Torun'),
                          const Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: Colors.amber),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // showing the body
          const TablePageBody(),
        ],
      ),
    );
  }
}
