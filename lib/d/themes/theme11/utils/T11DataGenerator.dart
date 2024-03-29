import '../../../../const/strings.dart';
import '../model/T11Model.dart';
import 'T11Images.dart';

List<Music> generateAlbumMusic() {
  List<Music> album = [];
  album.add(Music.name(t11_ic_singer5, 'Imagine', 'John Lennon'));
  album.add(Music.name(t11_ic_singer2, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer5, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer2, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer2, 'Imagine', 'John Lennon'));
  album.add(Music.name(t11_ic_singer5, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer2, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  return album;
}

List<Music> musicList1() {
  List<Music> album = [];
  album.add(Music.name(t11_ic_singer2, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer4, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer3, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer1, 'Imagine', 'John Lennon'));
  album.add(Music.name(t11_ic_singer2, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer4, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer3, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer1, 'Imagine', 'John Lennon'));
  album.add(Music.name(t11_ic_singer2, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer4, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer3, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer1, 'Imagine', 'John Lennon'));

  return album;
}

List<Music> musicList2() {
  List<Music> album = [];
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer3, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer1, 'Imagine', 'John Lennon'));
  album.add(Music.name(t11_ic_singer2, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer4, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer3, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer1, 'Imagine', 'John Lennon'));
  album.add(Music.name(t11_ic_singer2, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer4, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer5, 'Hey Jude', 'The Beatles'));
  album.add(Music.name(t11_ic_singer3, 'Billie Jean', 'Michael Jackson'));
  album.add(Music.name(t11_ic_singer1, 'Imagine', 'John Lennon'));
  album.add(Music.name(t11_ic_singer2, 'One', 'U2'));
  album.add(Music.name(t11_ic_singer4, 'Hey Jude', 'The Beatles'));
  return album;
}

List<Music> generateWalkThroughMusic() {
  List<Music> album = [];
  album.add(Music.name(
      "${GlobalUrl}images/themes/theme11/t11_walkthrough_1.png",
      'Music is Life',
      'let\'s start listening you favourite music.'));
  album.add(Music.name(
      '${GlobalUrl}images/themes/theme11/t11_walkthrough_2.png',
      'Music Expresses',
      'let\'s start listening you favourite music.'));
  album.add(Music.name(
      '${GlobalUrl}images/themes/theme11/t11_walkthrough_3.png',
      'Music is Dream',
      'let\'s start listening you favourite music.'));
  return album;
}
