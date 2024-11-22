import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

import 'colors.dart';

int time1 = 900;
bool? homeAnimationUsed = false;


SizedBox gapW(width) => SizedBox(
  width: width,
);
SizedBox gapH(height) => SizedBox(
  height: height,
);
EdgeInsets screenPad() => EdgeInsets.symmetric(horizontal: 16.w);
class AppImage{
  static const String user = 'assets/user.png';
  static const String kitchen = 'assets/kitchen.png';
  static const String parlour = 'assets/parlour.png';
  static const String room = 'assets/room.png';
}
Text txtR(title, size,
    {weight = FontWeight.w400,
      maxLines = 1,
      textAlign = TextAlign.start,
      color = AppColors.b10,height}) {
  return Text(
    title,
    style: GoogleFonts.mulish(
        color: color,
        fontSize: size,
        fontWeight: weight,
        height: height
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,

  );
}

LinearGradient homeBackgroundGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    colors: [
      AppColors.white,
      AppColors.white,
      Colors.orange.shade50.withOpacity(0.5),
      Colors.orange.shade50.withOpacity(0.5),
      Colors.orange.shade100.withOpacity(0.5),
      Colors.orange.shade100.withOpacity(0.5),
      AppColors.white,
      AppColors.white,
      AppColors.white,
    ],
  );
}

Container horizontalCircleDetails({required double width,required double height,
  required String txt}) {
  return Container(
    width: width,height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      color: AppColors.white2.withOpacity(0.70),
    ),
    child: Row(children: [
      Expanded(child:
      txtR(txt,14.sp,
        textAlign: TextAlign.center,
        maxLines: 1,
      )
      ),
      Container(
        width: 40.h,height: 40.h,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_forward_ios,
          color: AppColors.b10,size: 15.h,),
      ),

    ],),
  );
}
Container circleBtn({required double height, required double iconsize,
  required IconData icon}) {
  return Container(
    height: height,
    width: height,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.50),
        shape: BoxShape.circle
    ),
    child: Center(
        child: Icon(icon,
          color: AppColors.white,size: iconsize,)),
  );
}
Container iconTxtBtn({required double width,
  required IconData icon,required String txt}) {
  return Container(
    height: 60.h,
    width: width,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.50),
        borderRadius: BorderRadius.circular(30.r)
    ),
    child: width < 100.w ? Container() : Row(
      children: [
        gapW(16.w),
        Icon(icon,
          color: AppColors.white,size: 30.h,),
        gapW(10.w),
        Expanded(child: txtR(txt, 14.sp,color: AppColors.white))

      ],
    ),
  );
}
Marker locationTag({required LatLng point,
  required Function()onTap,
  required double width,required double height,
  required IconData icon,required String txt,
  required bool isText,

}) {
  return Marker(
    point: point,
    width: width,
    height: height,
    alignment: Alignment.centerLeft,
    child: GestureDetector(
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
            // bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(15.r),
          ),
          color: Colors.orange,
        ),
        child: Center(
          child: isText?
          txtR(txt, 14.sp,color: AppColors.white,weight: FontWeight.w600):
          Icon(
            icon,
            size: 25.h,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}