import '../classes/image.dart';

class CustomImageProvider {
  static CoverImage tbilisi() {
    return const CoverImage(
        image: 'assets/images/tbilisi.jpg',
        sourceLink: 'https://unsplash.com/photos/emWzYc5XC_A',
        sourceName: 'Neil Sengupta');
  }

  static CoverImage books() {
    return const CoverImage(
        image: 'assets/images/icons/books-64.png',
        sourceLink: 'https://icons8.com/icon/g7PQktd3NDWC/books',
        sourceName: 'icons8');
  }

  static CoverImage headset() {
    return const CoverImage(
        image: 'assets/images/icons/headset-64.png',
        sourceLink: 'https://icons8.com/icon/FDWZPUYBAYzU/headset',
        sourceName: 'icons8');
  }

  static CoverImage megaphone() {
    return const CoverImage(
        image: 'assets/images/icons/megaphone-96.png',
        sourceLink: 'https://icons8.com/icon/12381/commercial',
        sourceName: 'icons8');
  }

  static CoverImage pencil() {
    return const CoverImage(
        image: 'assets/images/icons/pencil-96.png',
        sourceLink: 'https://icons8.com/icon/18709/pencil',
        sourceName: 'icons8');
  }

  static CoverImage reading() {
    return const CoverImage(
        image: 'assets/images/icons/reading-96.png',
        sourceLink: 'https://icons8.com/icon/13552/reading',
        sourceName: 'icons8');
  }
}
