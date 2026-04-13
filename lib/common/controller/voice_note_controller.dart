import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class VoiceNoteController extends GetxController implements GetxService{
  final _record = AudioRecorder();
  bool isRecording = false;

  Duration recordingDuration = Duration.zero;
  Timer? _timer;
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      recordingDuration = Duration(seconds: recordingDuration.inSeconds + 1);
      update();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String? filePath;
  Future<void> startRecording() async {
    _stopTimer();
    try {
      if (await _record.hasPermission()) {
        Directory directory = await getApplicationDocumentsDirectory();
         filePath = '${directory.path}/myFile.m4a';
        await _record.start(const RecordConfig(), path: filePath!);
        isRecording = true;
        recordingDuration = Duration.zero;
        _startTimer();
        update();
      }
    } catch (e) {
      log("Error starting recording: $e");
    }
  }


  String? voiceNotePath;
  Future<void> stopRecording() async {
    try {
      voiceNotePath = await _record.stop(); // Stop recording
      isRecording = false;
      _stopTimer();
      update();
      log("Recording saved at: $voiceNotePath");
    } catch (e) {
      log("Error stopping recording: $e");
    }
  }

  String getFormattedTime() {
    final minutes = recordingDuration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = recordingDuration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Future<void> deleteRecording() async {
    try {
      if (filePath != null) {
        File file = File(filePath!);
        if (await file.exists()) {
          stopAudio();
          await file.delete();
          log('Recording deleted: $filePath');
          filePath = null;
          voiceNotePath = null;
        } else {
          log('File does not exist: $filePath');
        }
      }
    } catch (e) {
      log("Error deleting recording: $e");
    }
    update();
  }

  final AudioPlayer _audioPlayer = AudioPlayer();


  bool isPlaying = false;
  Duration? duration;
  Duration? totalDuration;
  Duration currentPosition = Duration.zero;

  Future<void> playAudio() async {
    try {
      if (filePath != null) {
        isPlaying = true;
        update();
        totalDuration = await _audioPlayer.setFilePath(filePath!);
        if (totalDuration != null) {
          log("Total Audio Duration: ${formatDuration(totalDuration!)}");
        } else {
          log("Unable to fetch audio duration");
        }
        _audioPlayer.positionStream.listen((position) {
          currentPosition = position;
          update();
          log("Current Position: ${formatDuration(position)}, Remaining: ${formatDuration(totalDuration! - position)}");
        });

        _audioPlayer.playerStateStream.listen((playerState) {
          if (playerState.processingState == ProcessingState.completed) {
            isPlaying = false;
            update();
            log('Audio playback completed');
          }
        });

        await _audioPlayer.play();
      } else {
        log("Audio file path is null");
      }
    } catch (e) {
      log("Error playing audio: $e");
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds % 60);
    return "$minutes:$seconds";
  }




  Future<void> pauseAudio() async {
    try {
      if (isPlaying) {
        await _audioPlayer.pause();
        isPlaying = false;
        update();
        log('Audio paused');
      } else {
        log('Audio is not playing');
      }
    } catch (e) {
      log("Error pausing audio: $e");
    }
  }

  Future<void> stopAudio() async {
    try {
      await _audioPlayer.stop();
      isPlaying = false;
      update();
      log('Audio stopped');
    } catch (e) {
      log("Error stopping audio: $e");
    }
  }
  Future<void> resumeAudio() async {
    try {
      if (!isPlaying) {
        await _audioPlayer.play();
        isPlaying = true;
        update();
        log('Audio resumed');
      } else {
        log('Audio is already playing');
      }
    } catch (e) {
      log("Error resuming audio: $e");
    }
  }


}