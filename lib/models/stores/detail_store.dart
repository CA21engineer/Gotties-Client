import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DetailStore with ChangeNotifier, WidgetsBindingObserver {
  DetailStore() {
    WidgetsBinding.instance.addObserver(this);
    _startBeforeAfter();
  }

  bool isPlaying = false;
  double playPositionRate = 0;
  final AudioPlayer _player = AudioPlayer();

  void _startBeforeAfter() {
    int musicLength = 0;
    AudioCache(fixedPlayer: _player, prefix: 'audio/').loop('takumi_short.mp3');
    isPlaying = true;
    notifyListeners();

    _player.onDurationChanged.listen((duration) {
      musicLength = duration.inMilliseconds;
    });

    _player.onAudioPositionChanged.listen((duration) {
      if (musicLength != 0) {
        playPositionRate = duration.inMilliseconds / musicLength ?? 0.0;
      }
      notifyListeners();
    });
  }

  void pauseRestartBeforeAfter() {
    isPlaying ? _player.pause() : _player.resume();
    isPlaying = !isPlaying;
    notifyListeners();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.pause();
      isPlaying = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _player
      ..stop()
      ..dispose();
    isPlaying = false;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
