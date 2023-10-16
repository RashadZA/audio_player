class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;
  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      title: "I Stand Alone",
      description: "Godsmack",
      url: "assets/musics/I_Stand_Alone.mp3",
      coverUrl: "assets/images/I_Stand_Alone.jpg",
    ),
    Song(
      title: "Voodoo",
      description: "Godsmack",
      url: "assets/musics/Voodoo.mp3",
      coverUrl: "assets/images/Voodoo.jpg",
    ),
    Song(
      title: "Voodoo Too",
      description: "Godsmack",
      url: "assets/musics/Voodoo_Too.mp3",
      coverUrl: "assets/images/Voodoo_Too.jpg",
    ),
  ];
}
