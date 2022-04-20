import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/texts.dart';
import 'package:grisoft/core/init/extensions/device_size_extensions.dart';
import 'package:grisoft/core/init/styles/text_styles.dart';
import 'package:grisoft/core/provider/links_provider.dart';

import 'package:grisoft/screen/main_screen/main_screen_viewmodel.dart';

import '../../../core/constant/colors.dart';

class BottomSide extends StatelessWidget with MainScreenViewModel {
  final LinksProvider linksProvider;
  const BottomSide({Key? key, required this.linksProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.deviceWidth * .1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.customHeight,
            child: TextFormField(
              controller: linksProvider.linkController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hoverColor: Colors.white,
                  filled: true,
                  fillColor: ColorConstants.background,
                  hintText: linksProvider.isWarn ? Texts.instance.fieldEmotyWarn : Texts.instance.textfieldEmpty,
                  hintStyle: TextStyle(
                      color: linksProvider.isWarn ? Colors.red : Colors.grey.shade600,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () async {
              await shorten(context);
            },
            child: Container(
              width: context.customWidth,
              height: context.customHeight,
              child: Center(
                  child: Text(
                Texts.instance.shortenButton,
                style: TextStyles.instance.shortenButton,
              )),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: ColorConstants.cyan),
            ),
          )
        ],
      ),
    );
  }
}
