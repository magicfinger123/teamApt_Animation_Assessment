import 'package:animation_demo/utility/animationControllers.dart';
import 'package:animation_demo/utility/colors.dart';
import 'package:animation_demo/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomWidget{
  static Container circleOrSquareContainer(
      {required String txt,
        required bool isSquare,
        required double size,
        txtSize,
        smallTxtSize}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
        color: isSquare ? AppColors.white : AppColors.orange,
        borderRadius: isSquare ? BorderRadius.circular(20.r) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          txtR("Buy", smallTxtSize,
              color: isSquare ? AppColors.grey : AppColors.white,
              weight: FontWeight.w600),
          txtR(
            txt,
            txtSize,
            color: isSquare ? AppColors.grey : AppColors.white,
            weight: FontWeight.bold,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          txtR("Offers", smallTxtSize,
              color: isSquare ? AppColors.grey : AppColors.white,
              weight: FontWeight.w600),
        ],
      ),
    );
  }

  static Container salutationAndDescription(
      {required String salutation, required String description}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: screenPad(),
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH(10.h),
            SizedBox(
              width: 250.w,
              height: 32.h,
              child: AnimatedBuilder(
                animation: textOpacityAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: textOpacityAnimation.value,
                    child: txtR(salutation, 18.sp,
                        color: AppColors.grey, weight: FontWeight.w600),
                  );
                },
              ),
            ),
            gapH(10.h),
            SizedBox(
              width: 250.w,
              height: 100.h,
              child: AnimatedBuilder(
                animation: textOpacityAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: textOpacityAnimation.value,
                    child: SlideTransition(
                      position: textSlideAnimation,
                      child: txtR(description, 28.sp,
                          color: AppColors.b10,
                          weight: FontWeight.w600,
                          maxLines: 2),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  static Padding userImageAndLocationWidget(
      {required String location, required String image}) {
    return Padding(
      padding: screenPad(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedBuilder(
            animation: widthAnimation1,
            builder: (context, child) {
              return Container(
                width: widthAnimation1.value,
                height: 50.h,
                padding: screenPad(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.10),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: widthAnimation1.value > 100.w
                    ? Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.grey.withOpacity(0.60),
                      size: 25.r,
                    ),
                    gapW(10.w),
                    Expanded(
                      child: txtR(location, 15.sp,
                          weight: FontWeight.w500,
                          color: AppColors.grey,
                          maxLines: 1),
                    )
                  ],
                )
                    : null,
              );
            },
          ),
          AnimatedBuilder(
              animation: sizeAnimation1,
              builder: (context, child) {
                return Container(
                  width: sizeAnimation1.value.w,
                  height: sizeAnimation1.value.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

}