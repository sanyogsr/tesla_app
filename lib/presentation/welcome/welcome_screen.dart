import "package:animate_do/animate_do.dart";
import "package:flutter/material.dart";
import "package:flutter_neumorphic_plus/flutter_neumorphic.dart";
import "package:page_transition/page_transition.dart";
import "package:tesla/colors.dart";
import "package:tesla/presentation/welcome/widgets/neumorphicButton.dart";

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLocked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        color: AppColors.appBarBackgroundColor,
        title: isLocked ? titleAppBar() : null,
        actions: [
          if (!isLocked) ...{settingsAppBar()} else ...{personAppBar()}
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF2F353A),
              Color(0xff0D0B0D),
            ])),
        child: ListView(
          children: [
            if (!isLocked) ...{
              AnimatedContainer(
                curve: Curves.linear,
                transform: Matrix4.translationValues(
                    0, isLocked ? -MediaQuery.of(context).size.height : 0, 0),
                duration: Duration(seconds: 3),
                child: topBody(),
              )
            } else ...{
              AnimatedContainer(
                duration: Duration(seconds: 3),
                transform: Matrix4.translationValues(
                    0, isLocked ? 0 : MediaQuery.of(context).size.height, 0),
                child: carFront(),
              ),
            },
            const SizedBox(
              height: 20,
            ),
            if (!isLocked) ...{
              AnimatedContainer(
                duration: Duration(seconds: 3),
                transform: Matrix4.translationValues(
                    isLocked ? MediaQuery.of(context).size.height : 0, 0, 0),
                child: centerBody(),
              )
            } else ...{
              centerStatus()
            },
            const SizedBox(
              height: 30,
            ),
            if (!isLocked) ...{
              AnimatedContainer(
                duration: Duration(seconds: 3),
                curve: Curves.linear,
                transform: Matrix4.translationValues(
                    isLocked ? MediaQuery.of(context).size.height : 0, 0, 0),
                child: endBody(),
              )
            } else ...{
              buttonAc()
            }
          ],
        ),
      ),
    );
  }

  Widget buttonAc() {
    return FadeInUp(
        child: Container(
      height: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [
                Color(0xFF353A40),
                Color(0xFF15161A),
              ]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          border: Border.all(
              color: AppColors.neumorphicShadowDarkColorEmboss,
              strokeAlign: BorderSide.strokeAlignOutside)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 35),
            child: Column(
              children: [
                Text(
                  "A/C is ON",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Tap  to turn off or swipe up\for a fast setup",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 75,
            child: buildNeumorphicButton(
                path: "assets/images/power.png",
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        child: const WelcomeScreen(),
                        type: PageTransitionType.bottomToTop,
                        isIos: true,
                        duration: Duration(microseconds: 200),
                      ));
                },
                color: AppColors.neumorphicBackgroundColorbtnBlue,
                borderColor: AppColors.neumorphicBorderColorBtnBlue,
                borderWidth: 2,
                scale: .3),
          )
        ],
      ),
    ));
  }

  Widget endBody() {
    return Column(
      children: [
        Text(
          "AC is turned On",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 90,
          child: buildNeumorphicButton(
              path: "assets/images/lock.png",
              onPressed: () {
                setState(() {
                  isLocked = !isLocked;
                });
              },
              color: AppColors.neumorphicBackgroundColorbtnBlue,
              borderColor: AppColors.neumorphicBorderColorBtnBlue,
              borderWidth: 2,
              scale: .9),
        )
      ],
    );
  }

  Widget centerStatus() {
    return FadeInLeft(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Text(
            "Status",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FadeIn(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/battery.png",
                        width: 8,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Battery",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "54%",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ),
            FadeIn(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/range.png",
                        width: 8,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Range",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "297",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ),
            FadeIn(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/tempreture.png",
                        width: 8,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Range",
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "0-30^C",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }

  Widget centerBody() {
    return Stack(
      children: [
        SizedBox(
          height: 450,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
            top: 0,
            right: 80,
            child: Text(
              "297",
              style: Theme.of(context).textTheme.labelLarge,
            )),
        Positioned(
            top: 30,
            right: 40,
            child: Text(
              "km",
              style: Theme.of(context).textTheme.labelSmall,
            )),
        Positioned(
            left: 40,
            top: 100,
            child: FadeInRightBig(
              child: Image.asset(
                "assets/images/cybertruck-mod-black21.png",
                fit: BoxFit.cover,
                height: 250,
              ),
            ))
      ],
    );
  }

  Widget carFront() {
    return FadeInRightBig(
      child: Image.asset("assets/images/car-front.png"),
    );
  }

  Widget personAppBar() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      transform: Matrix4.translationValues(
          0, isLocked ? 0 : -MediaQuery.of(context).size.height, 0),
      child: buildNeumorphicButton(
          path: "assets/images/person.png",
          onPressed: () {},
          color: AppColors.neumorphicBackgroundColor,
          borderColor: AppColors.neumorphicBorderColor,
          borderWidth: 0.6,
          scale: 0.5),
    );
  }

  AnimatedContainer settingsAppBar() {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: Duration(seconds: 3),
      transform: Matrix4.translationValues(
          0, isLocked ? -MediaQuery.of(context).size.height : 0, 0),
      child: FadeInDown(
        child: buildNeumorphicButton(
            path: "assets/images/setting.png",
            onPressed: () {},
            color: AppColors.neumorphicBackgroundColor,
            borderColor: AppColors.neumorphicBorderColor,
            borderWidth: 0.5,
            scale: 0.5),
      ),
    );
  }

  Widget titleAppBar() {
    return Column(
      children: [
        Text(
          "Tesla",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          "Cyber Truck",
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }

  Widget topBody() {
    return Column(
      children: [
        Text(
          "Tesla",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          "Cyber Truck",
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
