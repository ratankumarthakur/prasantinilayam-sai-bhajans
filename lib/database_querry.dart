import 'package:cloud_firestore/cloud_firestore.dart';

create(String collName, docName, name, l,time) async {
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .set({'name': name, 'link':l,'time':time});
  //print('Database Updated');
}

