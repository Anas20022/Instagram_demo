import '../models/video_models.dart';

const List mePostList = [
  "https://images.pexels.com/photos/1402850/pexels-photo-1402850.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  "https://images.pexels.com/photos/3214944/pexels-photo-3214944.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  "https://images.pexels.com/photos/5738248/pexels-photo-5738248.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
  "https://images.unsplash.com/photo-1591957971546-ac76c69146d2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D",
  "https://images.unsplash.com/photo-1534531904504-65da6a62d34f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z3JhcGhpY3xlbnwwfHwwfHx8MA%3D%3D",
  "https://images.unsplash.com/photo-1611556538519-6616ee7c55b0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGdyYXBoaWN8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1590959651373-a3db0f38a961?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdyYXBoaWN8ZW58MHx8MHx8fDA%3D",
];
const List meVideoList = [
  {
    "img":
        "https://images.pexels.com/videos/5738513/pexels-photo-5738513.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "videoUrl":
        "https://player.vimeo.com/external/473757570.sd.mp4?s=8ca9d81bd97708ba9d444bdda8ee2df2541e5b9c&profile_id=139&oauth2_token_id=57447761"
  },
  {
    "img":
        "https://images.pexels.com/videos/5741343/chef-cocina-mexicana-latin-food-mexican-food-5741343.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "videoUrl":
        "https://player.vimeo.com/external/473899223.sd.mp4?s=33928d13765a8d3cac34245d7809ac1928e09389&profile_id=139&oauth2_token_id=57447761"
  },
  {
    "img":
        "https://images.pexels.com/videos/10200304/pexels-photo-10200304.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "videoUrl":
        "https://player.vimeo.com/external/644279955.sd.mp4?s=5dae61887696a35946f16b17cd1a8152f561f62f&profile_id=165&oauth_token_id=57447761"
  },
  {
    "img":
        "https://images.pexels.com/videos/5930407/pexels-photo-5930407.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "videoUrl":
        "https://player.vimeo.com/external/481280569.sd.mp4?s=3136dd79786d54883436d4f226ab93b1d3417e33&profile_id=165&oauth2_token_id=57447761"
  },
  {
    "img":
    "https://images.unsplash.com/file-1715714098234-25b8b4e9d8faimage?dpr=2&w=416&auto=format&fit=crop&q=60",
    "videoUrl":
    "https://player.vimeo.com/external/473757570.sd.mp4?s=8ca9d81bd97708ba9d444bdda8ee2df2541e5b9c&profile_id=139&oauth2_token_id=57447761"
  },
  {
    "img":
    "https://images.unsplash.com/photo-1592495981488-073153776d9a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGdyYXBoaWN8ZW58MHx8MHx8fDA%3D",
    "videoUrl":
    "https://player.vimeo.com/external/473757570.sd.mp4?s=8ca9d81bd97708ba9d444bdda8ee2df2541e5b9c&profile_id=139&oauth2_token_id=57447761"
  },
];

List<VideoModel> listVideoModels = meVideoList.map((e) => VideoModel.fromMap(e)).toList();
