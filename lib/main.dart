import 'package:animation_demo/utility/animationControllers.dart';
import 'package:animation_demo/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/Nav/BottomNav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 954),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    homeAnimationUsed = false;
    super.initState();
  }
  @override
  void dispose() {
    homeAnimationUsed = false;
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>
                const BottomNav()));
              },
              child: Container(width: double.infinity,height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                  color: Colors.orange,
                borderRadius: BorderRadius.circular(20.r)
              ),
                child: const Center(
                  child: Text(
                    'View page',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
