import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_payer/bloc/music_player_bloc/music_player_bloc.dart';
import 'package:music_payer/data/models/music_model.dart';

class SingleMusicPage extends StatefulWidget {
  int index;
  MusicModel musicModel;
   SingleMusicPage({required this.musicModel,required this.index,Key? key}) : super(key: key);

  @override
  State<SingleMusicPage> createState() => _SingleMusicPageState();
}

class _SingleMusicPageState extends State<SingleMusicPage> {
  int currentValue=0;
  bool isPlaying = false;
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicPlayerBloc,MusicPlayerState>(
     builder: (context, state) {
       int currentMusic = context.read<MusicPlayerBloc>().state.currentMusic!;
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
                 decoration:  BoxDecoration(
                     image: DecorationImage(
                         image:  NetworkImage(state.musics[currentMusic].image),
                         fit: BoxFit.fitHeight

                     )
                 ),
               ),
               const SizedBox(height: 42,),
               Text(state.musics[currentMusic].name,style: const  TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
               const SizedBox(height: 8,),
               Text(state.musics[currentMusic].author,style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 20),),
               const SizedBox(height: 32,),
               Slider(
                 inactiveColor: Colors.grey,
                 activeColor: Colors.white,
                 max:context.read<MusicPlayerBloc>().state.maxDuration!.inSeconds.toDouble(),
                 value: context.read<MusicPlayerBloc>().state.currentSecond!.inSeconds.toDouble(),
                 onChangeStart: (value) {
                   context.read<MusicPlayerBloc>().add(ChangeCurrentSecondEvent(second: value.toInt()));
                 },
                 onChangeEnd: (value) {
                   context.read<MusicPlayerBloc>().add(ChangeCurrentSecondEvent(second: value.toInt()));
                 },
                 onChanged: (value) {

                 },
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("${state.currentSecond!.inMinutes}:${state.currentSecond!.inSeconds%60}",style: const TextStyle(color: Colors.white),),
                   Text("${state.maxDuration!.inMinutes}:${state.maxDuration!.inSeconds%60}",style: const TextStyle(color: Colors.white),),
                 ],
               ),
               const SizedBox(height: 32,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   IconButton(onPressed: () {}, icon: const Icon(Icons.shuffle,color: Colors.white,)),
                   IconButton(onPressed: () {
                       context.read<MusicPlayerBloc>().state.currentSecond=const Duration(seconds: 0);
                       context.read<MusicPlayerBloc>().add(SkipMusicEvent(index: (currentMusic-1)%state.musics.length));
                   }, icon: const Icon(Icons.skip_previous,size: 40,color: Colors.white,)),
                   IconButton(onPressed: () {
                     if(state.musics[currentMusic].isPaused){
                       context.read<MusicPlayerBloc>().add(ResumeCurrentMusicEvent(index: currentMusic));
                     }else if(state.musics[currentMusic].isPlaying){
                       context.read<MusicPlayerBloc>().add(PauseCurrentMusicEvent(index:currentMusic));
                     }else{
                       context.read<MusicPlayerBloc>().add(PlayCurrentMusicEvent(index:currentMusic));
                     }
                   }, icon: Icon(state.musics[currentMusic].isPlaying?Icons.pause_circle:Icons.play_circle,size: 40,color: Colors.white,)),
                   IconButton(onPressed: () {
                       context.read<MusicPlayerBloc>().state.currentSecond= const Duration(seconds: 0);
                       context.read<MusicPlayerBloc>().add(SkipMusicEvent(index: (currentMusic+1)%state.musics.length));
                   }, icon: const  Icon(Icons.skip_next,size:40,color: Colors.white,)),
                   IconButton(onPressed: () {}, icon: const Icon(Icons.repeat,color: Colors.white,)),
                 ],
               )
             ],
           ),
         ),
       );
     },
    );
  }
}
