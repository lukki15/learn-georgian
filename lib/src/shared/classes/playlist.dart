import './image.dart';

class Playlist {
  final String id;
  final String title;
  final String description;
  MyArtistImage cover;

  Playlist({
    required this.id,
    required this.title,
    this.description = '',
    this.cover = const MyArtistImage(
        image: 'assets/images/record.jpeg',
        sourceName: 'Adobe Stock Images',
        sourceLink: ''),
  });
}
