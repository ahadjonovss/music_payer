part of 'music_player_bloc.dart';

// ignore: must_be_immutable
class MusicPlayerState extends Equatable {
  MusicStatus? status;
  Duration? currentSecond;
  Duration? maxDuration;
  int? currentMusic;
  List<MusicModel> musics = [
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
  ];

  MusicPlayerState(
      {this.status, this.currentSecond, this.maxDuration, this.currentMusic,required this.musics});

  copyWith(
      {Duration? maxDuration,
      Duration? currentSecond,
      MusicStatus? status,
      int? currentMusic,
      List<MusicModel>? musics}) {
    return MusicPlayerState(
      musics: musics??this.musics,
        currentSecond: currentSecond ?? this.currentSecond,
        status: status ?? this.status,
        maxDuration: maxDuration ?? this.maxDuration,
        currentMusic: currentMusic ?? this.currentMusic);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, currentSecond, musics, maxDuration];
}

enum MusicStatus {
  STOPPED,
  PLAYING,
  PAUSED,
}
