import 'package:flutter/material.dart';
import 'package:iqhome/src/models/media.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaCard extends StatelessWidget {
  final Media media;

  const MediaCard({Key key, @required this.media})
      : assert(media != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 2.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 5,
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: media.videoId,
                ),
                showVideoProgressIndicator: true,
                progressColors: ProgressBarColors(
                  playedColor: Theme.of(context).primaryColor,
                  handleColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  media.title,
                  style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
