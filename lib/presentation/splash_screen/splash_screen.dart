import 'package:flutter/material.dart';
import 'package:sulaman_s_application007/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center( // Center all content within the Scaffold
        child: Column(
          mainAxisSize: MainAxisSize.min, // Wrap content vertically
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgClarityEmployeeSolid,
              height: 102.adaptSize,
              width: 102.adaptSize,
            ),
            SizedBox(height: 24.v),
            Text(
              "Edu Bridge",
              style: theme.textTheme.headlineLarge,
            ),
            SizedBox(height: 5.v),
            SizedBox(
              width: double.infinity, // Button width expands to full width
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.onboardingOneScreen);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                  ),
                  child: Text(
                    "Start Now",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30, // Set font size to 16px
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
