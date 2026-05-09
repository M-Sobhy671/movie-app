import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appColors.dart';

class DialogUtils {

  static void showloading({required BuildContext context}){
    showDialog(context: context,
        barrierDismissible: false,
        builder:(context) => AlertDialog(
          backgroundColor: Appcolors.grayColor,
          content: Row(
            spacing: 15,
            children: [
              CircularProgressIndicator(color: Appcolors.yellowColor,),
              Text('Loading...',style: TextStyle(color: Appcolors.yellowColor),)
            ],
          ),
        ) );
  }

  static void hideloading({required BuildContext context}){
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? posActionName,
    String? negActionName,
    VoidCallback? posAction,
    VoidCallback? negAction
  }){
    List<Widget>actions=[];
    if(posActionName !=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        posAction?.call();
      }, child: Text(posActionName,style: TextStyle(color: Appcolors.yellowColor),)));
    }
    if(negActionName !=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        negAction?.call();
      }, child: Text(negActionName,style: TextStyle(color: Appcolors.yellowColor),)));
    }
    
    showDialog(context: context,
        builder:(context) => AlertDialog(
          backgroundColor: Appcolors.grayColor,
          content: Text(message,style:
          TextStyle(color: Appcolors.yellowColor,fontSize: 20),),
          actions: actions,
        ) );
  }
}