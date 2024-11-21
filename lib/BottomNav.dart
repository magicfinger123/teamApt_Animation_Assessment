import 'package:animation_demo/screens/home_screen.dart';
import 'package:animation_demo/screens/searchMapScreen.dart';
import 'package:animation_demo/utility/animationControllers.dart';
import 'package:animation_demo/utility/colors.dart';
import 'package:animation_demo/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  int _currentIndex = 2;
  late AnimationController _animationController;
  late Animation<Offset> _bottomNavSlideAnimation;

  late AnimationController _pageChangeController;
  late Animation<Offset> _pageChangeAnimation;


  // Define four screens
  final List<Widget> _screens = [
    SearchMapScreen(),
    Center(child: Text('Chat Screen', style: TextStyle(fontSize: 24))),
    HomeScreen(),
    Center(child: Text('Favorites Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Screen', style: TextStyle(fontSize: 24))),
  ];
  @override
  void initState() {
    super.initState();



    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _bottomNavSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 10), // Start offscreen (below)
      end: const Offset(0, 0),   // Slide into position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    Future.delayed(const Duration(seconds: 4), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    disposeHomeAnimationsControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: _screens[_currentIndex],
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation,child: child,);
            },
          ),
          Positioned(
            // left: 20.w,
            // right: 20.w,
            bottom: 25.h,
            child: SlideTransition(
              position: _bottomNavSlideAnimation,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 9.h),
                decoration: BoxDecoration(
                  color: AppColors.b22,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _navItem(Icons.search, 0),
                    gapW(15.w),
                    _navItem(Icons.chat, 1),
                    gapW(15.w),
                    _navItem(Icons.home, 2),
                    gapW(15.w),
                    _navItem(Icons.favorite, 3),
                    gapW(15.w),
                    _navItem(Icons.person_2_rounded, 4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _navItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child:SizedBox(
        width: 50.h,height: 50.h,
        child: AnimatedContainer(
          width: _currentIndex == index ?50.h:10.h,
          height: _currentIndex == index ?50.h:10.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index ? Colors.orange:Colors.transparent,
          ),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 600),
          child: Center(
            child: Icon(
              icon,
              size:20.h,
              color: AppColors.white
            ),
          ),
        ),
      ),
    );
  }
}
