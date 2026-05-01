import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedAvatar = Appassets.avatar_8;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      appBar: AppBar(
        backgroundColor: Appcolors.blackColor,
        leading: Icon(Icons.arrow_back,color: Appcolors.yellowColor,),
        title: Text('Pick Avatar',style: TextStyle(
          color: Appcolors.yellowColor,fontSize: 16
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal : Checkbox.width*0.8),
        child: Column(
          spacing: height*0.02,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height*0.015,),
            GestureDetector(
              onTap: () => _showAvatarPicker(context),
              child:
              CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
            SizedBox(height: height*0.015,),

            TextField(
                cursorColor: Appcolors.whiteColor,
                style: TextStyle(
                    color: Appcolors.whiteColor,
                    fontSize: 16
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Appcolors.whiteColor,),
                    hintText: 'John Safwat',
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
            ),
            TextField(
                cursorColor: Appcolors.whiteColor,
                style: TextStyle(
                    color: Appcolors.whiteColor,
                    fontSize: 16
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone,color: Appcolors.whiteColor,),
                    hintText: '01200000000',
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
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {Navigator.of(context).pushNamed('forgetPass');},
                  child: Text("Reset Password", style: TextStyle(
                      color: Appcolors.whiteColor,
                      fontSize: 20)),
                ),
              ),

            Spacer(),
            SizedBox(
              width: double.infinity,
              height: height* 0.058,
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.redColor,
                      foregroundColor: Appcolors.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15)
                      )
                  ),
                  child: Text('Delete Account',style: TextStyle(fontSize: 20),)),
            ),
            SizedBox(
              width: double.infinity,
              height: height* 0.058,
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.yellowColor,
                      foregroundColor: Appcolors.blackColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(15)
                      )
                  ),
                  child: Text('Update Data',style: TextStyle(fontSize: 20),)),
            ),
            SizedBox(height: height*0.03,)
          ],
        ),
      ),
    );
  }

  void _showAvatarPicker(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      backgroundColor: Appcolors.grayColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (context) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: width*0.06 , horizontal: height*0.02),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: width*0.04,
              mainAxisExtent: height * 0.13,
              mainAxisSpacing: height * 0.02

          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            String avatarPath = 'assets/temp_images/avatar_${index + 1}.png';
            return GestureDetector(
              onTap: () {
                setState(() => selectedAvatar = avatarPath);
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedAvatar == avatarPath ? Appcolors.orangeColor.withOpacity(0.6)
                      : Colors.transparent,
                  border: Border.all(
                      color:  Appcolors.orangeColor,
                      width: Checkbox.width*0.1
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(avatarPath),
              ),
            );
          },
        );
      },
    );
  }
}

