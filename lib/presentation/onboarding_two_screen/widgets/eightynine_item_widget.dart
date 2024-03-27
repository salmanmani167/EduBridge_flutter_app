import 'package:sulaman_s_application007/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:sulaman_s_application007/core/app_export.dart';

import '../../onboarding_three_screen/onboarding_three_screen.dart';

// ignore: must_be_immutable
class EightynineItemWidget extends StatelessWidget {
  EightynineItemWidget({
    Key? key,
    this.onTapLabel,
  }) : super(
          key: key,
        );

  VoidCallback? onTapLabel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: _buildContent(context),
    );
  }

  /// Section Widget
  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 32.v,
      ),
      decoration: AppDecoration.white.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 273.h,
            margin: EdgeInsets.only(left: 6.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Better ",
                    style: CustomTextStyles.headlineSmallff0d0140,
                  ),
                  TextSpan(
                    text: "future is starting from you",
                    style: CustomTextStyles.headlineSmallff0d0140,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 14.v),
          Container(
            width: 243.h,
            margin: EdgeInsets.symmetric(horizontal: 17.h),
            child: Text(
              "Empower students with FYP app connecting them to industry supervisors, cordiantore, and AI ideas for innovative project collaborations.",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleSmallGray500SemiBold.copyWith(
                height: 1.57,
              ),
            ),
          ),
          SizedBox(height: 69.v),
          CustomElevatedButton(
            width: 101.h,
            text: "Next",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnboardingThreeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
