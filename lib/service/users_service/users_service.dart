// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/users/users_controller.dart';
import 'package:test_app/model/user_model.dart';
import 'package:test_app/service/dio/dio_client.dart';

class UsersServices {
  //
  //<<<<<Users>>>>>//
  static Future<void> userDetailsService({int currentpage = 1}) async {
    UserController userController = Get.find<UserController>();
    try {
      var response = await DioClient.dio.get('/api/users?page=$currentpage');
      print(response.data);
      print("Onn varamo");
      UserModel allUsersDetails = userModelFromJson(jsonEncode(response.data));

      userController.allUsers.addAll(allUsersDetails.data!);
      userController.totalPage = allUsersDetails.totalPages!;

      if (currentpage == userController.totalPage) {
        userController.fullyLoaded = true;
      } else {
        userController.currentPage++;
      }
    } on DioError catch (e) {
      print("Njna vanne");
      print(e.error);
    }
  }

  //<<<<<Single_User>>>>>//
  static Future<Details?> getSingleUserService({required String id}) async {
    try {
      var response = await DioClient.dio.get('/api/users/$id');
      print(response.data);
      Details singleUserDetails = Details.fromJson(response.data);
      print(singleUserDetails.id);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
