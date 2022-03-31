import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grisoft/core/constant/texts.dart';
import 'package:grisoft/core/init/extensions/device_size_extensions.dart';
import 'package:grisoft/core/init/extensions/image_path_extensions.dart';
import 'package:grisoft/core/init/styles/text_styles.dart';
import 'package:grisoft/screen/main_screen/main_screen_viewmodel.dart';

class LogoScreen extends StatelessWidget with MainScreenViewModel {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 3 / 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () async {
                await serverAddressDialog(context);
              },
              child: SvgPicture.asset('logo'.svgImageAsset)),
          SvgPicture.asset('illustration'.svgImageAsset),
          Text(
            Texts.instance.listEmpty,
            style: TextStyles.instance.titleBold,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            Texts.instance.emptySecond,
            style: TextStyles.instance.other,
          )
        ],
      ),
    );
  }
}
