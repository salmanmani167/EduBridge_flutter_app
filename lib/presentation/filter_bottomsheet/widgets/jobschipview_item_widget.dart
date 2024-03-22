import 'package:flutter/material.dart';
import 'package:sulaman_s_application007/core/app_export.dart';

// ignore: must_be_immutable
class JobschipviewItemWidget extends StatelessWidget {
  const JobschipviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.only(
        top: 14.v,
        right: 16.h,
        bottom: 14.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "Part Time",
        style: TextStyle(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 12.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      avatar: CustomImageView(
        imagePath: ImageConstant.imgCheckmarkOnprimarycontainer,
        height: 18.adaptSize,
        width: 18.adaptSize,
        margin: EdgeInsets.only(right: 4.h),
      ),
      selected: false,
      backgroundColor: appTheme.deepOrangeA200,
      selectedColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          22.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
