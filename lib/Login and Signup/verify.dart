
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../wraper.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}
class _VerifyPageState extends State<VerifyPage> {
  @override
  void initState() {
    sendVerifyinglink();
    super.initState();
  }
  sendVerifyinglink() async{
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
      Get.snackbar('link Send', 'link Send . A link send to Your Email',margin: EdgeInsets.all(30),snackPosition: SnackPosition.TOP),
    });
  }

  reload()async{
    await FirebaseAuth.instance.currentUser!.reload().then((value) => {Get.offAll(const Wraper(),)});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff27D4C1),
        title: Center(child: const Text('Verify YouSelf')),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email Verification link is send Successfully to your Enter mail.Open your Email and verify your Email and then come back and click on button",textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            ElevatedButton(onPressed: (){
              reload();
            }, child: Text('Go to Home'),)
          ],
        ),
      ),
    );
  }
}
