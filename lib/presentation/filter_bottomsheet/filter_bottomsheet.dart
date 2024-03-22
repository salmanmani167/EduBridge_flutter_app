import '../filter_bottomsheet/widgets/thirtyfourchipview_item_widget.dart';import '../filter_bottomsheet/widgets/jobschipview_item_widget.dart';import 'package:sulaman_s_application007/widgets/custom_elevated_button.dart';import 'package:flutter/material.dart';import 'package:sulaman_s_application007/core/app_export.dart';class FilterBottomsheet extends StatelessWidget {const FilterBottomsheet({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return Container(width: double.maxFinite, padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 25.v), decoration: AppDecoration.background.copyWith(borderRadius: BorderRadiusStyle.customBorderTL24), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [_buildCloseRow(context), SizedBox(height: 29.v), Text("Categories", style: CustomTextStyles.titleMediumBold_1), SizedBox(height: 14.v), _buildThirtyFourChipView(context), SizedBox(height: 26.v), _buildPriceRow(context, priceValue1: "Salaries", priceValue2: "6.000/Month"), SizedBox(height: 16.v), SliderTheme(data: SliderThemeData(trackShape: RoundedRectSliderTrackShape(), activeTrackColor: appTheme.deepOrangeA200, inactiveTrackColor: appTheme.gray100, thumbColor: theme.colorScheme.onPrimaryContainer.withOpacity(1), thumbShape: RoundSliderThumbShape()), child: Slider(value: 52.91, min: 0.0, max: 100.0, onChanged: (value) {})), SizedBox(height: 2.v), _buildPriceRow(context, priceValue1: "560", priceValue2: "12.000"), SizedBox(height: 28.v), Text("Jobs", style: CustomTextStyles.titleMediumBold_1), SizedBox(height: 16.v), _buildJobsChipView(context), SizedBox(height: 30.v), CustomElevatedButton(text: "Apply Filter", onPressed: () {onTapApplyFilter(context);}), SizedBox(height: 15.v)])); } 
/// Section Widget
Widget _buildCloseRow(BuildContext context) { return Row(children: [CustomImageView(imagePath: ImageConstant.imgComponent1Primary, height: 24.adaptSize, width: 24.adaptSize, onTap: () {onTapImgClose(context);}), Padding(padding: EdgeInsets.only(left: 16.h), child: Text("Filter", style: CustomTextStyles.titleMedium18)), Spacer(), Padding(padding: EdgeInsets.only(top: 3.v, bottom: 2.v), child: Text("Reset Filters", style: CustomTextStyles.titleSmallDeeporangeA200))]); } 
/// Section Widget
Widget _buildThirtyFourChipView(BuildContext context) { return Wrap(runSpacing: 16.v, spacing: 16.h, children: List<Widget>.generate(6, (index) => ThirtyfourchipviewItemWidget())); } 
/// Section Widget
Widget _buildJobsChipView(BuildContext context) { return Wrap(runSpacing: 16.v, spacing: 16.h, children: List<Widget>.generate(2, (index) => JobschipviewItemWidget())); } 
/// Common widget
Widget _buildPriceRow(BuildContext context, {required String priceValue1, required String priceValue2, }) { return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(priceValue1, style: CustomTextStyles.labelLargeSemiBold.copyWith(color: appTheme.blueGray400)), Text(priceValue2, style: CustomTextStyles.labelLargeSemiBold.copyWith(color: appTheme.blueGray400))]); } 

/// Navigates back to the previous screen.
onTapImgClose(BuildContext context) { Navigator.pop(context); } 
/// Navigates to the homeContainerScreen when the action is triggered.
onTapApplyFilter(BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeContainerScreen); } 
 }
