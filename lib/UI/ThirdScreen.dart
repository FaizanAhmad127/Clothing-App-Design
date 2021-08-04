import 'package:anton/Constants.dart';
import 'package:anton/UI/IncrementDecrementWidget.dart';
import 'package:anton/UI/NotifcationIcon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<Widget> items = [];

  Widget createItem(post) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 80,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 100,
                height: 100,
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
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    post["clothName"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  AutoSizeText(
                    "\$${post["clothPrice"].toString()}0",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  IncrementDecrementWidget(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AutoSizeText(
                    post["clothSize"],
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  Icon(Icons.delete_forever)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getListViewItems() {
    clothingData.forEach((element) {
      items.add(createItem(element));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListViewItems();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenHeight * 0.01,
            screenWidth * 0.05, screenHeight * 0.02),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(Icons.keyboard_backspace_outlined),
                  onTap: () {
                    Navigator.pushNamed(context, "SecondScreen");
                  },
                ),
                AutoSizeText(
                  "Shopping Bag",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                NotifcationIcon()
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
              height: screenHeight * 0.5,
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  }),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              height: screenHeight * 0.07,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: "Promo Code",
                  suffixIcon: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(screenWidth * 0.3, screenHeight * 0.065),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: AutoSizeText(
                      "Apply",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              children: [
                GreyText(
                  text: "Sub Total",
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: DottedLine(
                    lineLength: screenWidth * 0.5,
                    dashLength: 2,
                  ),
                ),
                AutoSizeText(
                  "\$367.00",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              children: [
                GreyText(
                  text: "Shipping",
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: DottedLine(
                    dashLength: 2,
                    lineLength: screenWidth * 0.55,
                  ),
                ),
                AutoSizeText(
                  "\$4.00",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              children: [
                GreyText(
                  text: "Bag Total",
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: DottedLine(
                    dashLength: 2,
                    lineLength: screenWidth * 0.5,
                  ),
                ),
                AutoSizeText(
                  "\$371.00",
                  style: TextStyle(
                      color: Colors.red[200],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(screenWidth * 0.9, screenHeight * 0.08),
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: AutoSizeText(
                "Proceed to Checkout",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "FirstScreen");
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class GreyText extends StatelessWidget {
  final String text;
  GreyText({this.text});
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(color: Colors.grey[400], fontSize: 16),
    );
  }
}
