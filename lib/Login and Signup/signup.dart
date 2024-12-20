import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_application/Dashboard/Dashboard.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _email=TextEditingController();
  bool _isPasswordVisible = false;
  bool status = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Padding(
        padding: EdgeInsets.all(25.w),
        child: Column(
          children: [
            SizedBox(height: 40.h,),
            Image.asset('res/images/kanza.png'),
            SizedBox(height: 30.h,),
            Text('Sign in to your account',style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: 20.h,),
            TextFormField(
              decoration:  InputDecoration(
                labelText: 'User Name',
                hintText: 'User Name',
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
              ),
              validator: (name){
                if(name==null || name.isEmpty){
                  return 'Enter First name';
                }
                else if(!RegExp(r'^[a-zA-Z]+$').hasMatch(name)){
                  return 'Alphabet only';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,

            ),
            SizedBox(height: 20.h,),
            TextFormField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration:  InputDecoration(
                labelText: 'Enter Email',
                hintText: 'Text here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),

              validator: (email){
                if(email==null || email.isEmpty){
                  return 'Enter Email';
                }
                else if(!RegExp(r'@yahoo.com').hasMatch(email)){
                  return 'Only Yahoo mail are Accept';
                }
                return null;
              },


            ),
            SizedBox(height: 30.h,),
            TextFormField(
              obscureText: _isPasswordVisible,
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                labelText: 'Create Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    // Switch between visibility and visibility_off icons
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle the visibility state
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (password) => password!.length < 8? 'Password should be 8 digit' : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 20.h,),
            TextFormField(
              obscureText: _isPasswordVisible,
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    // Switch between visibility and visibility_off icons
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    // Toggle the visibility state
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (password) => password!.length < 8? 'Password should be 8 digit' : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Checkbox(
              checkColor: Colors.white,
              // fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              shape: CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
                SizedBox(width: 5.w,),
                Text("I’ve read and agreed to User Agreement \n And Privacy Policy"),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children:[
                  MaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard(),));
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient:  LinearGradient(
                            begin: Alignment.topCenter,  // Starting from top-left
                            end: Alignment.bottomCenter, // Ending at bottom-right
                            colors: [
                              Color(0xffE61573),
                              Color(0xffF3990E),
                            ]
                        ),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Container(
                        constraints:  BoxConstraints(minWidth: 50.w, minHeight: 60.h),
                        alignment: Alignment.center,
                        child:  Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  SvgPicture.asset('res/images/line.svg',width: 350.w,),
                  SizedBox(height: 40.h,),
                  Row(
                    children: [
                      IconButton(
                          splashColor : Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: (){},
                          icon: SvgPicture.asset(
                            'res/images/btn.svg',width: 178.w,)),
                      // SizedBox(width: 10.w),
                      IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: (){},
                          icon: SvgPicture.asset(
                            'res/images/appleButton.svg',width: 178.w,)),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Already have an account',style: TextStyle(color: Colors.grey),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                      }, child:Text('Sign In')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
