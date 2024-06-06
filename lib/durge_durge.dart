import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prasantinilayam_sai_bhajans/constants.dart';
import 'package:prasantinilayam_sai_bhajans/url_launch_button.dart';

class durge_durge extends StatefulWidget {
  const durge_durge({super.key});

  @override
  State<durge_durge> createState() => _durge_durgeState();
}

class _durge_durgeState extends State<durge_durge> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Container(margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size. width,
            child: StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection('devi_bhajan_lyrics').orderBy('name', descending: true).snapshots(),
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
                              title: Text(constants.d1),
                             ),
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
