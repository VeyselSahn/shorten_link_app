import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grisoft/core/init/extensions/image_path_extensions.dart';
import 'package:grisoft/core/model/link_item_model.dart';
import 'package:grisoft/core/provider/links_provider.dart';
import 'package:grisoft/core/service/cache_service.dart';

import '../../../core/constant/colors.dart';

class ListScreen extends StatelessWidget {
  final LinksProvider linksProvider;
  const ListScreen({
    Key? key,
    required this.linksProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * .07,
        ),
        const Text(
          'Your Link History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
        ),
        SizedBox(
          height: size.height * 0.65,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: CacheService.instance.getLinks().length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return listItem(size, CacheService.instance.getLinks().elementAt(index));
            },
          ),
        )
      ],
    );
  }

  Widget listItem(Size size, LinkItemModel model) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      actionsPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.originalLink ?? '', style: const TextStyle(color: Colors.black, fontSize: 15)),
              GestureDetector(
                  onTap: () async => await CacheService.instance.deleteLink(model),
                  child: SvgPicture.asset('del'.svgImageAsset))
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
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: model.shortLink!));
            linksProvider.changeCopiedLink(model.shortLink ?? '');
          },
          child: Container(
            width: size.width * .8,
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
