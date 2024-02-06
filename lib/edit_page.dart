import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'global_class.dart';

class FinalPage extends StatefulWidget {

  int index;
  FinalPage(this.index);
  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {

  DeviceInfoPlugin info = DeviceInfoPlugin();
  WidgetsToImageController con = WidgetsToImageController();
  var folderPath = "";
  late File file;
  FontStyle fs = FontStyle.normal;
  FontWeight fw = FontWeight.normal;
  TextDecoration ts = TextDecoration.none;
  Gradient? grad;
  int fwr = 0;
  int fir = 0;
  int fur = 0;
  Uint8List? dd;

  @override
  void initState() {
    createFolder();
  }

  var bgColor = Colors.white;
  var bgBorderColor = Colors.black;
  var textColor = Colors.black;
  double currentVal = 17;
  double currentVal2 = 0;
  double bgBorder = 0;
  double size = 17;
  String emoji = "";
  String fontStyle = "";
  String image = "";
  bool isGrad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      appBar: GlobalClass.appbar("Edit Page"),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: WidgetsToImage(
                  controller: con,
                  child: image!="" ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover,opacity: 0.9),
                      border: Border.all(width: bgBorder,color: bgBorderColor),
                    ),
                   child : Padding(
                      padding: const EdgeInsets.all(45),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(emoji,style: TextStyle(fontSize: size),),
                          ),
                          Text("${GlobalClass.passShayri[widget.index]}",textAlign: TextAlign.center,style: TextStyle(fontSize: size,color: textColor,fontFamily: fontStyle,fontStyle: fs,fontWeight: fw,decoration: ts),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(emoji,style: TextStyle(fontSize: size),),
                          ),
                        ],
                      ),
                    ),
                  ) : Container(
                      decoration: BoxDecoration(
                        gradient: isGrad ? grad : null,color: isGrad ? null : bgColor,
                          border: Border.all(width: bgBorder,color: bgBorderColor),
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(emoji,style: TextStyle(fontSize: size),),
                          ),
                          Text("${GlobalClass.passShayri[widget.index]}",textAlign: TextAlign.center,style: TextStyle(fontSize: size,color: textColor,fontFamily: fontStyle,fontStyle: fs,fontWeight: fw,decoration: ts),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(emoji,style: TextStyle(fontSize: size),),
                          ),
                        ],
                      ),
                     ),
                    ),
                  ),
                ),
              ),
            ),
          
          Container(
            height: 90,
            color: Colors.deepPurple,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                   onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context, builder: (context) {
                        return SimpleDialog(
                          title: Center(child: Text("Pick Color",style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),)),
                          children: [
                            MaterialPicker(pickerColor: bgColor, onColorChanged: (value) {
                              setState(() {
                                isGrad = false;
                                image="";
                                bgColor = value;
                              });
                            },),

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OK")),
                              ),
                            ),
                          ],
                        );
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 30),
                          child: Icon(Icons.format_color_fill_outlined,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 30),
                          child: Text("Bg Color",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        context: context, builder: (context) {
                        return Container(
                          height: 110,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListView.builder(itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isGrad = true;
                                      image="";
                                      grad = GlobalClass.gradient[index];
                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                                    elevation: 5,
                                    child: Container(
                                     width: 90,
                                      decoration: BoxDecoration(
                                        gradient: GlobalClass.gradient[index],
                                        borderRadius: BorderRadius.circular(11),
                                        border: Border.all(color: Colors.black,width: 2)
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                              scrollDirection: Axis.horizontal,
                            itemCount: GlobalClass.gradient.length,
                            ),
                          ),
                        );
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.gradient,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Gradient",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        context: context, builder: (context) {
                        return Container(
                          height: 130,
                          child: ListView.builder(itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  image = "assets/images/${GlobalClass.bgImage[index]}";
                                });
                              },
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                  border: Border.all(color: Colors.black,width: 2,),
                                ),
                                margin: EdgeInsets.all(5),
                                child: Image.asset("assets/images/${GlobalClass.bgImage[index]}",fit: BoxFit.cover,),
                              ),
                            );
                          },
                            scrollDirection: Axis.horizontal,
                            itemCount: GlobalClass.bgImage.length,
                          ),
                        );
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.image,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Bg Image",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context, builder: (context) {
                        return StatefulBuilder(builder: (context, setState1) {
                          return Container(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("-",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),),
                                    ),
                                    Expanded(
                                      child: Slider(value: currentVal2, onChanged: (value) {
                                        setState1(() {
                                          setState(() {
                                            currentVal2 = value;
                                            bgBorder = currentVal2;
                                          });
                                        });
                                      },
                                        activeColor: Colors.blue,
                                        inactiveColor: Colors.red,
                                        label: currentVal2.round().toString(),
                                        min: 0,
                                        max: 100,
                                        divisions: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text("+",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
                                    ),
                                  ],
                                ),

                                ElevatedButton(onPressed: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context, builder: (context) {
                                    return SimpleDialog(
                                      title: Center(child: Text("Pick Color")),
                                      children: [
                                        ColorPicker(pickerColor: bgBorderColor, onColorChanged: (value) {
                                          setState(() {
                                            bgBorderColor = value;
                                          });
                                        },),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: Center(
                                            child: ElevatedButton(onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            }, child: Text("OK")),
                                          ),
                                        )
                                      ],
                                    );
                                  },);
                                }, child: Text("Border Color")),
                              ],
                            ),
                          );
                        },);
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.border_outer,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Bg Border",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context, builder: (context) {
                        return SimpleDialog(
                          title: Center(child: Text("Pick Color",style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),)),
                          children: [
                            MaterialPicker(pickerColor: textColor, onColorChanged: (value) {
                              setState(() {
                                textColor = value;
                              });
                            },),

                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("OK")),
                              ),
                            ),
                          ],
                        );
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.colorize_sharp,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Text Color",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context, builder: (context) {
                        return StatefulBuilder(builder: (context, setState1) {
                          return Container(
                            height: 90,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("-",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),),
                                ),
                                Expanded(
                                  child: Slider(value: currentVal, onChanged: (value) {
                                    setState1(() {
                                      setState(() {
                                        currentVal = value;
                                        size = currentVal;
                                      });
                                    });
                                  },
                                    activeColor: Colors.blue,
                                    inactiveColor: Colors.red,
                                    label: currentVal.round().toString(),
                                    min: 10,
                                    max: 100,
                                    divisions: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("+",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),
                                ),
                              ],
                            ),
                          );
                        },);
                      },);

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.format_size,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Text Size",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        context: context, builder: (context) {
                        return Container(
                          height: 90,
                          child: ListView.builder(itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    fontStyle = GlobalClass.fonts[index];
                                  });
                                },
                                child: Card(
                                  color: Colors.deepPurple,
                                  child: Center(child: Text("${GlobalClass.fonts[index]}",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            );
                          },
                            itemExtent: 150,
                            scrollDirection: Axis.horizontal,
                          itemCount: GlobalClass.fonts.length,
                          ),
                        );
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.font_download,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Font-Family",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return Container(
                          color: Colors.lightBlueAccent.shade100,
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap :(){
                                  setState(() {
                                    if(fir==0){
                                      fs = FontStyle.italic;
                                      fir=1;
                                    }
                                    else{
                                      fs = FontStyle.normal;
                                      fir=0;
                                    }
                                  });
                                  },
                                child: Container(
                                 height: 60,
                                  width: 60,
                                  color: Colors.deepPurple,
                                  child: Center(child: Text("I",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white,fontStyle: FontStyle.italic,),)),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if(fwr==0){
                                      fw = FontWeight.bold;
                                      fwr=1;
                                    }
                                    else{
                                      fw = FontWeight.normal;
                                      fwr=0;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  color: Colors.deepPurple,
                                  child: Center(child: Text("B",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
                                ),
                              ),

                              InkWell(
                                onTap : (){
                                  setState(() {
                                    if(fur==0){
                                      ts = TextDecoration.underline;
                                      fur=1;
                                    }
                                    else{
                                      ts = TextDecoration.none;
                                      fur=0;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  color: Colors.deepPurple,
                                  child: Center(child: Text("U",style: TextStyle(fontSize: 25,color: Colors.white),)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.format_bold,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Font-style",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.deepPurple,
                        context: context, builder: (context) {
                        return Container(
                          height: 240,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListView.builder(itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if(GlobalClass.emoji[index] == GlobalClass.emoji[13]){
                                      emoji = "";
                                      Navigator.pop(context);
                                    }
                                    else{
                                      emoji = GlobalClass.emoji[index];
                                      Navigator.pop(context);
                                    }
                                  });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                                  shadowColor: Colors.white,
                                  child: Center(child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("${GlobalClass.emoji[index]}",style: TextStyle(fontSize: 25),),
                                  )),
                                ),
                              );
                            },
                              itemCount: GlobalClass.emoji.length,
                            ),
                          ),
                        );
                      },);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.emoji_emotions,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Emoji",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      con.capture().then((value) async {
                        String imageName = "Image${Random().nextInt(10000)}.jpg";
                        String imagePath = "$folderPath/$imageName";
                        File file = File(imagePath);
                        file.writeAsBytes(value as List<int>);
                        File ff = await file.create();
                        Share.shareFiles(["${file.path}"]);
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(Icons.share,color: Colors.white,size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Share",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void createFolder() {
    info.androidInfo.then((value) async {
      if(value.version.sdkInt >= 30){
        var folderName = "MyShayri11";
        var path = Directory("storage/emulated/0/Download/$folderName");
        if(await path.exists()){
          print("exists11");
        }
        else{
          print("not exists11");
          path.create();
        }
        setState(() {
          folderPath = path.path;
        });
      }
      else{
        var folderName = "MyShayri9";
        var path = Directory("storage/emulated/0/$folderName");
        if(await path.exists()){
          print("exists9");
        }
        else{
          print("not exists9");
          path.create();
        }
        setState(() {
          folderPath = path.path;
        });
      }
    });
  }
}
