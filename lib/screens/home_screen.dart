import 'package:audio_player/models/playlist_model.dart';
import 'package:audio_player/models/song_model.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlist = Playlist.playlist;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade900.withOpacity(0.8),
            Colors.deepPurple.shade100.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const DiscoverMusic(),
                const SizedBox(
                  height: 20.0,
                ),
                TrendingMusic(songs: songs,),
                const SizedBox(
                  height: 20.0,
                ),
                PlaylistView(playlist: playlist,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            child: Icon(Icons.music_note),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade900,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.deepPurple.shade100.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined),
            label: "Play",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: "Profile",
          ),
        ]);
  }
}

class DiscoverMusic extends StatelessWidget {
  const DiscoverMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Enjoy your favorite music",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextFormField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: "Search",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Colors.grey.shade400,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none)),
        ),
      ],
    );
  }
}

class TrendingMusic extends StatelessWidget {
  final List<Song> songs;
  const TrendingMusic({required this.songs, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Trending Music",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index){
                return SongCard(song: songs[index]);
              }),
        )
      ],
    );
  }
}
class PlaylistView extends StatelessWidget {
  final List<Playlist> playlist;
  const PlaylistView({required this.playlist, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: "Playlist",
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.27,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: playlist.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    PlaylistCard(playlist: playlist[index]),
                    const SizedBox(height: 10,),
                  ],
                );
              }),
        )
      ],
    );
  }
}
// class PlaylistMusic extends StatelessWidget {
//   final  List<Playlist> playlist;
//   const PlaylistMusic({super.key, required this.playlist});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.deepPurple.shade900.withOpacity(0.8),
//             Colors.deepPurple.shade100.withOpacity(0.8),
//           ],
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: const CustomAppBar(),
//         bottomNavigationBar: const CustomBottomNavigationBar(),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 const DiscoverMusic(),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 TrendingMusic(songs: songs,),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 PlaylistView(playlist: playlist,),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



