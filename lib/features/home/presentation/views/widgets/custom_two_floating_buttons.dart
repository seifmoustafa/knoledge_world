import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTwoFloationgButtons extends StatelessWidget {
  const CustomTwoFloationgButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 20, // Adjust as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 56, // Adjust as needed
            height: 56, // Adjust as needed
            child: FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
              },
              backgroundColor: Colors.transparent, // Remove background color
              elevation: 0, // Remove elevation
              foregroundColor: Colors.black,
              child: const Icon(
                FontAwesomeIcons.house,
                size: 24,
              ), // Set icon color
            ),
          ),
          SizedBox(
            width: 56, // Adjust as needed
            height: 56, // Adjust as needed
            child: FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRouter.kProfileView);
              },
              backgroundColor: Colors.transparent, // Remove background color
              elevation: 0, // Remove elevation
              foregroundColor: Colors.black,
              child: const Icon(
                FontAwesomeIcons.solidCircleUser,
                size: 28,
              ), // Set icon color
            ),
          ),
        ],
      ),
    );
  }
}
