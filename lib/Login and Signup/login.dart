import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loan_application/Login%20and%20Signup/signup.dart';
import '../Dashboard/Dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool _isPasswordVisible = false;
  bool status = false;
  bool isLoading = false;

// Firebase Sign-In Function
  SignInWithEmailPassword() async {
    if (_formKey.currentState!.validate()) {
      // Proceed only if the form is valid
      setState(() {
        isLoading = true;
      });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
      } on FirebaseException catch (e) {
        Get.snackbar('Recheck or Forget Your Password', e.code);
      } catch (e) {
        Get.snackbar('Error Message', e.toString());
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?Center(child: CircularProgressIndicator(),): Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Padding(
        padding: EdgeInsets.all(25.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 70.h,),
              Image.asset('res/images/kanza.png'),
              SizedBox(height: 30.h,),
              Text('Login in to your account',style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: 20.h,),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                validator: (email){
                  if(email==null || email.isEmpty){
                    return 'Enter Email';
                  }
                  else if(!RegExp(r'^[\w\-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$').hasMatch(email)){
                    return 'Enter Right Mail';
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
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (password) => password!.length < 8? 'Password should be 8 digit' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 70.h,),
              Row(
                children: [
                  Switch(
                    activeColor: Colors.grey,
                    value: status,
                    onChanged: (value){
                      setState(() {
                        status =value;
                      });
                    },
                  ),
                  TextButton(onPressed: (){}, child: Text('Remember me',style: TextStyle(fontSize: 16.sp,color: Colors.grey),)),
                  SizedBox(width: 41.w,),
                  TextButton(onPressed: (){}, child: Text('Forget Password?',style: TextStyle(decoration: TextDecoration.underline,fontSize: 16.sp,color: Colors.grey),)),
                ],
              ),
              SizedBox(height: 30.h,),
              MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashboard(),));
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
                      'Login in',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              SvgPicture.asset('res/images/line.svg'),
              SizedBox(height: 40.h,),
              Row(
                children: [
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: (){
                        singInWithGoogle();
                      }, icon: SvgPicture.asset(
                    'res/images/btn.svg',width: 185.w,)),
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: (){}, icon: SvgPicture.asset(
                    'res/images/appleButton.svg',width: 185.w,)),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('If you don’t have an account',style: TextStyle(color: Colors.grey),),
                  TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Signup(),));
                      }, child:Text('Sign Up')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

singInWithGoogle() async {
  try {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // If the user cancels the Google sign-in, return early.
      Get.snackbar('Google Sign-In', 'Sign-in canceled by user');
      return;
    }

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Ensure that idToken and accessToken are not null before using them
    if (googleAuth.idToken == null || googleAuth.accessToken == null) {
      Get.snackbar('Google Sign-In Error', 'Failed to authenticate with Google.');
      return;
    }

    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);
  } catch (e) {
    // Make sure to handle any error gracefully and ensure the snackbar has valid parameters
    Get.snackbar('Google Sign-In Error', e.toString() ?? 'An unknown error occurred');
  }
}
