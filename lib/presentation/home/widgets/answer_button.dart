
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/getx_routes_manager.dart';
import '../../resources/styles_manager.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key, required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "대답하기",
                style: getMediumStyle(
                  color: ColorManager.white,
                  fontSize: 16,
                ),
              ),
              const Icon(Icons.navigate_next),
            ],
          ),
        ),
      ),
    );
  }
}