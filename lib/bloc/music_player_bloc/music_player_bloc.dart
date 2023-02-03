import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:audioplayers/audioplayers.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  MusicPlayerBloc() : super(MusicPlayerState(status: MusicStatus.STOPPED,currentSecond: 0)) {
    on<PlayCurrentMusicEvent>(playMusic);
    on<StopCurrentMusicEvent>(stopMusic);
    on<PauseCurrentMusicEvent>(pauseMusic);
    on<ResumeCurrentMusicEvent>(resumeMusic);
    on<ChangeCurrentSecondEvent>(seekMusic);
    on<SkipNextEvent>(skipNext);
    on<SkipPreviousEvent>(skipPrevious);
  }

  final AudioPlayer player = AudioPlayer();




  playMusic(PlayCurrentMusicEvent event, emit) async {
    await player.setSource(state.musics[event.index]);
    state.currentSecond=0;
    await player.play(state.musics[event.index]);
  }
  stopMusic(event, emit) async {
    await player.stop();
    emit(MusicPlayerState(status: MusicStatus.STOPPED));
  }
  pauseMusic(event, emit) async {
    await player.pause();
    emit(MusicPlayerState(status: MusicStatus.PAUSED));

  }
  resumeMusic(event, emit) async {
    await player.resume();
    emit(MusicPlayerState(status: MusicStatus.PLAYING));

  }
  seekMusic(ChangeCurrentSecondEvent event, emit) async {
    await player.seek(Duration(seconds: event.second));
    emit(MusicPlayerState(status: MusicStatus.PLAYING));


  }
  skipNext(event, emit) async {
    await player.stop();
    event.index=event.index+1;
    await player.setSource(state.musics[event.index]);
    await player.play(state.musics[event.index]);

  }
  skipPrevious(event, emit) {}
}
