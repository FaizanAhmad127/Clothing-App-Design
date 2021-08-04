import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotifcationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            icon: FaIcon(FontAwesomeIcons.shoppingBag), onPressed: () {}),
        Positioned(
            top: 5,
            right: 7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: AutoSizeText(
                  "2",
                  minFontSize: 4,
                  maxFontSize: 12,
                ),
              ),
            )),
      ],
    );
  }
}