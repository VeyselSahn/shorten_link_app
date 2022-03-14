import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/colors.dart';
import 'package:grisoft/screen/main_screen/components/bottom_side.dart';
import 'package:grisoft/screen/main_screen/components/link_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    width: size.width,
                    color: ColorConstants.background,
                    child: const ListYedek(),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: ColorConstants.purple,
                    child: const BottomSide(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
