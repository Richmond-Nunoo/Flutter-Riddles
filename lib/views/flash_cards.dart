import 'package:flutter/material.dart';
import 'dart:math';

class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  MyCustomWidgetState createState() => MyCustomWidgetState();
}

class MyCustomWidgetState extends State<MyCustomWidget> {
  double _page = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flash Cards"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: height * 0.7,
              width: width * .95,
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  List<Widget> cards = [];

                  for (int i = 0; i <= 11; i++) {
                    double currentPageValue = i - _page;
                    bool pageLocation = currentPageValue > 0;

                    double start = 20 +
                        max(
                          (boxConstraints.maxWidth - width * .75) -
                              ((boxConstraints.maxWidth - width * .75) / 2) *
                                  -currentPageValue *
                                  (pageLocation ? 9 : 1),
                          0.0,
                        );

                    var customizableCard = Positioned.directional(
                      top: 20 + 30 * max(-currentPageValue, 0.0),
                      bottom: 20 + 30 * max(-currentPageValue, 0.0),
                      start: start,
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: width * .67,
                        width: width * .67,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.15),
                                blurRadius: 10)
                          ],
                        ),
                        child: Text("$i"),
                      ),
                    );
                    cards.add(customizableCard);
                  }
                  return Stack(children: cards);
                },
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: 11,
                controller: pageController,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
