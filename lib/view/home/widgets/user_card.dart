import 'package:flutter/material.dart';
import 'package:test_app/core/constants/colors.dart';
import 'package:test_app/core/constants/dimensions.dart';
import 'package:test_app/model/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.size,
    required this.data,
  }) : super(key: key);

  final Size size;
  final Details data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 140,
        width: size.width * .9,
        decoration: BoxDecoration(
          color: kGrey[300],
          borderRadius: kRadius20,
        ),
        child: Row(
          children: [
            kWidth05,
            CircleAvatar(
              backgroundColor: kWhite,
              radius: 50,
              child: CircleAvatar(
                backgroundImage: NetworkImage(data.avatar),
                radius: 45,
              ),
            ),
            kWidth15,
            SizedBox(
              width: size.width * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //
                  //<<<<<Name>>>>>//
                  Text(
                    "Name: ${data.firstName} ${data.lastName}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  kHeight10,

                  //<<<<<Email>>>>>//
                  Text(
                    "Email: ${data.email}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  kHeight10,

                  //
                  //<<<<<Id>>>>>//
                  Text(
                    "Id: ${data.id}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}