// import 'package:digibank/api/lib/api.dart';
// import 'package:digibank/features/commun/domain/entities/storage_key.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:universal_html/html.dart';

// // class HttpBearerAuthIml implements HttpBearerAuth {
// //   HttpBearerAuthIml();

// //   //dynamic _accessToken = "YadeToken";
// //   String _accessToken = "YadeToken";
// //   GetStorage box = Get.find();

// //   @override
// //   dynamic get accessToken => _accessToken;

// //   @override
// //   set accessToken(dynamic accessToken) {
// //     if (accessToken is! String && accessToken is! HttpBearerAuthProvider) {
// //       throw ArgumentError(
// //           'accessToken value must be either a String or a String Function().');
// //     }
// //     _accessToken = accessToken;
// //   }

// //   @override
// //   Future<void> applyToParams(
// //     List<QueryParam> queryParams,
// //     Map<String, String> headerParams,
// //   ) async {
// //     if (GetPlatform.isWeb) {
// //       window.sessionStorage['yadeSession'] = 'Test valurs session';
// //     }
// //     print("•••••••••••current route: ${Get.currentRoute}");
// //     print("•••••••••••current plateIsWeb: ${GetPlatform.isWeb}");
// //     var sessionToken = box.read(StorageKeys.accessToken);
// //     var activationToken = box.read(StorageKeys.deviceToken);

// //     if (sessionToken != null) {
// //       var token = '';
// //       //For Getting dynamic keyboard
// //       if (Get.currentRoute.contains('login')) {
// //         token = activationToken ?? '';
// //       } else {
// //         token =
// //             sessionToken + (activationToken != null ? ";$activationToken" : "");
// //       }

// //       headerParams['Authorization'] = 'Bearer $token';
// //       headerParams['Session-Id'] = '${box.read(StorageKeys.sessionId) ?? ""}';
// //       headerParams['customerCode'] =
// //           '${box.read(StorageKeys.customerCode) ?? ""}';
// //     } else if (activationToken != null) {
// //       headerParams['Authorization'] = 'Bearer $activationToken';
// //     }
// //     //print(jsonEncode(headerParams));
// //   }
// // }

// ApiClient gAfricaApiClient = ApiClient(
//   basePath: AppConfig.shared.baseUrl,
//   authentication: HttpBearerAuthIml(),
// );
