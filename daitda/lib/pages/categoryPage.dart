import 'package:daitda/UIConponent/uiComponent.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/categoryPage';

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UIComponent().buildHeightSizedBox(50),
            UIComponent().renderTopStateBar(2),
            UIComponent().buildHeightSizedBox(50),
            _buildCenter("어떤 곳에 기부하고 싶으세요?", context),
          ],
        ),
      ),
    );
  }

  Widget _buildCenter(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UIComponent().renderNavigationButton(option: 'back'),
        Container(
          // color: Color(0xfff6f5f5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIComponent().renderTitleText(title),
              Container(
                width: 1000,
                height: MediaQuery.of(context).size.height - 229,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: ColorSet().mainBoxColor,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _buildCard(
                          title: "Pasicm",
                          img: AssetImage('images/ps.png'),
                          context: context),
                      _buildCard(
                          title: "Pollution",
                          img: AssetImage('images/pl.png'),
                          context: context),
                      _buildCard(
                          title: "Global Warming",
                          img: AssetImage('images/gw.png'),
                          context: context),
                      _buildCard(
                          title: "Pasicm",
                          img: AssetImage('images/ps.png'),
                          context: context),
                      _buildCard(
                          title: "Pollution",
                          img: AssetImage('images/pl.png'),
                          context: context),
                      _buildCard(
                          title: "Global Warming",
                          img: AssetImage('images/gw.png'),
                          context: context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        UIComponent()
            .renderNavigationButton(option: 'go', router: '/paymentPage'),
      ],
    );
  }

  Widget _buildCard({String title, AssetImage img, BuildContext context}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 300,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 3,
                child: InkWell(
                  onTap: () {},
                  child: Image(
                    image: img,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 20,
              child: FlatButton(
                onPressed: () {
                  _settingModalBottomSheet(context, title, img);
                },
                child: Text(
                  "Learn More",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xffA7A7A7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context, title, img) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10),
                      topRight: const Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text("X"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title + "이란?",
                            style: TextStyle(fontSize: 50),
                          ),
                          Container(
                            width: 400,
                            height: 300,
                            child: Image(
                              image: img,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        width: 1000,
                        height: 1000,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
