import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prasantinilayam_sai_bhajans/constants.dart';
import 'package:prasantinilayam_sai_bhajans/database_querry.dart';
import 'package:prasantinilayam_sai_bhajans/url_launch_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class events extends StatefulWidget {
   events({super.key});

  @override
  State<events> createState() => _eventsState();
}

class _eventsState extends State<events> {

  List<String> l=[];
  var n=TextEditingController();
  var g=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.bgcolor,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: constants.dark,
        title: Text("Events",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          AvatarGlow(glowColor:constants.purplel ,
              glowCount: 8,
              child: InkWell(onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                        title: Text("Add a new event to list",style: TextStyle(color: constants.purpled),),
                        content: Container(height: 240,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(height: 60,
                                  decoration: BoxDecoration(
                                      color: constants.light,
                                      borderRadius: BorderRadius.circular(11)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: n,
                                      decoration: InputDecoration(
                                          hintText: "Enter the event name"
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(height: 60,
                                  decoration: BoxDecoration(
                                      color: constants.light,
                                      borderRadius: BorderRadius.circular(11)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      maxLines: null,
                                      controller: g,
                                      decoration: InputDecoration(
                                          hintText: "Enter the google drive link of the video to share",
                                        hintStyle: TextStyle(fontSize: 15)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Please ensure that everyone can access your video by doing the required settings",
                                  style: TextStyle(color: constants.purpled,fontSize: 12),),
                              )
                            ],),
                        ),
                        actions: [
                          TextButton(onPressed: (){Navigator.pop(context);},
                              child: Text("Cancel",style: TextStyle(color: constants.purpled),)),
                          TextButton(onPressed: (){
                            create("events","${DateTime.now()}", n.text.toString(),g.text.toString(),"${DateTime.now()}");
                            setState(() { });
                            n.clear();
                            g.clear();
                            Fluttertoast.showToast(
                                msg: "Event added successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 3,
                                backgroundColor: constants.purpled,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.pop(context);
                          }, child:Text("Add",style: TextStyle(color: constants.purpled)) )],
                      );});},
                child: Padding(
                  padding: const EdgeInsets.only(right: 22.0),
                  child: CircleAvatar(radius: 25,backgroundColor:constants.light,
                    child: Icon(Icons.add,color: constants.dark,size: 30,) ,),
                ),
              )
          )
        ],),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Container(margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size. width,
            child: StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection('events').orderBy('time', descending: true).snapshots(),
              builder: (context, petSnapshot) {
                if (petSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final petDocs = petSnapshot.data!.docs;
                  return ListView.builder(
                      itemCount: petDocs.length,
                      itemBuilder: (context, index) {
                        return petSnapshot.data!.docs.isNotEmpty
                            ? Card( // not working as of now
                          elevation: 10,
                              child: ListTile(
                              title: Text(petDocs[index]['name']),
                              subtitle: Text(
                                  petDocs[index]['time'].toString().substring(
                                      0, 10)),
                              trailing: test1(s: petDocs[index]['link'],)),
                        ):
                        const Card(
                          elevation: 10,
                          child: ListTile(
                            title: Text("no data"),
                          ),
                        );
                      });}},
            ),
          ),
        ),
      ),
    );
  }
}
