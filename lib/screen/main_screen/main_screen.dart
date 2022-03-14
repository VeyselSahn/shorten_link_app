import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/colors.dart';
import 'package:grisoft/screen/main_screen/components/bottom_side.dart';
import 'package:grisoft/screen/main_screen/components/link_list_empty.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height, minWidth: size.width),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      width: size.width,
                      color: ColorConstants.background,
                      child: const LinkListEmpty(),
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
      ),
    );
  }
}
