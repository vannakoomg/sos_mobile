// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:sos_mobile/modules/cateory/models/save_category_model.dart';

// import '../../../utils/helpers/sqlife/db_helper.dart';

// class CategorySqlife extends GetxController {
//   void insertCategory(SaveCategoryModel category) async {
//     await deleteALl();
//     for (int i = 0; i < category.data!.length; ++i) {
//       await DBHelper.obj.databaseObj!.insert("category", {
//         "category_id": category.data![i].id ?? 0,
//         "name": category.data![i].name ?? "s",
//         "cover": category.data![i].cover ?? "as",
//         "count": category.data![i].count ?? 0
//       });
//     }
//     seleteCategory();
//   }

//   void insertOnerecord(
//       {required int categoryId,
//       required String name,
//       required String cover,
//       required int count}) async {
//     await DBHelper.obj.databaseObj!.insert("category", {
//       "category_id": categoryId,
//       "name": name,
//       "cover": cover,
//       "count": count
//     });
//   }

//   Future deleteALl() async {
//     await DBHelper.obj.databaseObj!.delete("category");
//   }

//   Future deleteOne({required int index, required int id}) async {
//     await DBHelper.obj.databaseObj!
//         .delete('category', where: 'id = ?', whereArgs: [id]);
//     category.removeAt(index);
//   }

//   Future<List<CategoryFromMap>> seleteCategory() async {
//     var date =
//         await DBHelper.obj.databaseObj!.query("category", orderBy: 'id DESC');

//     category.value = date.map((map) => CategoryFromMap.fromMap(map)).toList();
//     debugPrint("date ${category.length}");
//     return category;
//   }
// }
