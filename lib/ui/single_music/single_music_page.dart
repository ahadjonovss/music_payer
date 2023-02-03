import 'package:flutter/material.dart';

class SingleMusicPage extends StatefulWidget {
   SingleMusicPage({Key? key}) : super(key: key);

  @override
  State<SingleMusicPage> createState() => _SingleMusicPageState();
}

class _SingleMusicPageState extends State<SingleMusicPage> {
  int currentValue=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Liked Music",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);

        },icon: const Icon(Icons.arrow_downward_sharp,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:  NetworkImage("https://avatars.mds.yandex.net/i?id=89e8bb990974a1d4a42be9e5a899714b8bcc3f73-5210406-images-thumbs&n=13"),
                  fit: BoxFit.fitHeight

                )
              ),
            ),
            const SizedBox(height: 42,),
            const Text("Happier Than Others",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
            const SizedBox(height: 8,),
            const Text("Billie Eilish",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 20),),
            const SizedBox(height: 32,),
            Slider(
              inactiveColor: Colors.grey,
              activeColor: Colors.white,
              max: 100,
              value: currentValue.toDouble(),
              onChanged: (value) {
              setState(() {
                currentValue = value.toInt();
              });
            },),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.shuffle,color: Colors.white,)),
                IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous,size: 40,color: Colors.white,)),
                IconButton(onPressed: () {}, icon: Icon(Icons.play_circle,size: 40,color: Colors.white,)),
                IconButton(onPressed: () {}, icon: Icon(Icons.skip_next,size:40,color: Colors.white,)),
                IconButton(onPressed: () {}, icon: Icon(Icons.repeat,color: Colors.white,)),
              ],
            )


          ],
        ),
      ),
    );
  }
}
