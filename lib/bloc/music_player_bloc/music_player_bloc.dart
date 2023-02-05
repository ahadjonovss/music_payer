import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_payer/data/models/music_model.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  MusicPlayerBloc() : super(MusicPlayerState(
      status: MusicStatus.STOPPED,
      currentMusic: 0,
      currentSecond:const Duration(seconds: 0),
      maxDuration: const Duration(seconds: 0),
    musics: [
      MusicModel(
          image:
          "https://avatars.mds.yandex.net/i?id=47a4ba32f607581d5e61674a53a6b69b202574d2-8438571-images-thumbs&n=13",
          name: "Любовь как спецэффект",
          path: "1.mp3",
          author: "Мот"),
      MusicModel(
          image:
          "https://avatars.mds.yandex.net/i?id=e7cf8151c7a112aa2dcea79c2718ff6c0e8298c5-7547218-images-thumbs&n=13",
          name: "По Буквам",
          path: "3.mp3",
          author: "Мот"),
      MusicModel(
          image:
          "https://avatars.mds.yandex.net/i?id=809845f76f9ca9c8944e234f97aa393d-5220538-images-thumbs&n=13",
          name: "Ertasi yo'q",
          path: "2.mp3",
          author: "Konsta & Shokir"),
      MusicModel(
          image:
          "https://avatars.mds.yandex.net/i?id=7b2fc6f947958aa2f3718f8c24e2d7676d9e8e3c-5886829-images-thumbs&n=13",
          name: "No lie",
          path: "4.mp3",
          author: "Sean Paul"),
      MusicModel(
          image:
          "https://avatars.mds.yandex.net/i?id=5adcf02127f221b6d5459ec67c48ae86-5148463-images-thumbs&n=13",
          name: "No queda na",
          path: "5.mp3",
          author: "Nothing"),
      MusicModel(
          image:
          "https://sun6-20.userapi.com/s/v1/if1/JbImTA_NrJ4635RPPuptd9IDoIyN0EMo3DdxGIp4pK5R7KK-W_-4lRB7IoGU1PqsvTdtclx-.jpg?size=1000x1000&quality=96&crop=250,0,1000,1000&ava=1",
          name: "Dam",
          path: "6.mp3",
          author: "Konsta & Abbbose"),
    ]
  )) {
    on<PlayCurrentMusicEvent>(playMusic);
    on<PauseCurrentMusicEvent>(pauseMusic);
    on<ResumeCurrentMusicEvent>(resumeMusic);
    on<ChangeCurrentSecondEvent>(seekMusic);
    on<SkipMusicEvent>(skipMusic);
    on<IndicatiorEvent>(indicator);
    on<InitMusicEvent>(initMusic);
  }

  final AudioPlayer player = AudioPlayer();


  initMusic(InitMusicEvent event, emit) async {
    await player.setSource(AssetSource(state.musics[event.index].path));
    Duration? maxDuration = await player.getDuration();
    emit(state.copyWith(currentMusic: event.index,maxDuration: maxDuration,currentSecond: const Duration(seconds: 0),musics: state.musics));
  }




  playMusic(PlayCurrentMusicEvent event, emit) async {
    await player.play(AssetSource(state.musics[event.index].path),position: state.currentSecond);
    player.onPositionChanged.listen((event) {
      add(IndicatiorEvent(currentSecond: event.inSeconds));
    });
    add(InitMusicEvent(index: event.index));
    emit(state.copyWith(status: MusicStatus.PLAYING,musics: state.musics..[event.index].isPlaying=true,currentMusic: event.index));
  }

  indicator(IndicatiorEvent event, emit){
    emit(state.copyWith(status: MusicStatus.PLAYING,currentSecond: Duration(seconds: event.currentSecond)));
  }

  pauseMusic(PauseCurrentMusicEvent event, emit) async {
    await player.pause();
    emit(state.copyWith(status: MusicStatus.PAUSED,musics: state.musics..[event.index].isPlaying=false..[event.index].isPaused=true));
  }

  resumeMusic(ResumeCurrentMusicEvent event, emit) async {
    await player.resume();
    player.onPositionChanged.listen((event) {
      add(IndicatiorEvent(currentSecond: event.inSeconds));
    });
    emit(state.copyWith(status: MusicStatus.PAUSED,musics: state.musics..[event.index].isPlaying=true..[event.index].isPaused=false));


  }
  seekMusic(ChangeCurrentSecondEvent event, emit) async {
    await player.seek(Duration(seconds: event.second));
    emit(state.copyWith(currentSecond: Duration(seconds: event.second)));
  }
  skipMusic(SkipMusicEvent event, emit) async {
    await player.stop();
    add(PlayCurrentMusicEvent(index: event.index));

  }
}
