import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app/controller/users/users_controller.dart';
import 'package:test_app/core/constants/colors.dart';
import 'package:test_app/view/home/widgets/user_card.dart';
import 'package:test_app/view/user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  UserController userController = Get.put(UserController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        leading: const Icon(
          CupertinoIcons.person_2_fill,
          color: kGrey,
        ),
        title: const Text(
          "Users",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kGrey,
          ),
        ),
      ),
      body: GetX<UserController>(initState: (state) {
        userController.getUsers();
      }, builder: (userController) {
        if (userController.allUsers.value.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        print(userController.allUsers.value.length);
        return ListView.builder(
          controller: userController.scrollController,
          itemCount: userController.allUsers.value.length + 1,
          itemBuilder: (context, index) {
            if (index < userController.allUsers.length) {
              final data = userController.allUsers.value[index];
              return InkWell(
                onTap: () => Get.to(
                  UserDetails(index: index),
                ),
                child: UserCard(size: size, data: data),
              );
            }
            if (userController.fullyLoaded) {
              return const SizedBox();
            }
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      }),
    );
  }
}
