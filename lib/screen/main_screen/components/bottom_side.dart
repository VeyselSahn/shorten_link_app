import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/texts.dart';

import '../../../core/constant/colors.dart';

class BottomSide extends StatelessWidget {
  const BottomSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hoverColor: Colors.white,
                  filled: true,
                  fillColor: ColorConstants.background,
                  hintText: Texts.instance.textfieldEmpty,
                  border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: size.width - 100,
            height: 55,
            child: Center(
                child: Text(
              Texts.instance.shortenButton,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: ColorConstants.cyan),
          )
        ],
      ),
    );
    ;
  }
}
