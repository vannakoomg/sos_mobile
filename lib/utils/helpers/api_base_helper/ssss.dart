// import 'dart:convert';

// import 'package:connectivity_wrapper/connectivity_wrapper.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../config/go_route/routes.dart';
// import '../../../../constrants/api_service.dart';
// import '../../../../constrants/injection.dart';
// import '../../../../utils/helper/api_base_helper.dart';
// import '../../../../utils/helper/local_storage.dart';
// import '../model/seeting_model.dart';

// class SettingController extends GetxController {
//   var apiBaseHelper = ApiBaseHelper();
//   // padding
//   var isFullScreen = true.obs;
//   //General =====
//   var stateDate = ''.obs;
//   var endDate = ''.obs;
//   var fullNameController = TextEditingController().obs;
//   var companyNameController = TextEditingController().obs;
//   var emailController = TextEditingController().obs;
//   var bankNameController = TextEditingController().obs;
//   var countryController = TextEditingController().obs;
//   var writeOffAccount = ''.obs;
//   var roundOffAccount = ''.obs;

//   //Defaults ========
//   var salesPaymentAccount = ''.obs;
//   var puchasePaymentAccount = ''.obs;
//   var shipmentLoca = ''.obs;

//   var purchaseReceiptLoca = ''.obs;
//   var salesInvoiceNumSeries = ''.obs;
//   var purchaseInvoiceNumSeries = ''.obs;
//   var journalEntryNumSeries = ''.obs;
//   var pymentNumSeries = ''.obs;
//   var salesInvoiceTerms = TextEditingController().obs;
//   var purchaseInvoiceTerms = TextEditingController().obs;
//   var salesInvoPrintTempl = ''.obs;
//   var purchageInvoicePrintTempl = ''.obs;
//   var jounalEntryPrintTempl = ''.obs;
//   var paymentPrintTempl = ''.obs;

//   //Print ======
//   // var pickedFile = ''.obs;
//   var companyName = TextEditingController().obs;
//   var email = TextEditingController().obs;
//   var phone = TextEditingController().obs;
//   var address = ''.obs;
//   var colors = ''.obs;
//   var font = ''.obs;

//   //System ====
//   var dartFormat = ''.obs;
//   var versionController = TextEditingController().obs;
//   var locale = ''.obs;
//   var displayPrecision = TextEditingController().obs;
//   var curency = TextEditingController().obs;

//   var profileTab = ''.obs;
//   //theme mode
//   var isDarkMode = false.obs;

//   ///Get User
//   // var isLoadingProfile = false.obs;
//   var profileModel = SeetingModel().obs;
//   Future<SeetingModel> onGetProfile() async {
//     Injection.homeController.isLoadingHoldApp.value = true;

//     if (await ConnectivityWrapper.instance.isConnected) {
//       await apiBaseHelper
//           .onNetworkRequesting(
//               url: 'dierp.api.v1.auth.me',
//               methode: METHODE.get,
//               isAuthorize: true)
//           .then((value) {
//         profileModel.value = SeetingModel.fromJson(value['message']);
//         // profileModel.value.userImage = '';
//         var storeLocal = profileModel.value.copyWith(userImage: '');
//         LocalStorage.storeData(
//           key: 'profile',
//           value: jsonEncode(storeLocal.toJson()),
//         );

//         if (ApiService.target != 'release') {
//           // debugPrint('get USER =======> 200');
//         }

//         Injection.homeController.isLoadingHoldApp.value = false;
//       }).onError((ErrorModel error, stackTrace) {
//         if (ApiService.target != 'release') {
//           // debugPrint('get user ======== => ${error.statusCode}');
//         }

//         Injection.homeController.isLoadingHoldApp.value = false;
//       });
//     } else {
//       profileModel.value = SeetingModel();
//       var getLocal = await LocalStorage.getStringValue(key: 'profile');
//       if (getLocal != '') {
//         profileModel.value = SeetingModel.fromJson(
//           jsonDecode(getLocal),
//         );
//       }
//       // debugPrint('data profile offline========$profileModel');
//     }
//     Injection.homeController.isLoadingHoldApp.value = false;
//     return profileModel.value;
//   }

//   //print image file upload
//   var pickedImagePrint = ''.obs;

//   //profile image file upload
//   var pickedImageProfile = ''.obs;

//   //****************************************************************************
//   //##########----##########=>Rak
//   //****************************************************************************
//   onSignOut() {
//     Injection.homeController.selectIndex.value = 1;
//     Injection.homeController.selectSubIndex.value = 1;
//     LocalStorage.removeKey(key: 'company');
//     LocalStorage.removeKey(key: 'access_token');
//     router.go('/log-in');
//   }

//   //****************************************************************************
//   //##########--#submit impage--##########Name: hany
//   //****************************************************************************

//   Future<void> postImageProfile(
//       BuildContext context, String imageBase64) async {
//     Injection.homeController.isLoadingHoldApp.value = true;
//     try {
//       apiBaseHelper.onNetworkRequesting(
//           url: 'dierp.api.v1.auth.set_user_image',
//           methode: METHODE.update,
//           isAuthorize: true,
//           body: {
//             'file_content': imageBase64,
//           }).then((value) {
//         onGetProfile().then((value) {
//           Injection.homeController.isLoadingHoldApp.value = false;
//         });
//       }).onError((error, stackTrace) {});
//     } catch (e) {
//       if (ApiService.target != 'release') {
//         debugPrint(e.toString());
//       }
//     } finally {
//       Injection.homeController.isLoadingHoldApp.value = false;
//     }
//   }
//   //****************************************************************************
//   //##########--#init Setting--##########Name: ahny
//   //****************************************************************************

//   initSeeting(BuildContext context) {
//     onGetProfile();
//     postImageProfile(context, '');
//     Injection.languageController.onChooseLanguage();
//     Injection.languageController
//         .onChangeLanguage(Injection.languageController.languageKey.value);
//   }
// }
