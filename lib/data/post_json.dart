import '../models/post_models.dart';

const List postsList = [
  {
    "name": "Wendy Wei",
    "img":
        "https://images.pexels.com/photos/3990301/pexels-photo-3990301.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "postImg":
        "https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "time": "2 hrs ago",
    "like": "5.2k",
    "comment": "1.1k",
    "share": "231"
  },
  {
    "name": "Axel Oneill",
    "img":
        "https://images.pexels.com/photos/5096976/pexels-photo-5096976.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "postImg":
        "https://images.pexels.com/photos/884979/pexels-photo-884979.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "time": "3 hrs ago",
    "like": "1.2k",
    "comment": "4.1k",
    "share": "150"
  },
  {
    "name": "Amber Walter",
    "img":
        "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "postImg":
        "https://images.pexels.com/photos/7048338/pexels-photo-7048338.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500https://images.pexels.com/photos/7048338/pexels-photo-7048338.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "time": "6 hrs ago",
    "like": "3.4k",
    "comment": "1.7k",
    "share": "190"
  },
  {
    "name": "Anastasiya Gepp",
    "img":
        "https://images.pexels.com/photos/4456148/pexels-photo-4456148.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "postImg":
        "https://images.pexels.com/photos/2036645/pexels-photo-2036645.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "time": "18 hrs ago",
    "like": "7.8k",
    "comment": "2.8k",
    "share": "642"
  },
  {
    "name": "Axel Oneill",
    "img":
        "https://images.pexels.com/photos/5096976/pexels-photo-5096976.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "postImg":
        "https://images.pexels.com/photos/2836486/pexels-photo-2836486.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "time": "4 days ago",
    "like": "4.2k",
    "comment": "4.1k",
    "share": "150"
  },
  {
    "name": "Luna Faulkner",
    "img":
        "https://images.pexels.com/photos/1853098/pexels-photo-1853098.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    "postImg":
        "https://images.pexels.com/photos/9196117/pexels-photo-9196117.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    "time": "2 days ago",
    "like": "900",
    "comment": "300",
    "share": "50"
  },
  {
    "name": "Hala Walter ",
    "img":
    "https://images.unsplash.com/photo-1554180842-41b1dd69d588?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Z2lybHN8ZW58MHx8MHx8fDA%3D",
    "postImg":
    "https://images.unsplash.com/photo-1551024739-78e9d60c45ca?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGdpcmxzfGVufDB8fDB8fHww",
    "time": "1 days ago",
    "like": "158",
    "comment": "201",
    "share": "18"
  },
  {
    "name": "Sara Wei",
    "img":
    "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGdpcmxzfGVufDB8fDB8fHww",
    "postImg":
    "https://images.unsplash.com/photo-1600600423621-70c9f4416ae9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGdpcmxzfGVufDB8fDB8fHww",
    "time": "7 days ago",
    "like": "465",
    "comment": "124",
    "share": "10"
  },

];

List<PostModels> listPostModels = postsList.map((e) => PostModels.fromMap(e)).toList();


