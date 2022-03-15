import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/colors.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:grisoft/screen/main_screen/components/bottom_side.dart';
import 'package:grisoft/screen/main_screen/components/link_list.dart';
import 'package:grisoft/screen/main_screen/components/link_list_empty.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<LinksProvider>(
        builder: (context, linksProvider, child) => Stack(
          children: [
            linksProvider.isLoading ? Positioned(height: size.height / 2, child: Text('Loading')) : SizedBox(),
            SingleChildScrollView(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: size.width,
                          color: ColorConstants.background,
                          child: linksProvider.linkList.isNotEmpty
                              ? ListYedek(
                                  linksProvider: linksProvider,
                                )
                              : LinkListEmpty(),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: ColorConstants.purple,
                          child: BottomSide(
                            linksProvider: linksProvider,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
