// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_app/model/user_model.dart';
import 'package:test_app/service/users_service/users_service.dart';

class UserController extends GetxController {
  RxList<Details> allUsers = <Details>[].obs;
  bool fullyLoaded = false;
  late int totalPage;
  int currentPage = 1;

  ScrollController scrollController = ScrollController();
  //<<<<<Users>>>>>//
  Future<void> getUsers() async {
    try {
      await UsersServices.userDetailsService(currentpage: currentPage);
      update();
    } catch (e) {
      print(e);
    }
  }

  //<<<<<Single_User>>>>>//
  Future<void> getSingleUser(String id) async {
    try {
      await UsersServices.getSingleUserService(id: id);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          if (!fullyLoaded) {
            getUsers();
          }
        }
      },
    );
    super.onInit();
  }
}
