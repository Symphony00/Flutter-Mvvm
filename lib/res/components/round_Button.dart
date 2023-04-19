import 'package:flutter/material.dart';

import 'color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPress,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: 200,
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(color: AppColors.whiteColor),
                  )),
      ),
    );
  }
}
