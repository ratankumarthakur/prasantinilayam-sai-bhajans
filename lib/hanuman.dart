import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'constants.dart';
class hanuman extends StatefulWidget {

  const hanuman({super.key,});
  @override
  State<hanuman> createState() => _hanumanState();
}

class _hanumanState extends State<hanuman> {

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    const url="https://youtu.be/VjgWu7CgoWE?si=4mRXFBNajOKd0Wm-";
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

  List u=["https://youtu.be/d5PpeNb-dOY?si=Cx6KVAqhnf0NBAYZ",
    "https://youtu.be/3TcGDNhcMNk?si=wf9tMA_SI3LnhYT5",
    "https://youtu.be/k1MRO6njIAU?si=hB4xaT9PCUdCHP9G",
    "https://youtu.be/Psi7Y-2S-3U?si=DoJO79ovqX5mvJ8F"];

  @override
  Widget build(BuildContext context) =>YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.green,
        ),
      ), builder:(context,player)=>Scaffold(backgroundColor:  constants.dark,
    appBar: AppBar(
      backgroundColor:constants.light,
      title: Text("Hanuman bhajans"),
    ),body: ListView(
      children: [
        player,
        SizedBox(height: 20,),
        Text(controller.metadata.author),
        SizedBox(height: 20,),

        ElevatedButton(onPressed: (){
          String url=u[0];
          controller.load(YoutubePlayer.convertUrlToId(url)!);
        }, child: Text("PRESS")),
        ElevatedButton(onPressed: (){
          String url=u[1];
          controller.load(YoutubePlayer.convertUrlToId(url)!);
        }, child: Text("PRESS")),
        ElevatedButton(onPressed: (){
          String url=u[2];
          controller.load(YoutubePlayer.convertUrlToId(url)!);
        }, child: Text("PRESS")),
        ElevatedButton(onPressed: (){
          String url=u[3];
          controller.load(YoutubePlayer.convertUrlToId(url)!);
        }, child: Text("PRESS")),

      ],
    ),
  )
  );
}
