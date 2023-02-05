import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_payer/bloc/music_player_bloc/music_player_bloc.dart';
import 'package:music_payer/data/models/music_model.dart';
import 'package:music_payer/ui/play_list/widgets/music_item.dart';

class PlayListPage extends StatelessWidget {
   PlayListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Play List"),),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return MusicItem(musicModel:context.read<MusicPlayerBloc>().state.musics[index],index:index);
            },
            itemCount: context.read<MusicPlayerBloc>().state.musics.length,
        ),
      ),
    );
  }
}
