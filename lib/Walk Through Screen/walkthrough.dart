import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Login and Signup/login.dart';
import '../Login and Signup/signup.dart';
import '../wraper.dart';

class Walkthrough extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,  // Starting point of the gradient
            end: Alignment.bottomRight,  // Ending point of the gradient
            colors: [
              Color(0xffFFF7EA),  // First color
              Color(0xffFFFFFF),  // Second color
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h,),
            SvgPicture.asset('res/images/splash_screen.svg'),
            Text('Simplify your financial journey with Kanz',style: TextStyle(
                fontSize: 35.sp,fontWeight: FontWeight.bold,color: Colors.black,),textAlign: TextAlign.center,),
            SizedBox(height: 120.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Wraper(),),);
                }, child:  Text('Skip',style: TextStyle(decoration:TextDecoration.underline,color: Colors.black,fontSize: 24.sp))),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Wraper(),),);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient:  LinearGradient(
                          begin: Alignment.topCenter,  // Starting from top-left
                          end: Alignment.bottomCenter, // Ending at bottom-right
                          colors: [
                            Color(0xffE61573),
                            Color(0xffE61573),
                            Color(0xffF3990E),
                          ]
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Container(
                      constraints:  BoxConstraints(minWidth: 120.w, minHeight: 50.h),
                      alignment: Alignment.center,
                      child:  Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
