import 'package:flutter/material.dart';
import 'package:my_first_app/home/table_page_body.dart';
import 'package:my_first_app/utils/colors.dart';
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
          Container(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              margin: const EdgeInsets.only(top: 60, bottom: 15),
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
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
          const TablePageBody(),
        ],
      ),
    );
  }
}
