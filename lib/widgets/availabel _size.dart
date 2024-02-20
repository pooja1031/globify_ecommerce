import 'package:flutter/material.dart';

class AvailableSize extends StatefulWidget {
  final String Size;
  const AvailableSize({Key?key,required this.Size}):super(key:key);

  @override
  State<AvailableSize> createState() => _AvailableSizeState();
}

class _AvailableSizeState extends State<AvailableSize> {
  bool isSelected =false;
  @override
  Widget build(BuildContext context) =>
    GestureDetector(
      onTap: (){
        setState(() {
          isSelected=!isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 40,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected? Colors.red:Colors.transparent,
         border: Border.all(color: Colors.red), borderRadius: BorderRadius.circular(6),
      
        ),
        child: Text("",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
