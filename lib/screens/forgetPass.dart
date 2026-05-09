import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';
import 'package:movie_app/utiles/dialog_utils.dart';

class Forgetpass extends StatefulWidget {
  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackColor,
        leading: IconButton(
        color: Appcolors.yellowColor, onPressed: () {
          Navigator.of(context).pushNamed('profile');
        }, icon: Icon(Icons.arrow_back),),
        title: Text('Forget Password',style: TextStyle(
          color: Appcolors.yellowColor,fontSize: 16
        ),),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: height*0.03,
          children: [
            Image.asset(Appassets.forgetPass),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal : Checkbox.width*0.8),
              child: TextField(
                cursorColor: Appcolors.whiteColor,
                style: TextStyle(
                  color: Appcolors.whiteColor,
                  fontSize: 16
                ),
                  decoration: InputDecoration(
                    prefixIcon: Image.asset(Appassets.mail_icon),
                hintText: 'Email',
                hintStyle: TextStyle(color: Appcolors.whiteColor,fontSize: 18),
                filled: true,
                fillColor: Appcolors.grayColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Appcolors.whiteColor)
                    )

                )
              ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal : Checkbox.width*0.8),
              child: SizedBox(
                width: double.infinity,
                height: height* 0.058,
                child: ElevatedButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    return resetPassword();
                  }
                },//شغل الباتووون
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.yellowColor,
                  foregroundColor: Appcolors.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15)
                  )
                ),
                    child: Text('Verify Email',style: TextStyle(fontSize: 20),)),
              ),
            )

          ],
        ),
      ),
    );
  }

  void resetPassword() async {
    if (_formKey.currentState?.validate() == true) {
      // show loading
      DialogUtils.showloading(context: context);
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );
        // hide loading
        DialogUtils.hideloading(context: context);
        // show success
        DialogUtils.showMessage(
          context: context,
          message: 'Password reset email sent successfully',
          posActionName: 'OK',
        );
      } on FirebaseAuthException catch (e) {
        // hide loading
        DialogUtils.hideloading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: e.message ?? 'Something went wrong',
          posActionName: 'OK',
        );
      } catch (e) {
        // hide loading
        DialogUtils.hideloading(context: context);

        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          posActionName: 'OK',
        );
      }
    }
  }
}