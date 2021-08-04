import 'package:anton/UI/NotifcationIcon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Constants.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Widget> items;

  Widget listViewWidget(post) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    //use ClipRRect to give circular border directly to image
                    // and use FittedBox to fit the image in the entire container
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: FittedBox(
                        child: Image.asset(
                          post["clothImage"],
                          scale: 1,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 15,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            FontAwesomeIcons.heart,
                            size: 10,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: AutoSizeText(
                  post["clothName"],
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: AutoSizeText(
                "\$${post["clothPrice"]}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ));
  }

  void getGridViewItems() {
    List<dynamic> responseList = clothingData;
    List<Widget> widgetList = [];
    responseList.forEach((post) {
      widgetList.add(listViewWidget(post));
    });
    setState(() {
      items = widgetList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGridViewItems();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("images/profile.jpg"),
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                        AutoSizeText(
                          "Hi, Victoria!",
                          maxFontSize: 16,
                          minFontSize: 12,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    NotifcationIcon()
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "Find the best",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    "clothes for you",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(FontAwesomeIcons.slidersH),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: "Search",
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.58,
                child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(2, index.isEven ? 2.5 : 2),
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
