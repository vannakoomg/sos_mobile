import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/listing/controller/listing_controller.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({super.key});

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  final listingCon = Get.put(ListingController());
  @override
  void initState() {
    debugPrint('asas');
    listingCon.getLising();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((() => Scaffold(
          body: listingCon.isLoding.value == true && listingCon.cPage.value == 1
              ? const CircularProgressIndicator()
              : NotificationListener<ScrollUpdateNotification>(
                  onNotification: (scrollNotification) {
                    //********* for scroll compare */
                    if (scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent) {
                      debugPrint("========>>>>");
                      listingCon.getLising();
                    } else {
                      debugPrint("========>>>>no page");
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                      // child: Column(
                      //     children: listingCon.listint.map((element) {
                      //   return ListTile(
                      //     title: Text(element.price!),
                      //     subtitle: Text(element.price!),
                      //   );
                      // }).toList()),
                      ),
                ),
        )));
  }
}
