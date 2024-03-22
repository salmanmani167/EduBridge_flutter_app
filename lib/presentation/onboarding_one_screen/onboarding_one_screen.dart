import 'package:sulaman_s_application007/widgets/app_bar/custom_app_bar.dart';import 'package:sulaman_s_application007/widgets/app_bar/appbar_subtitle_one.dart';import 'package:carousel_slider/carousel_slider.dart';import 'widgets/label_item_widget.dart';import 'package:smooth_page_indicator/smooth_page_indicator.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';
// ignore_for_file: must_be_immutable
class OnboardingOneScreen extends StatelessWidget {OnboardingOneScreen({Key? key}) : super(key: key);

int sliderIndex = 1;

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(extendBody: true, extendBodyBehindAppBar: true, appBar: _buildAppBar(context), body: Container(width: SizeUtils.width, height: SizeUtils.height, decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.imgOnboardingOne), fit: BoxFit.cover)), child: Container(height: 718.v, width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h), child: Stack(alignment: Alignment.bottomCenter, children: [CustomImageView(imagePath: ImageConstant.imgImage, height: 361.v, width: 283.h, alignment: Alignment.topCenter), _buildLabel(context)]))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 49.v, actions: [AppbarSubtitleOne(text: "Skip", margin: EdgeInsets.symmetric(horizontal: 24.h, vertical: 13.v), onTap: () {onTapMediumLabelMedium(context);})]); } 
/// Section Widget
Widget _buildLabel(BuildContext context) { return Align(alignment: Alignment.bottomCenter, child: Container(height: 335.v, width: 327.h, margin: EdgeInsets.only(bottom: 5.v), child: Stack(alignment: Alignment.bottomCenter, children: [CarouselSlider.builder(options: CarouselOptions(height: 335.v, initialPage: 0, autoPlay: true, viewportFraction: 1.0, enableInfiniteScroll: false, scrollDirection: Axis.horizontal, onPageChanged: (index, reason) {sliderIndex = index;}), itemCount: 1, itemBuilder: (context, index, realIndex) {return LabelItemWidget();}), Align(alignment: Alignment.bottomCenter, child: Container(height: 10.v, margin: EdgeInsets.only(bottom: 112.v), child: AnimatedSmoothIndicator(activeIndex: sliderIndex, count: 1, axisDirection: Axis.horizontal, effect: ScrollingDotsEffect(spacing: 12, activeDotColor: theme.colorScheme.primary, dotColor: theme.colorScheme.primary.withOpacity(0.41), dotHeight: 10.v, dotWidth: 10.h))))]))); } 
/// Navigates to the signUpCreateAcountScreen when the action is triggered.
onTapMediumLabelMedium(BuildContext context) { Navigator.pushNamed(context, AppRoutes.signUpCreateAcountScreen); } 
 }
