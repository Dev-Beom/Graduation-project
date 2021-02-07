import 'package:daitda/UIConponent/AnimatedLiquidLinearProgressIndicator.dart';
import 'package:daitda/design/designSet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _urls = [];
  final mediaSizeController = Get.put(DesignSet());

  @override
  Widget build(BuildContext context) {
    mediaSizeController.setScreenWidthAndHeight(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        label: Text("시작하기"),
        onPressed: () {
          Get.toNamed("/testPage");
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          // AnimatedLiquidLinearProgressIndicator(),

          Expanded(
            child: GridView.builder(
              itemCount: _urls.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Image.network(
                    _urls[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          // Text("dd")
        ],
      ),
    );
  }
}
