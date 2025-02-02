import 'package:fambridge/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:fambridge/presentation/resources/assets_manager.dart';
import 'package:fambridge/presentation/resources/color_manager.dart';
import 'package:fambridge/presentation/resources/styles_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Codeshareview extends StatefulWidget {
  const Codeshareview({super.key});

  @override
  _CodeshareState createState() => _CodeshareState();
}

class _CodeshareState extends State<Codeshareview> {
  var idController = "24983827"; //family code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MypageAppBar(),
      body: Container(
        color: ColorManager.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Title(),
              const SizedBox(height: 10),
              const SubTitle(),
              const SizedBox(height: 100),
              const FamilyList(),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "가족 코드",
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    idController, //family code
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                      color: ColorManager.darkGrey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.point,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 42.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      return;
                    },
                    child: Text(
                      "복사하기",
                      style: getMediumStyle(
                        color: ColorManager.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 42.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      return;
                    },
                    child: Text(
                      "공유하기",
                      style: getMediumStyle(
                        color: ColorManager.point,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Fambridge.",
      textAlign: TextAlign.center,
      style: getBoldStyle(
        color: ColorManager.point.withOpacity(0.6),
        fontSize: FontSize.s16,
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "'우리'",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "라는 이름 아래 모인 우리.",
          textAlign: TextAlign.center,
          style: getMediumStyle(
            color: ColorManager.black,
            fontSize: FontSize.s14,
          ),
        ),
      ],
    );
  }
}

class FamilyList extends StatelessWidget {
  const FamilyList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FamilyMember(type: "아빠", profile: ImageAssets.onboardingLogo3),
          FamilyMember(type: "엄마", profile: ImageAssets.onboardingLogo3),
          FamilyMember(type: "첫째", profile: ImageAssets.onboardingLogo3),
          FamilyMember(type: "둘째", profile: ImageAssets.onboardingLogo3),
          FamilyMember(type: "셋째", profile: ImageAssets.onboardingLogo3),
        ],
      ),
    );
  }
}

class FamilyMember extends StatelessWidget {
  final String type;
  final String profile;
  const FamilyMember({
    required this.type,
    required this.profile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleProfile(size: 44, profile: profile),
        const SizedBox(
          height: 5,
        ),
        Text(
          type,
          style: getMediumStyle(
            color: ColorManager.darkGrey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

PreferredSizeWidget _MypageAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      title: Text(
        "",
        style: getMediumStyle(
          fontSize: 18,
          color: ColorManager.darkGrey,
        ),
      ),
      centerTitle: true,
      backgroundColor: ColorManager.white,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageAssets.back,
          height: 20,
          width: 20,
          fit: BoxFit.scaleDown,
        ),
      ),
      elevation: 0.0,
    ),
  );
}

class CircleProfile extends StatelessWidget {
  final double size;
  final String profile;
  const CircleProfile({
    Key? key,
    required this.profile,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: CircleAvatar(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: SvgPicture.asset(
              profile,
              height: size,
              width: size,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ));
  }
}
