import 'package:flutter/material.dart';
import 'package:prasantinilayam_sai_bhajans/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class shiv extends StatefulWidget {

  const shiv({super.key,});
  @override
  State<shiv> createState() => _shivState();
}

class _shivState extends State<shiv> {

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url="https://youtu.be/1HRFQPm9H1A?si=Zd5gqHfwrOsXnLxP";
    controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
            mute: false,
            loop: false,
            autoPlay: false,
        )
    )..addListener(() { if(mounted){
      setState(() {
      });
    }
    });
  }
  Widget fun2(String s,t){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22)
        ),
        child: MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),onPressed: (){
          String url=s;
          controller.load(YoutubePlayer.convertUrlToId(url)!);
        },color:constants.dark, child: Text(t,style: TextStyle(color: Colors.white),)),
      ),
    );
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List u=["https://youtu.be/vDhQYrttxVE?si=Oj37lgfwGcyEY1Hc",
          "https://youtu.be/M6TfLM1VfEE?si=OhQ4lMr0Xq2wue2v",
          "https://youtu.be/571m1YaMmwE?si=A47sxbBNySQrhCIE",
          "https://youtu.be/RvJOwuj228M?si=uwr_ALuZhnH-rUK_",
          "https://youtu.be/DD8NbA7gTjE?si=1IkRZdCXGzSZaGuK",
          "https://youtu.be/MSI-gRrn0CQ?si=MH9O_RwPcpGm0uuu",
          "https://youtu.be/m6aDfTErnz0?si=6C6GZ7SZj6x5Kp-v",
          "https://youtu.be/kuNsZBnAs1I?si=sQftTuGTAWSzfomk",
          "https://youtu.be/wENj29QSaPM?si=3k3_dUmaQRTd6Nbk",
          "https://youtu.be/o78v0LAp6bA?si=53OC0AWjxzY8UZg6"];

  List b=["Shiva maheshwara",
          "Hari hari om",
          "Bhasma bhusitanga",
          "Shankara shiv shankara",
          "Namah parvati pataye",
          "Hey shiv shankara",
          "Daya karo shiva",
          "Shambho mahadev",
          "Shiv shambho ",
          "Om naham shivay "];

  @override
  Widget build(BuildContext context) =>YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.green,
        ),
      ), builder:(context,player)=>Scaffold(
         backgroundColor: constants.bgcolor ,
         appBar: AppBar(
           backgroundColor: Color(0xfffab74e),
          title: const Text("Shiv bhajans",style: TextStyle(color: Colors.white),),
           centerTitle: true,
         ),
         body:Column(
           children: [Container(height:250,width: double.infinity,child: player),
             Text("Currently playing : ${controller.metadata.title}"),
             Container(height: MediaQuery.of(context).size.height/2,
               child: ListView.builder(scrollDirection: Axis.vertical,shrinkWrap: true,itemBuilder: (context,index){
                 return fun2(u[index],b[index]);
               },
                 itemCount: u.length,),
             ),
             //SizedBox(height: 14,)
           ],
         )
  )
  );
}
