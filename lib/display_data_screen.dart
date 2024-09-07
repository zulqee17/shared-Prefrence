import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayDataScreen extends StatefulWidget {
  const DisplayDataScreen({Key? key}) : super(key: key);

  @override
  State<DisplayDataScreen> createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display data screen'),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context,AsyncSnapshot<SharedPreferences> snapshot){
                return Column(
                  children: [
                    reusableRow("Name", snapshot.data!.getString('name').toString()),
                    reusableRow("Email", snapshot.data!.getString('email').toString()),

                  ],
                );
              })
        ],
      ),
    );
  }
}

Widget reusableRow(String title,String data){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      Text(data,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.normal),),
    ],
  );
}
