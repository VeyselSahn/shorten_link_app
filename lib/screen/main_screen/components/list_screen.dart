import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grisoft/core/init/extensions/device_size_extensions.dart';
import 'package:grisoft/core/init/extensions/image_path_extensions.dart';
import 'package:grisoft/core/init/styles/text_styles.dart';
import 'package:grisoft/core/model/link_item_model.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:grisoft/core/service/cache_service.dart';
import 'package:grisoft/screen/main_screen/main_screen_viewmodel.dart';
import '../../../core/constant/colors.dart';

class ListScreen extends StatelessWidget with MainScreenViewModel {
  final LinksProvider linksProvider;
  const ListScreen({
    Key? key,
    required this.linksProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.deviceHeight * .07,
        ),
        Text(
          'Your Link History',
          style: TextStyles.instance.titleBold,
        ),
        SizedBox(
          height: context.deviceHeight * 0.65,
          width: context.deviceWidth,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: CacheService.instance.getLinks().length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return listItem(context, CacheService.instance.getLinks().elementAt(index));
            },
          ),
        )
      ],
    );
  }

  Widget listItem(BuildContext context, LinkItemModel model) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      actionsPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(model.originalLink ?? '',
                      style: const TextStyle(color: Colors.black, fontSize: 15, overflow: TextOverflow.ellipsis))),
              GestureDetector(onTap: () async => deleteLink(model), child: SvgPicture.asset('del'.svgImageAsset))
            ],
          ),
          const Divider(
            color: Colors.black,
          )
        ],
      ),
      content: Text(model.shortLink ?? '', style: const TextStyle(color: ColorConstants.cyan, fontSize: 14)),
      actions: [
        GestureDetector(
          onTap: () async => copyLink(model, linksProvider),
          child: Container(
            width: context.deviceWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: linksProvider.copiedLink == model.shortLink ? ColorConstants.purple : ColorConstants.cyan,
            ),
            child: Center(
              child: Text(linksProvider.copiedLink == model.shortLink ? 'COPIED' : 'COPY',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            height: 40,
          ),
        )
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
