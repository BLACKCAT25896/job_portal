import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' as yt_mobile;
import 'package:youtube_player_iframe/youtube_player_iframe.dart' as yt_web;
import 'package:universal_html/html.dart' as html;

class UniversalVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const UniversalVideoPlayer({super.key, required this.videoUrl});

  @override
  State<UniversalVideoPlayer> createState() => _UniversalVideoPlayerState();
}

class _UniversalVideoPlayerState extends State<UniversalVideoPlayer> {
  yt_mobile.YoutubePlayerController? _mobileYoutubeController;
  yt_web.YoutubePlayerController? _webYoutubeController;
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;

  bool _isVideoPlaying = false;
  bool _isWebEmbed = false;
  String? _embedUrl;

  final Set<String> _registeredViews = {}; // Cache for iframe view IDs

  @override
  void initState() {
    super.initState();
    _initializePlayer(widget.videoUrl);
  }

  @override
  void didUpdateWidget(covariant UniversalVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      _disposeControllers();
      _initializePlayer(widget.videoUrl);
    }
  }

  void _initializePlayer(String url) async {
    log("Initializing video for URL: $url");

    final youtubeId = extractYoutubeId(url);

    if (youtubeId != null) {
      // YouTube player for web and mobile
      if (kIsWeb) {
        _webYoutubeController = yt_web.YoutubePlayerController.fromVideoId(
          videoId: youtubeId,
          params: const yt_web.YoutubePlayerParams(
            mute: false,
            showControls: true,
            showFullscreenButton: true,
            playsInline: true,
          ),
        );
      } else {
        _mobileYoutubeController = yt_mobile.YoutubePlayerController(
          initialVideoId: youtubeId,
          flags: const yt_mobile.YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );
      }
      setState(() {});
    } else if (kIsWeb &&
        (isGoogleDriveUrl(url) || isVidCipherUrl(url) || isVimeoEmbedUrl(url))) {
      // Web embed players for Google Drive, VidCipher, Vimeo
      _isWebEmbed = true;
      _embedUrl = getEmbedUrl(url);
      _registerIframe(_embedUrl!); // Register once
      setState(() {});
    } else {
      // Native video player for other URLs (mobile and web)
      _videoController = VideoPlayerController.networkUrl(Uri.parse(url));
      await _videoController!.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
        autoPlay: false,
        looping: false,
        showControls: true,
        showOptions: false,
      );
      _videoController!.addListener(() {
        final playing = _videoController!.value.isPlaying;
        if (playing != _isVideoPlaying) {
          setState(() {
            _isVideoPlaying = playing;
          });
        }
      });
      setState(() {});
    }
  }

  void _disposeControllers() {
    _mobileYoutubeController?.dispose();
    _mobileYoutubeController = null;
    _webYoutubeController?.close();
    _webYoutubeController = null;
    _chewieController?.dispose();
    _chewieController = null;
    _videoController?.dispose();
    _videoController = null;
    _isWebEmbed = false;
    _embedUrl = null;
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && _webYoutubeController != null) {
      return yt_web.YoutubePlayerControllerProvider(
        controller: _webYoutubeController!,
        child: yt_web.YoutubePlayer(controller: _webYoutubeController!),
      );
    } else if (!kIsWeb && _mobileYoutubeController != null) {
      return yt_mobile.YoutubePlayer(controller: _mobileYoutubeController!);
    } else if (_videoController != null &&
        _videoController!.value.isInitialized &&
        _chewieController != null) {
      return Chewie(controller: _chewieController!);
    } else if (kIsWeb && _isWebEmbed && _embedUrl != null) {
      return HtmlElementView(viewType: 'iframe_${_embedUrl.hashCode}');
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  // --------------- Utility Functions -------------------

  String? extractYoutubeId(String url) {
    try {
      final uri = Uri.parse(url);
      if (uri.host.contains('youtu.be')) {
        return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
      } else if (uri.host.contains('youtube.com')) {
        return uri.queryParameters['v'];
      }
    } catch (_) {}
    return null;
  }

  bool isGoogleDriveUrl(String url) =>
      url.contains('drive.google.com') && url.contains('/file/d/');

  bool isVidCipherUrl(String url) =>
      url.contains('vdocipher.com') || url.contains('vidcipher.com');

  bool isVimeoEmbedUrl(String url) =>
      url.contains('player.vimeo.com/video/');

  String getEmbedUrl(String url) {
    if (isGoogleDriveUrl(url)) {
      final fileId = Uri.parse(url).pathSegments[2];
      return 'https://drive.google.com/file/d/$fileId/preview';
    } else if (isVidCipherUrl(url)) {
      final uri = Uri.parse(url);
      final otp = uri.queryParameters['otp'];
      final playbackInfo = uri.queryParameters['playbackInfo'];
      if (otp != null && playbackInfo != null) {
        return 'https://player.vdocipher.com/v2/?otp=$otp&playbackInfo=$playbackInfo';
      }
    } else if (isVimeoEmbedUrl(url)) {
      return url;
    }
    return url;
  }

  void _registerIframe(String url) {
    final viewId = 'iframe_${url.hashCode}';
    if (_registeredViews.contains(viewId)) return;

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewId, (int _) {
      final iframe = html.IFrameElement()
        ..src = url
        ..style.border = 'none'
        ..width = '100%'
        ..height = '100%'
        ..allow = 'autoplay; fullscreen; encrypted-media'
        ..allowFullscreen = true;
      return iframe;
    });

    _registeredViews.add(viewId);
  }
}
