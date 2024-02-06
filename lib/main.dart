import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri2023/Category.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DeviceInfoPlugin info = DeviceInfoPlugin();

  @override
  void initState() {
    permission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      
      body: Column(
        children: [
          Expanded(child: Center(child: Text("Shayri 2023",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.bold),))),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.white,blurRadius: 5)],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return SecondPage();
                    },));
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    color: Colors.deepPurple,
                    child: Center(child: Text("Let's Start",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void permission() {
    info.androidInfo.then((value) async {
      if(value.version.sdkInt >= 33){
        var permission = await Permission.photos.status;
        if(permission.isDenied){
          await Permission.photos.request();
        }
      }
      else{
        var permission = await Permission.storage.status;
        if(permission.isDenied){
          await Permission.storage.request();
        }
      }
    });
  }
}
