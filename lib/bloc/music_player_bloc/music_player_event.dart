part of 'music_player_bloc.dart';

@immutable
abstract class MusicPlayerEvent {}

class PlayCurrentMusicEvent extends MusicPlayerEvent{
  int index;
  PlayCurrentMusicEvent({required this.index});
}

class StopCurrentMusicEvent extends MusicPlayerEvent{}

class PauseCurrentMusicEvent extends MusicPlayerEvent{}

class ResumeCurrentMusicEvent extends MusicPlayerEvent{}

// ignore: must_be_immutable
class ChangeCurrentSecondEvent extends MusicPlayerEvent{
  int second;
  ChangeCurrentSecondEvent({required this.second});
}

class SkipPreviousEvent extends MusicPlayerEvent{}

class SkipNextEvent extends MusicPlayerEvent{}

