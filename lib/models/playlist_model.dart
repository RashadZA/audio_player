import 'package:audio_player/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String coverUrl;
  Playlist({
    required this.title,
    required this.songs,
    required this.coverUrl,
  });

  static List<Playlist> playlist = [
    Playlist(
      title: "Heavy Metal",
      songs: Song.songs,
      coverUrl: "assets/images/I_Stand_Alone.jpg",
    ),
    Playlist(
      title: "Metal",
      songs: Song.songs,
      coverUrl: "assets/images/Voodoo.jpg",
    ),
    Playlist(
      title: "Rock",
      songs: Song.songs,
      coverUrl: "assets/images/Voodoo_Too.jpg",
    ),
  ];
}