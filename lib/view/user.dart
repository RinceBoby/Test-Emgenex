import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/users/users_controller.dart';
import 'package:test_app/core/constants/colors.dart';
import 'package:test_app/core/constants/dimensions.dart';

class UserDetails extends StatelessWidget {
  UserDetails({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = userController.allUsers[index];
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: kBlack,
          ),
        ),
        backgroundColor: kWhite,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: size.width * .9,
          decoration: BoxDecoration(
            color: kGrey[300],
            borderRadius: kRadius20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeight25,
              CircleAvatar(
                backgroundColor: kWhite,
                radius: 80,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(data.avatar),
                  radius: 75,
                ),
              ),
              kHeight25,
              Center(
                child: Column(
                  children: [
                    //
                    //<<<<<Name>>>>>//
                    Text(
                      "Name: ${data.firstName}${data.lastName}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    kHeight10,

                    //<<<<<Email>>>>>//
                    Text(
                      "Email: ${data.email}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    kHeight05,

                    //
                    //<<<<<Id>>>>>//
                    Text(
                      "Id: ${data.id}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
