import 'package:anton/Constants.dart';
import 'package:anton/UI/IncrementDecrementWidget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int selectedIndex = 1;

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String imagePath = "";
  String clothName = "";
  String clothPrice = "";
  bool firstColor = true;
  bool secondColor = false;
  bool thirdColor = false;

  List<Widget> columnImages = [];

  void initialValues() {
    Map<String, Object> values = clothingData.first;
    imagePath = values["clothImage"];
    clothName = values["clothName"];
    clothPrice = values["clothPrice"].toString();
  }

  List<Widget> imageColumn() {
    int count = 0;
    clothingData.forEach((element) {
      columnImages.add(Padding(
        padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
        child: GestureDetector(
          onTap: () {
            setState(() {
              imagePath = element["clothImage"];
              clothName = element["clothName"];
              clothPrice = element["clothPrice"].toString();
            });
          },
          child: Container(
            width: 30,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[400],
            ),
            child: FittedBox(
              child: Image(
                image: AssetImage(element["clothImage"]),
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ));
    });
    return columnImages;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialValues();
    imageColumn();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.03),
            child: Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.grey[300],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenHeight * 0.04),
                    child: FittedBox(
                      child: Image(
                        image: AssetImage(
                          imagePath,
                        ),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.1,
                  height: screenHeight * 0.28,
                  width: screenWidth * 0.14,
                  right: screenWidth * 0.06,
                  child: Container(
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.27,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: ListView.builder(
                        itemCount: columnImages.length,
                        itemBuilder: (context, index) {
                          return columnImages[index];
                        },
                      )),
                ),
                Positioned(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.07,
                    child: GestureDetector(
                      child: Icon(Icons.keyboard_backspace_sharp),
                      onTap: () {
                        Navigator.pushNamed(context, "FirstScreen");
                      },
                    )),
                Positioned(
                    top: screenHeight * 0.03,
                    right: screenWidth * 0.07,
                    child: Icon(FontAwesomeIcons.heart)),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  clothName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AutoSizeText(
                  "\$$clothPrice\0",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Color",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: ColorCircle(
                            showTick: firstColor,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            setState(() {
                              firstColor = true;
                              secondColor = false;
                              thirdColor = false;
                            });
                          },
                        ),
                        GestureDetector(
                          child: ColorCircle(
                            showTick: secondColor,
                            color: Colors.yellow,
                          ),
                          onTap: () {
                            setState(() {
                              firstColor = false;
                              secondColor = true;
                              thirdColor = false;
                            });
                          },
                        ),
                        GestureDetector(
                          child: ColorCircle(
                            showTick: thirdColor,
                            color: Colors.greenAccent,
                          ),
                          onTap: () {
                            setState(() {
                              firstColor = false;
                              secondColor = false;
                              thirdColor = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Size",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: SizeCircle(
                            itemIndex: 1,
                            sizeText: "S",
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                        ),
                        GestureDetector(
                          child: SizeCircle(
                            itemIndex: 2,
                            sizeText: "M",
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                        ),
                        GestureDetector(
                          child: SizeCircle(
                            sizeText: "L",
                            itemIndex: 3,
                          ),
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IncrementDecrementWidget(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(10, 50),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13))),
                    child: AutoSizeText(
                      "Add to cart",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "ThirdScreen");
                    },
                  )
                ],
              ))
        ],
      ),
    ));
  }
}

class ColorCircle extends StatefulWidget {
  final bool showTick;
  final Color color;
  ColorCircle({this.showTick, this.color});
  @override
  _ColorCircleState createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
          ),
        ),
        widget.showTick == true
            ? Positioned(
                top: 3,
                right: 3,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.black,
                  size: 15,
                ),
              )
            : Container()
      ],
    );
  }
}

class SizeCircle extends StatefulWidget {
  final String sizeText;
  final int itemIndex;
  SizeCircle({this.sizeText, this.itemIndex});
  @override
  _SizeCircleState createState() => _SizeCircleState();
}

class _SizeCircleState extends State<SizeCircle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.itemIndex == selectedIndex
              ? Colors.grey[700]
              : Colors.grey[200],
        ),
        child: Center(
            child: AutoSizeText(
          widget.sizeText,
          style: TextStyle(
            color:
                widget.itemIndex == selectedIndex ? Colors.white : Colors.black,
          ),
        )),
      ),
    );
  }
}
