import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences/display_data_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String name='';
  String email='';

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared prefrences'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'enter name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'enter email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: ()async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setString('name', nameController.text);
                sp.setString('email', emailController.text);

                // name=sp.getString('name')??'';
                // email=sp.getString('email')??'';

                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DisplayDataScreen()));
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: const Center(child: Text('submit'),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
