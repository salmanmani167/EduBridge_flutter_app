import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/ninetytwo_item_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sulaman_s_application007/core/app_export.dart';

class OnboardingThreeScreen extends StatelessWidget {
  OnboardingThreeScreen({Key? key})
      : super(
          key: key,
        );

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboardingOne,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 29.v,
            ),
            child: Column(
              children: [
                SizedBox(height: 5.v),
                SizedBox(
                  height: 699.v,
                  width: 327.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage422x313,
                        height: 422.v,
                        width: 313.h,
                        alignment: Alignment.topCenter,
                      ),
                      _buildNinetyThreeStack(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNinetyThreeStack(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 367.v,
        width: 327.h,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 367.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (
                  index,
                  reason,
                ) {
                  sliderIndex = index;
                },
              ),
              itemCount: 1,
              itemBuilder: (context, index, realIndex) {
                return NinetytwoItemWidget();
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 10.v,
                margin: EdgeInsets.only(bottom: 112.v),
                child: AnimatedSmoothIndicator(
                  activeIndex: sliderIndex,
                  count: 1,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                    spacing: 12,
                    activeDotColor: theme.colorScheme.primary,
                    dotColor: theme.colorScheme.primary.withOpacity(0.41),
                    dotHeight: 10.v,
                    dotWidth: 10.h,
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
