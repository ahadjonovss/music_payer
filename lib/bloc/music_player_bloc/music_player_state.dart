part of 'music_player_bloc.dart';

// ignore: must_be_immutable
class MusicPlayerState extends Equatable{
  MusicStatus? status;
  int? currentSecond;
  List musics=[
    "1.mp3",
    "2.mp3",
    "3.mp3",
    "4.mp3",
    "5.mp3",
    "6.mp3",
  ];


  MusicPlayerState({this.status,this.currentSecond});



  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    currentSecond
  ];
}

enum MusicStatus{
  STOPPED,
  PLAYING,
  PAUSED,
}

