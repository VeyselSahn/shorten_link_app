import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/colors.dart';
import 'package:grisoft/core/constant/hive_constants.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:grisoft/core/service/cache_service.dart';
import 'package:grisoft/screen/main_screen/components/bottom_side.dart';
import 'package:grisoft/screen/main_screen/components/list_screen.dart';
import 'package:grisoft/screen/main_screen/components/logo_screen.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<LinksProvider>(
        builder: (context, linksProvider, child) => ValueListenableBuilder(
          valueListenable: Hive.box(HiveConstants.instance.linksBoxKey).listenable(),
          builder: (context,Box linkBox, child) => SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        width: size.width,
                        color: ColorConstants.background,
                        child: CacheService().getLinks().isNotEmpty
                            ? ListScreen(
                                linksProvider: linksProvider,
                              )
                            : const LogoScreen(),
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
        ),
      ),
    );
  }


}
