import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomeBottomView extends StatefulWidget {
  HomeController controller;
  HomeBottomView({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeBottomView> createState() => _HomeBottomViewState();
}

class _HomeBottomViewState extends State<HomeBottomView> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
        initialChildSize: widget.controller.initScrol,
        minChildSize: widget.controller.minScroll,
        maxChildSize: widget.controller.maxScroll,
        controller: widget.controller.scrollController,
        builder: ((context, scrollController) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: widget.controller.splashRadius),
                    ],
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.controller.borderRadius),
                      topRight: Radius.circular(widget.controller.borderRadius),
                    )),
              ),
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverAppBar(
                        pinned: true,
                        floating: false,
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        collapsedHeight: 100,
                        elevation: 0,
                        expandedHeight: 100,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 60,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                Container()
                              ],
                            ),
                          ),
                        )),

                    // SliverList(delegate: delegate)
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
