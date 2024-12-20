import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../wraper.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,  // Starting from top-left
                    end: Alignment.bottomRight, // Ending at bottom-right
                    colors: [
                      Color(0xffF8D8BC),
                      Color(0xffF8D8BC),
                      Color(0xffF285B5),
                    ]
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PhysicalModel(
                    color: Colors.red,
                    clipBehavior: Clip.antiAlias,
                    // elevation: 60.0,
                    shape: BoxShape.circle,
                    child: Image.asset(
                      'res/images/myprofilepic.png',
                      width: 100.w,
                      height: 100.w,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 10.h,),
                Text("Talib Jameel",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26.sp,color: Colors.black),)
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                Container(
                  height: 92.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                     color: Color(0xffF3F0FC),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('My Accoutnt',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text('View and make changes to your account',style: TextStyle(color: Colors.black,fontSize: 16.sp ),)
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 115.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                     color: Color(0xffF3F0FC),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Completed Applications',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text('View your completed application and their \n status',style: TextStyle(color: Colors.black,fontSize: 16.sp ),)
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 92.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xffF3F0FC),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pending applications',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text('View your pending application ',style: TextStyle(color: Colors.black,fontSize: 16.sp ),)
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 92.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xffF3F0FC),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Help & Support',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text('Access help and support',style: TextStyle(color: Colors.black,fontSize: 16.sp ),)
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                InkWell(
                  child: Container(
                    height: 92.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffF3F0FC),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Log out',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                              Text('Logout your account',style: TextStyle(color: Colors.black,fontSize: 16.sp ),)
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> signOutFromGoogle(BuildContext context) async {
  try {
    // Step 1: Sign out from Firebase
    await FirebaseAuth.instance.signOut();

    // Step 2: Sign out from Google
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    // Step 3: Clear SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Step 4: Clear Cache
    await DefaultCacheManager().emptyCache();

    // Step 5: Navigate to Login Screen and clear stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Wraper()),
          (route) => false, // Remove all previous routes
    );
  } catch (e) {
    // Handle errors during sign-out
    print("Sign out failed: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Sign out failed: $e")),
    );
  }
}
