import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatefulWidget {
  @override
  _IncrementDecrementWidgetState createState() =>
      _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(10, 20),
              primary: Colors.grey[300],
              shape: CircleBorder()),
          child: AutoSizeText(
            "+",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: AutoSizeText("$count")),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(1, 20),
            primary: Colors.grey[300],
            shape: CircleBorder(),
          ),
          child: AutoSizeText(
            "-",
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            setState(() {
              if (count > 0) {
                count--;
              }
            });
          },
        )
      ],
    );
  }
}