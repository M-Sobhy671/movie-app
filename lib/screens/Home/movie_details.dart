import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class MovieDetails extends StatelessWidget {
  final String movieImage;
  final String movieName;

  const MovieDetails({
    super.key, required this.movieImage, required this.movieName});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(movieImage,fit: BoxFit.cover,)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.8),
                    Colors.black,
                  ],
                  stops: const [0.0, 0.5, 0.9],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child:Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Checkbox.width*0.5),
                  child: SafeArea(
                    child: Column(
                      spacing: height*0.015,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: height*0.2,),
                        Image.asset(Appassets.play_icon),
                        SizedBox(height: height*0.2,),
                        Text(movieName,style: TextStyle(
                          color: Appcolors.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('2020',style: TextStyle(
                            color:Appcolors.whiteGrayColor,
                          fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          width: double.infinity,
                          height: height*0.06,
                          child: ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Appcolors.redColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(15)
                              )),
                              child:Text('Watch',style: TextStyle(
                                color: Appcolors.whiteColor,
                                fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),) ),
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Appcolors.grayColor,
                                  borderRadius: BorderRadiusGeometry.circular(16)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical:width*0.01
                                      ,horizontal:height*0.02 ),
                                  child: Row(
                                    spacing: width*0.03,
                                    children: [
                                      Image.asset(Appassets.like_icon),
                                      Text('15',style: TextStyle(
                                        color: Appcolors.whiteColor,
                                        fontSize:24,
                                        fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Appcolors.grayColor,
                                    borderRadius: BorderRadiusGeometry.circular(16)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical:width*0.01
                                      ,horizontal:height*0.02 ),
                                  child: Row(
                                    spacing: width*0.03,
                                    children: [
                                      Image.asset(Appassets.time_icon),
                                      Text('90',style: TextStyle(
                                          color: Appcolors.whiteColor,
                                          fontSize:24,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Appcolors.grayColor,
                                    borderRadius: BorderRadiusGeometry.circular(16)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical:width*0.01
                                      ,horizontal:height*0.02 ),
                                  child: Row(
                                    spacing: width*0.03,
                                    children: [
                                      Image.asset(Appassets.fav_icon),
                                      Text('7.6',style: TextStyle(
                                          color: Appcolors.whiteColor,
                                          fontSize:24,
                                          fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Screen Shots',style: TextStyle(
                            color: Appcolors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),),
                        ),
                        Image.asset(Appassets.screenShot_1),
                        Image.asset(Appassets.screenShot_2),
                        Image.asset(Appassets.screenShot_3)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned( top: MediaQuery.of(context).padding.top +10,
            left: width*0.01,
            right: width*0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: Icon(Icons.arrow_back_ios_new,color: Appcolors.whiteColor,)),
                Icon(Icons.bookmark,color: Appcolors.whiteColor,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
