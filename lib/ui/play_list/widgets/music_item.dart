import 'package:flutter/material.dart';

class MusicItem extends StatelessWidget {
  const MusicItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.only(bottom: 12),
      height: 60,
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network("https://avatars.mds.yandex.net/i?id=89e8bb990974a1d4a42be9e5a899714b8bcc3f73-5210406-images-thumbs&n=13"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const  [
              Text("Happier Than Ever",style: TextStyle(fontSize: 18,color: Colors.white),),
              Text("Billie Eilish - Happier Than Ever",style: TextStyle(color: Colors.white),)

            ],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.green,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,)),
        ],
      ),
    );
  }
}