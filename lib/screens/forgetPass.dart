import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class Forgetpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackColor,
        leading: Icon(Icons.arrow_back,
        color: Appcolors.yellowColor,),
        title: Text('Forget Password',style: TextStyle(
          color: Appcolors.yellowColor,fontSize: 16
        ),),
        centerTitle: true,
      ),
      body: Column(
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
              child: ElevatedButton(onPressed: (){},//شغل الباتووون
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
    );
  }
}