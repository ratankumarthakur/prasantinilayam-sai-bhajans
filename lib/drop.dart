import 'package:flutter/material.dart';

class drop extends StatefulWidget {
  const drop({super.key});

  @override
  State<drop> createState() => _dropState();
}

class _dropState extends State<drop> {

  String sel="English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(sel=="English"?"Haan english bolo":"हाँ अंग्रेजी बोलो"),SizedBox(height: 20,),
            DropdownButton<String>(
              value: sel,
              icon: Icon(Icons.location_on_outlined),
              onChanged: (String? newvalue){
                setState(() {
                  sel=newvalue!;
                });
              },
              items: <String>["English","Hindi"].map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
