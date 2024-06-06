import 'package:flutter/material.dart';
import 'package:prasantinilayam_sai_bhajans/constants.dart';
import 'package:prasantinilayam_sai_bhajans/shiv_bhajans.dart';

class bhajans extends StatefulWidget {
  const bhajans({super.key});

  @override
  State<bhajans> createState() => _bhajansState();
}

class _bhajansState extends State<bhajans> {
  bool sel=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            setState(() {
              sel=!sel;
              constants.bgcolor=sel?Colors.grey.shade800:constants.light;
            });
          }, child: Icon(sel?Icons.dark_mode:Icons.sunny),
        ),
        backgroundColor: constants.dark,
        title: Text("Bhajans",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor:constants.bgcolor ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/all.png","All bhajans")
                  ),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/devi.png","Devi bhajans")
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/ganesh.png","Ganesh bhajans")
                  ),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/guru.png","Guru bhajans")
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/hanuman.png","Hanuman bhajans")
                  ),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/krishna.png","Krishna bhajans")
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/ram.png","Ram bhajans")
                  ),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/sai.png","Sai bhajans")
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/shiv.png","Shiv bhajans")
                  ),
                  InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shiv()));},
                      child: cee("assets/vishnu.png","Vishnu bhajans")
                  ),
                ],
              ),
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}
Widget cee(String img,heading){
  return Column(
    children: [
      Container(
        height: 150,
        width: 175,
        child: Center(
          child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11)),
              child: Image.asset(img,fit: BoxFit.fill,)),
        ),
        decoration: BoxDecoration(
            color:constants.dark,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11))
        ),
      ),
      Container(
        height: 25,
        width: 175,
        child: Center(child: Text(heading,style: TextStyle(color: Colors.white,fontSize: 18),)),
        decoration: BoxDecoration(
            color: constants.dark,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11),bottomRight: Radius.circular(11))
        ),
      )
    ],);
}