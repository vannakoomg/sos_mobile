import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/search/model/recent_search_model.dart';

import '../../../utils/helpers/sqlife/db_helper.dart';

class RecentSearchController extends GetxController {
  final recentsearch = <RecentSearchModel>[].obs;
  Future getRecentSearch() async {
    var date = await DBHelper.obj.databaseObj!
        .query("recent_search", orderBy: 'id DESC', limit: 7);
    recentsearch.value =
        date.map((map) => RecentSearchModel.fromMap(map)).toList();
  }

  Future insertRecentSearch(String name, int type) async {
    // just remove the duplicate ID make sure that the new search is stay on the first
    RecentSearchModel duplicateItem = recentsearch.firstWhere(
      (data) => data.name == name && data.type == type,
      orElse: () => RecentSearchModel(id: -1, name: '', type: -1),
    );
    if (duplicateItem.id != -1) {
      await DBHelper.obj.databaseObj!.delete(
        'recent_search',
        where: 'id = ?',
        whereArgs: [duplicateItem.id],
      );
    }
    //
    await DBHelper.obj.databaseObj!
        .insert("recent_search", {"name": name, "type": type});
    var date = await DBHelper.obj.databaseObj!
        .query("recent_search", orderBy: 'id DESC', limit: 7);
    recentsearch.value =
        date.map((map) => RecentSearchModel.fromMap(map)).toList();
  }

  Future delectALL() async {
    var data = await DBHelper.obj.databaseObj!.delete("recent_search");
    recentsearch.clear();
    debugPrint("data $data");
  }

  Future deleteOne({required int index, required int id}) async {
    await DBHelper.obj.databaseObj!
        .delete('recent_search', where: 'id = ?', whereArgs: [id]);
    getRecentSearch();
  }
}
