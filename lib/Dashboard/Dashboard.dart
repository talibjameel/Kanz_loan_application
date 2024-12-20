import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Profile/profile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200.h,
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
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                children:[
                  SvgPicture.asset('res/images/light.svg',width: 50.w,height: 50.h,),
                  SizedBox(width: 10.w,),
                  Text('Hi Talib!',style: TextStyle(fontSize: 26.sp,fontWeight: FontWeight.bold,color: Colors.black),),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),
                  MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                  },child: PhysicalModel(
                      color: Colors.red,
                      clipBehavior: Clip.antiAlias,
                      // elevation: 60.0,
                      shape: BoxShape.circle,
                      child: Image.asset(
                        'res/images/myprofilepic.png',
                        width: 75.w,
                        height: 75.w,
                        fit: BoxFit.cover,
                      )),)
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Hello Talib!',style: TextStyle(color: Colors.black,fontSize: 26.sp,fontWeight: FontWeight.bold),),
                    Spacer(),
                    MaterialButton(
                      minWidth: 100.w,
                      height: 50.h,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          side:  BorderSide(color: Colors.black,width: 2.w),
                          borderRadius: BorderRadius.circular(5.r)),
                      onPressed: (){},child: Text('Pending'),),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
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
                          constraints:  BoxConstraints(minWidth: 110.w, minHeight: 50.h),
                          alignment: Alignment.center,
                          child:  Text(
                            'Apply Now',
                            style: TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Apply Now',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                    TextButton(onPressed: (){}, child: Text('View all',style: TextStyle(color: Colors.grey,fontSize: 20.sp),))
                  ],
                ),
                SizedBox(height: 10.h,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 100.h,
                        width: 85.w,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('res/images/clarity_home-line.svg',width: 25.w,height: 40.h,),
                            SizedBox(height: 5.h,),
                            Text('Mortgage',style: TextStyle(fontSize: 14.sp),),
                            SizedBox(height: 10.h,)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        height: 100.h,
                        width: 85.w,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h,),
                            SvgPicture.asset('res/images/solar_money-bag-broken.svg',width: 25.w,height: 40.h,),
                            SizedBox(height: 5.h,),
                            Text('Personal \n Loan',style: TextStyle(fontSize: 14.sp),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        height: 100.h,
                        width: 85.w,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('res/images/clarity_auto-line.svg',width: 25.w,height: 40.h,),
                            SizedBox(height: 5.h,),
                            Text('Auto Loan',style: TextStyle(fontSize: 14.sp),),
                            SizedBox(height: 10.h,)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      // Container(
                      //   height: 100.h,
                      //   width: 85.w,
                      //   decoration:BoxDecoration(
                      //     borderRadius: BorderRadius.circular(15.r),
                      //     border: Border.all(color: Colors.black),
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SvgPicture.asset('res/images/fourth_element.svg',width: 25.w,height: 40.h,),
                      //       SizedBox(height: 5.h,),
                      //       Text('SMEs Loan',style: TextStyle(fontSize: 14.sp),),
                      //       SizedBox(height: 10.h,)
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(width: 10.w,),
                      Container(
                        height: 100.h,
                        width: 85.w,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 4.h,),
                            SvgPicture.asset('res/images/ph_student.svg',width: 25.w,height: 40.h,),
                            SizedBox(height: 5.h,),
                            Text('Student Loan',style: TextStyle(fontSize: 14.sp),textAlign: TextAlign.center,),
                            SizedBox(height: 10.h,)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Container(
                        height: 100.h,
                        width: 85.w,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('res/images/streamline_islam.svg',width: 25.w,height: 40.h,),
                            SizedBox(height: 5.h,),
                            Text('Islamic \n Finance',style: TextStyle(fontSize: 14.sp),),
                            SizedBox(height: 10.h,)
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w,),

                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Text("What's Hot!",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.h,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset('res/images/Card.png',height: 160.h,),
                      SizedBox(width: 10.w,),
                      Image.asset('res/images/Card2.jpg',height: 160.h,),
                      SizedBox(width: 10.w,),
                      Image.asset('res/images/Card3.png',height: 160.h,),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Text("For You",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.h,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SvgPicture.asset('res/images/foryou1.svg',height: 100.h,),
                      SizedBox(width: 10.w,),
                      SvgPicture.asset('res/images/for_you_2.svg',height: 100.h,),
                      SizedBox(width: 10.w,),
                      SvgPicture.asset('res/images/foryou1.svg',height: 100.h,),
                      SizedBox(width: 10.w,),
                      SvgPicture.asset('res/images/for_you_2.svg',height: 100.h,),
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                Text("Become Finance Savvy",style: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 10.h,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset('res/images/Savvy_cars.png',height: 194.h,),
                      SizedBox(width: 10.w,),
                      Image.asset('res/images/Savvy_card2.png',height: 194.h,),
                      SizedBox(width: 10.w,),
                      Image.asset('res/images/Savvy_cars.png',height: 194.h,),
                      SizedBox(width: 10.w,),
                      Image.asset('res/images/Savvy_card2.png',height: 194.h,),
                    ],
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
