import 'dart:math';
import 'package:collection/collection.dart';
import 'package:english_words/english_words.dart';

import '../classes/image.dart';
import '../classes/playlist.dart';
import '../extensions.dart';

class PlaylistsProvider {
  List<Playlist> get playlists => _randomPlaylists;
  Playlist get newReleases => randomPlaylist(numSongs: 10);
  Playlist get topSongs => randomPlaylist(numSongs: 10);

  static MyArtistImage image() {
    return const MyArtistImage(
        image: 'assets/images/tbilisi.jpg',
        sourceLink: 'https://unsplash.com/photos/emWzYc5XC_A',
        sourceName: 'Neil Sengupta');
  }

  Playlist? getPlaylist(String id) {
    return playlists.firstWhereOrNull((playlist) => playlist.id == id);
  }

  static Playlist randomPlaylist({int numSongs = 15}) {
    return Playlist(
      id: randomId(),
      title: generateRandomString(max(2, Random().nextInt(4))),
      description: generateRandomString(Random().nextInt(25)),
      cover: image(),
    );
  }

  static Playlist randomLengthPlaylist({int maxSongs = 15}) {
    final int songCount = Random().nextInt(maxSongs) + 1;

    return PlaylistsProvider.randomPlaylist(numSongs: songCount);
  }

  static final List<Playlist> _randomPlaylists =
      List.generate(10, (index) => randomLengthPlaylist());
}

String randomId() {
  return Random().nextInt(1000000).toString();
}

String generateRandomString(int wordCount) {
  final randomWords = generateWordPairs().take((wordCount).floor());
  return randomWords.join(' ');
}

Duration generateRandomSongLength() {
  Random rand = Random();

  int minute = rand.nextInt(5);

  int second = rand.nextInt(60);

  String secondStr = second.toString();

  if (second < 10) {
    secondStr = secondStr.padLeft(2, '0');
  }

  return '$minute : $secondStr'.toDuration();
}
