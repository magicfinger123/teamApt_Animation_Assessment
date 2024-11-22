import 'package:animation_demo/Repository/MapRepository.dart';
import 'package:animation_demo/utility/colors.dart';
import 'package:animation_demo/utility/constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class SearchMapScreen extends StatefulWidget {
  const SearchMapScreen({super.key});

  @override
  State<SearchMapScreen> createState() => _SearchMapScreenState();
}

class _SearchMapScreenState extends State<SearchMapScreen>with TickerProviderStateMixin {
  MapController mapController = MapController();
  MapRepository mapRepository = MapRepository();
  bool isText = true;

  late AnimationController _topAniController;
  late Animation<double> _width1;
  late Animation<double> _height1;
  late Animation<double> _opacity1;

  late AnimationController _downAniController;
  late Animation<double> _width2;
  late Animation<double> _height2;
  late Animation<double> _opacity2;

  late AnimationController _tagController;
  late Animation<double> _widthTag;
  late Animation<double> _opacitytag;

  @override
  void initState() {
    super.initState();
    _initiateAnimations();
    _startAnimations();

  }
  @override
  void dispose() {
    _tagController.dispose();
    _downAniController.dispose();
    _tagController.dispose();
    super.dispose();
  }
  List<Marker> fetchMarkers(){
    List<Marker> returnValue = [];
    mapRepository.fetchMarkerResponse().forEach((mark){
      returnValue.add(locationTag(
        point: mark.latLng,
        onTap: (){},
        width: isText?_widthTag.value.w:_widthTag.value.w/2,
        height: 50.h,
        icon: Icons.apartment_outlined, txt: mark.locationName,
        isText: isText,
      ));
    });
    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(children: [
        Expanded(
          child: Stack(
            children: [
              FlutterMap(
                mapController: mapController,
                options: const MapOptions(
                  backgroundColor: AppColors.b10,
                  initialCenter: LatLng(51.5, -0.09),),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
                    subdomains: const ['a', 'b', 'c'],

                  ),
                  AnimatedBuilder(
                    animation: _tagController,
                    builder: (context,child) {
                      return Opacity(opacity: _opacitytag.value,
                        child: MarkerLayer(
                          markers:fetchMarkers(),
                        ),
                      );
                    },
                  ),
                  SafeArea(bottom: true,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 150.h),
                      child: AnimatedBuilder(
                          animation: _downAniController,
                          builder: (context,child) {
                            return Opacity(
                              opacity: _opacity2.value,
                              child: Column(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(children: [
                                        circleBtn(height: _height2.value.h,
                                            iconsize: _height2.value.h/2,
                                            icon: Icons.wallet_giftcard_outlined),
                                        gapH(15.h),
                                        circleBtn(height: _height2.value.h,
                                            iconsize: _height2.value.h/2,
                                            icon: Icons.send_outlined),
                                      ],),
                                      Column(
                                        children: [
                                          gapH(75.h),
                                          iconTxtBtn(width:_width2.value.w, icon: Icons.list,
                                              txt: "List of variants"),
                                        ],
                                      )
                                    ],)


                                ],),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 50.h,
                  child: AnimatedBuilder(
                      animation: _topAniController,
                      builder: (context,child) {
                        return Opacity(
                          opacity: _opacity1.value,
                          child: Column(
                            children: [
                              searchAndFilterBtn(),
                            ],
                          ),
                        );
                      }
                  ))
            ],
          ),
        )

      ],),
    );
  }



  Container searchAndFilterBtn() {
    return Container(width: 430.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50.h,
            width: _width1.value.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child:
            _width1.value.w < 200.w ? Container() :
            Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10.w, 0, 9.w, 0),
                child: Icon(Icons.search_rounded,
                  color: AppColors.b70,size: 28.h,),
              ),
              txtR("Saint petersburg", 14.sp,)
            ],),
          ),
          Container(
            height: _height1.value.h,
            width: _height1.value.h,
            decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle
            ),
            child: Icon(Icons.tune,
              color: AppColors.b70,
              size: _height1.value.h/2,),
          ),
        ],
      ),
    );
  }

  void _initiateAnimations() {
    ///top
    _topAniController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: time1),
    );
    _width1 = Tween<double>(
      begin: 0,
      end: 340,
    ).animate(CurvedAnimation(
      parent: _topAniController,
      curve: Curves.easeOut,
    ));
    _height1 = Tween<double>(
      begin: 0,
      end:50,
    ).animate(CurvedAnimation(
      parent: _topAniController,
      curve: Curves.easeOut,
    ));
    _opacity1 = Tween<double>(
      begin: 0.1,
      end:1.0,
    ).animate (CurvedAnimation(
      parent: _topAniController,
      curve: Curves.easeOut,
    ));
    //
    _downAniController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: time1),
    );
    _width2 = Tween<double>(
      begin: 0,
      end: 180,
    ).animate(CurvedAnimation(
      parent: _downAniController,
      curve: Curves.easeOut,
    ));
    _height2 = Tween<double>(
      begin: 0,
      end: 60,
    ).animate(CurvedAnimation(
      parent: _downAniController,
      curve: Curves.easeOut,
    ));
    _opacity2 = Tween<double>(
      begin: 0.1,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _downAniController,
      curve: Curves.easeOut,
    ));
    ///tag
    _tagController = AnimationController(
      vsync: this,
      duration:  Duration(milliseconds: time1),
    );
    _widthTag = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(CurvedAnimation(
      parent: _tagController,
      curve: Curves.easeOut,
    ));
    _opacitytag = Tween<double>(
      begin: 0.1,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _tagController,
      curve: Curves.easeOut,
    ));
  }
  void _startAnimations() {
    _topAniController.forward();
    _downAniController.forward();
    Future.delayed( Duration(milliseconds: time1), () {
      _tagController.forward();
    });
  }
}
