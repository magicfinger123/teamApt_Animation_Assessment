import 'package:animation_demo/utility/colors.dart';
import 'package:animation_demo/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/animationControllers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {




  @override
  void initState() {
    super.initState();
    if(homeAnimationUsed == false){
      homeAnimations();
      startHomeAnimations();
    }


  }

  // @override
  // void dispose() {
  //   widthAniController1.dispose();
  //   sizeAniController1.dispose();
  //   textController.dispose();
  //   textController2.dispose();
  //   circleOrSquareController.dispose();
  //   horizontalCircleController.dispose();
  //   slideBtmSheetController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SlideTransition(
          position: slideBtmSheetAnimation,
          child: bottomSheetHome()),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: homeBackgroundGradient()),
        child: SafeArea(
          top: true,
          child: Column(
            children: [
              gapH(10.h),
              userImageAndLocationWidget(
                  location: "Saint Petersburg", image: AppImage.user),
              Column(
               children: [
                              salutationAndDescription(
                                  salutation: "Hi, Marina",
                                  description: "let's select your perfect place"),
                              gapH(30.h),
                              Container(
                                height: 190.w,
                                padding: screenPad(),
                                child: AnimatedBuilder(
                                    animation: circleOrSquareController,
                                    builder: (context, child) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          circleOrSquareContainer(
                txt: circleOrSquareTxtAniCount1.value.toString(),
                isSquare: false,
                size: circleOrSquareAnimation.value.w,
                txtSize: circleOrSquareTxtSizeAnimation.value.sp,
                smallTxtSize:
                    circleOrSquareTxtSizeAnimation2.value.sp),
                                          circleOrSquareContainer(
                txt: circleOrSquareTxtAniCount2.value.toString(),
                isSquare: true,
                size: circleOrSquareAnimation.value.w,
                txtSize: circleOrSquareTxtSizeAnimation.value.sp,
                smallTxtSize:
                    circleOrSquareTxtSizeAnimation2.value.sp),
                                        ],
                                      );
                                    }),
                              ),

                            ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetHome() {
    return AnimatedBuilder(
        animation: heightBtmSheetAnimation,
        builder: (context, child) {
        return Container(
          height: heightBtmSheetAnimation.value.h,width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    gapH(15.h),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,height: 200.h,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(20.r),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AppImage.kitchen),
                            )
                          ),
                        ),
                        Positioned(
                          bottom: 20.h,
                          left: 20.w,
                          child: AnimatedBuilder(
                            animation: horizontalCircleWidthAnimation,
                            builder: (context,child) {
                              return horizontalCircleDetails(
                                  width:horizontalCircleWidthAnimation.value.w,
                                  height:40.h, txt: "Gladkova st, 25");
                            }
                          )
                        )
                      ],
                    ),
                    gapH(10.h),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 205.w,height: 200.h,
                                decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(20.r),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(AppImage.parlour),
                                    )
                                ),
                              ),
                              Positioned(
                                  bottom: 20.h,
                                  left: 10.w,
                                  child: AnimatedBuilder(
                                      animation: horizontalCircleWidthAnimation2,
                                      builder: (context,child) {
                                        return horizontalCircleDetails(
                                            width:horizontalCircleWidthAnimation2.value.w,
                                            height:40.h, txt: "Gabina st, 15");
                                      }
                                  )
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 205.w,height: 200.h,
                                decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(20.r),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(AppImage.room),
                                    )
                                ),
                              ),
                              Positioned(
                                  bottom: 20.h,
                                  left: 10.w,
                                  child: AnimatedBuilder(
                                      animation: horizontalCircleWidthAnimation2,
                                      builder: (context,child) {
                                        return horizontalCircleDetails(
                                            width:horizontalCircleWidthAnimation2.value.w,
                                            height:40.h, txt: "Sedova st, 15");
                                      }
                                  )
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],),
                ),
              ),
            ],
          )
        );
      }
    );
  }
  Padding userImageAndLocationWidget(
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
  Container salutationAndDescription(
      {required String salutation, required String description}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: screenPad(),
      child: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH(10.h),
            Container(
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
            Container(
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
  Container circleOrSquareContainer(
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

  homeAnimations() {
    ///bottomsheet
    slideBtmSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    // Define slide animation
    slideBtmSheetAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: slideBtmSheetController,
      curve: Curves.easeOut,
    ));
    heightBtmSheetAnimation = Tween<double>(
      begin: 0, // Start with no height
      end: 450, // Final height of the bottom sheet
    ).animate(CurvedAnimation(
      parent: slideBtmSheetController,
      curve: Curves.easeOut,
    ));
    ///firs
    ///location
    widthAniController1 = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: time1),
    );
    widthAnimation1 = Tween<double>(
      begin: 0.w,
      end: 200.w,
    ).animate(CurvedAnimation(
      parent: widthAniController1,
      curve: Curves.easeOut,
    ));
    // home image
    sizeAniController1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds:time1),
    );
    sizeAnimation1 = Tween<double>(
      begin: 0,
      end: 60,
    ).animate(CurvedAnimation(
      parent: sizeAniController1,
      curve: Curves.easeOut,
    ));

    /// Home text opacity and slide animations
    textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    // Opacity animation for text
    textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: textController,
        curve: Curves.easeOut,
      ),
    );

    // Slide animation for text
    textController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    textSlideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: textController2,
        curve: Curves.easeOut,
      ),
    );

    ///
    circleOrSquareController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    circleOrSquareAnimation = Tween<double>(
      begin: 0, // Initial size
      end: 180, // Final size
    ).animate(CurvedAnimation(
      parent: circleOrSquareController,
      curve: Curves.easeInOut,
    ));
    circleOrSquareTxtSizeAnimation = Tween<double>(
      begin: 0, // Initial size
      end: 25, // Final size
    ).animate(CurvedAnimation(
      parent: circleOrSquareController,
      curve: Curves.easeInOut,
    ));
    circleOrSquareTxtSizeAnimation2 = Tween<double>(
      begin: 0, // Initial size
      end: 14, // Final size
    ).animate(CurvedAnimation(
      parent: circleOrSquareController,
      curve: Curves.easeInOut,
    ));
    circleOrSquareTxtAniCount1 = IntTween(
      begin: 0, // Starting counter value
      end: 1034, // Ending counter value
    ).animate(CurvedAnimation(
      parent: circleOrSquareController,
      curve: Curves.linear, // Keep counter linear for simplicity
    ));
    circleOrSquareTxtAniCount2 = IntTween(
      begin: 0, // Starting counter value
      end: 2212, // Ending counter value
    ).animate(CurvedAnimation(
      parent: circleOrSquareController,
      curve: Curves.linear, // Keep counter linear for simplicity
    ));

    ///horizontal circle
    ///
    horizontalCircleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    horizontalCircleWidthAnimation = Tween<double>(
      begin: 50,
      end: 390,
    ).animate(CurvedAnimation(
      parent: horizontalCircleController,
      curve: Curves.easeOut,
    ));
    horizontalCircleWidthAnimation2 = Tween<double>(
      begin: 50,
      end: 180,
    ).animate(CurvedAnimation(
      parent: horizontalCircleController,
      curve: Curves.easeOut,
    ));

  }
  void startHomeAnimations() {
    widthAniController1.forward();
    sizeAniController1.forward();
    Future.delayed( Duration(milliseconds: time1), () {
      textController.forward();
      textController2.forward();
      Future.delayed( Duration(milliseconds: time1), () {
        circleOrSquareController.forward();
        Future.delayed( const Duration(seconds: 2), () {
          slideBtmSheetController.forward();
          horizontalCircleController.forward();
        });
      });
    });
    homeAnimationUsed = true;
  }



}

