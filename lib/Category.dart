import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shayri2023/global_class.dart';
import 'package:shayri2023/shayris.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,

      appBar: GlobalClass.appbar("Category"),
      body: Center(
        child: Container(
          height: 350,
          child: ScrollSnapList(
            itemBuilder: (p0, p1) {
              return SizedBox(
                width: 250,
                height: 300,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ThirdPage(p1);
                    },));
                  },
                  child: Card(
                    color: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Padding(
                          padding: const EdgeInsets.all(60.0),
                          child: Image.asset("assets/images/${GlobalClass.catImage[p1]}",),
                        )),

                        Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                              ),
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                child: Text(
                          "${GlobalClass.catList[p1]}",
                          style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,),
                        ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: GlobalClass.catList.length,
            itemSize: 250,
            onItemFocus: (p0) {},
            dynamicItemSize: true,
          ),
        ),
      ),
    );
  }
}
