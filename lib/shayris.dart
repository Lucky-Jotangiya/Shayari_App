import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri2023/edit_page.dart';
import 'package:shayri2023/global_class.dart';

class ThirdPage extends StatefulWidget {

  int p1;

  ThirdPage(this.p1);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {

  @override
  void initState() {
    if(widget.p1 == 0){
      GlobalClass.passShayri = GlobalClass.funny;
    }
    else if(widget.p1 == 1){
      GlobalClass.passShayri = GlobalClass.morning;
    }
    else if(widget.p1 == 2){
      GlobalClass.passShayri = GlobalClass.night;
    }
    else if(widget.p1 == 3){
      GlobalClass.passShayri = GlobalClass.birthday;
    }
    else if(widget.p1 == 4){
      GlobalClass.passShayri = GlobalClass.friend;
    }
    else if(widget.p1 == 5){
      GlobalClass.passShayri = GlobalClass.attitude;
    }
    else if(widget.p1 == 6){
      GlobalClass.passShayri = GlobalClass.god;
    }
    else if(widget.p1 == 7){
      GlobalClass.passShayri = GlobalClass.newyear;
    }
    else if(widget.p1 == 8){
      GlobalClass.passShayri = GlobalClass.republic;
    }
    else if(widget.p1 == 9){
      GlobalClass.passShayri = GlobalClass.holi;
    }
    else if(widget.p1 == 10){
      GlobalClass.passShayri = GlobalClass.motivation;
    }
    else if(widget.p1 == 11){
      GlobalClass.passShayri = GlobalClass.love;
    }
    else if(widget.p1 == 12){
      GlobalClass.passShayri = GlobalClass.bestwish;
    }
  }
  
  List<Widget> shayri(){
    List<Widget> ll = [];
    
    for(int i=0; i<GlobalClass.passShayri.length; i++){
      ll.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
          ),
          width: 360,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
            color: Colors.blue.shade900,
            child: Column(
              children: [
                Expanded(
                  child: Center(child: Text("${GlobalClass.passShayri[i]}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white,),)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          FlutterClipboard.copy("${GlobalClass.passShayri[i]}");
                          Fluttertoast.showToast(msg: "Copied",backgroundColor: Colors.white,textColor: Colors.black);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21)),
                          ),
                          height: 45,
                          child: Icon(Icons.copy),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return FinalPage(i);
                          },));
                        },
                        child: Container(
                          color: Colors.white,
                          height: 45,
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Share.share("${GlobalClass.passShayri[i]}");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(21)),
                          ),
                          height: 45,
                          child: Icon(Icons.share),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
      );
    }
    return ll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      appBar: GlobalClass.appbar("${GlobalClass.catList[widget.p1]}"),
      body: ListWheelScrollView(
        itemExtent: 260,
        children: shayri(),
      ),
    );
  }
}
