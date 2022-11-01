import '../classes/characters.dart';
import '../classes/image.dart';
import 'images.dart';

class LectionProvider {
  final List<Characters> characters = [
    Characters(
        title: 'Lection 1',
        characters: ['ა', 'ბ', 'გ', 'დ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 2',
        characters: ['ე', 'ვ', 'ზ', 'თ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 3',
        characters: ['ი', 'კ', 'ლ', 'მ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 4',
        characters: ['ნ', 'ო', 'პ', 'ჟ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 5',
        characters: ['რ', 'ს', 'ტ', 'უ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 6',
        characters: ['ფ', 'ქ', 'ღ', 'ყ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 7',
        characters: ['შ', 'ჩ', 'ც'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 8',
        characters: ['ძ', 'წ', 'ჭ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Lection 9',
        characters: ['ხ', 'ჯ', 'ჰ'],
        cover: CustomImageProvider.tbilisi()),
  ];

  final List<Characters> vocabulary = [
    Characters(
        title: 'Vocabularies 1',
        characters: ['ა', 'ი', 'ლ', 'მ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 2',
        characters: ['ე', 'ო', 'ნ', 'ს'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 3',
        characters: ['უ', 'ვ', 'რ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 4',
        characters: ['თ', 'ქ', 'ფ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 5',
        characters: ['ტ', 'კ', 'პ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 6',
        characters: ['ბ', 'გ', 'დ', 'ზ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 7',
        characters: ['შ', 'ც', 'ჩ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 8',
        characters: ['ხ', 'ჯ', 'ჟ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 9',
        characters: ['ღ', 'ძ', 'ჰ'],
        cover: CustomImageProvider.tbilisi()),
    Characters(
        title: 'Vocabularies 10',
        characters: ['წ', 'ჭ', 'ყ'],
        cover: CustomImageProvider.tbilisi()),
  ];

  static CoverImage image() {
    return const CoverImage(
        image: 'assets/images/tbilisi.jpg',
        sourceLink: 'https://unsplash.com/photos/emWzYc5XC_A',
        sourceName: 'Neil Sengupta');
  }
}
