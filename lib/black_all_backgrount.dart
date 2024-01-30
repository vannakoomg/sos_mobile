// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyOverlay extends StatefulWidget {
  const MyOverlay({Key? key}) : super(key: key);

  @override
  State<MyOverlay> createState() => _MyOverlayState();
}

class _MyOverlayState extends State<MyOverlay> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
  }

  ///
  OverlayState? overlayState; //require
  OverlayEntry? overlayEntry; //require

  void showOverlay(BuildContext context, GlobalKey key) async {
    overlayState =
        Overlay.of(context); //require: Create state of an overlay eg. setstate
    var renderBox = key.currentContext!.findRenderObject()
        as RenderBox; //find the widget by key but as RenderBox
    Offset offset = renderBox.localToGlobal(
        Offset.zero); // compare widget position from zero (Top - Left)

    double? width = key.currentContext?.size?.width; //get widget width
    double? height = key.currentContext?.size?.height; //get widget height

    overlayEntry = OverlayEntry(
      builder: (_) {
        return Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              overlayEntry
                  ?.remove(); //remove overlay eg. Navigator.pop(context);
            },
            child: Stack(
              children: [
                Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), //background
                        BlendMode.srcOut, //require
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ///background
                          Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: const BoxDecoration(
                              color: Colors.white, //any color
                              backgroundBlendMode: BlendMode.dstOut, //require
                            ),
                          ),

                          ///Cut-out widget
                          AnimatedPositioned(
                            //normal Positioned Widget is OK : Positioned()
                            top: offset.dy,
                            left: offset.dx,
                            duration: const Duration(milliseconds: 200),
                            child: GestureDetector(
                              onTap: () {}, //Ignore Click able in widget area
                              child: AnimatedContainer(
                                //normal Container Widget is OK : Container()
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  color: Colors.white, //any color
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: width,
                                height: height,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: offset.dy - 20,
                  left: offset.dx + (width ?? 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: offset.dy + 20,
                  left: offset.dx + (width ?? 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    overlayState
        ?.insert(overlayEntry!); //insert overlay eg. showDialog, showOvelay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: listKey.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 4),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              showOverlay(context, listKey[index].key);
            },
            onLongPressEnd: (_) {
              // overlayEntry
              //     ?.remove(); // ? just mean if overlayEntry is null function won't work
            },
            onLongPressMoveUpdate: (_) {
              debugPrint('Drag Position : ${_.globalPosition}');
            },
            child: CircleAvatar(
              key: listKey[index].key = GlobalKey(),
              backgroundColor: Color(0xff123454 + (index * index)),
            ),
          ),
        ),
      ),
    );
  }
}

final listKey = <Item>[
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
  Item(),
];

class Item {
  var key;
  Item({
    this.key,
  });
}
