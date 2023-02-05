import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_payer/bloc/music_player_bloc/music_player_bloc.dart';
import 'package:music_payer/data/models/music_model.dart';
import 'package:music_payer/ui/single_music/single_music_page.dart';
import 'package:page_transition/page_transition.dart';
class MusicItem extends StatelessWidget {
  MusicModel musicModel;
  int index;
   MusicItem({required this.musicModel,required this.index,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.read<MusicPlayerBloc>().add(InitMusicEvent(index: index));
        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child:   SingleMusicPage(index: index,musicModel: musicModel),duration: const Duration(milliseconds: 300)));
      },
      child: Container(
        margin:const  EdgeInsets.only(bottom: 12),
        height: 60,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(musicModel.image),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:   [
                  Text(musicModel.name,style: TextStyle(fontSize: 18,color: Colors.white),),
                  Text(musicModel.author,style: TextStyle(color: Colors.white),)

                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.green,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,)),
          ],
        ),
      ),
    );
  }
}
