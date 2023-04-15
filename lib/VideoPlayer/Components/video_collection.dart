List<Map<String, dynamic>> videoList = [
  {
    "description":
        '''Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org''',
    "sources":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "subtitle": "By Blender Foundation",
    "thumb":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKzbusumeuVTeqQ6FEUKZESL5_hEMDxKfcAw",
    "title": "Big Buck Bunny"
  },
  {
    "description": "The first Blender Open Movie from 2006",
    "sources":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "subtitle": "By Blender Foundation",
    "thumb":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCU6HABm9eoHZTs7CYPF2nQiPROX1dMD4NVw",
    "title": "Elephant Dream"
  },
  {
    "description":
        "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For \$35.\nLearn how to use Chromecast with HBO GO and more at google.com/chromecast.",
    "sources":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "subtitle": "By Google",
    "thumb":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAjraJj0yyvMeQGXXdjIwLYEyrI5ZmRdzFGA",
    "title": "For Bigger Blazes"
  },
  {
    "description":
        "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman's escapes aren't quite big enough. For \$35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.",
    "sources":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "subtitle": "By Google",
    "thumb":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf_Jx56ffz9VB8LrISjOkJyp-pFW1u6fxE4w",
    "title": "For Bigger Escape"
  },
  {
    "description":
        '''Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For \$35.  Find out more at google.com/chromecast.''',
    "sources":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "subtitle": "By Google",
    "thumb":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRfN5H48NqeEABGglBz3YAX6KJtx8yn_e20w",
    "title": "For Bigger Fun"
  },
  {
    "description":
        "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film.\nThis 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.\nwww.sintel.org",
    "sources":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    "subtitle": "By Blender Foundation",
    "thumb":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-aBwcTRl0V8psJHakXrjMoyvPSt0gx07iiQ",
    "title": "Sintel"
  },
  {
    "description":
        "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands.  The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras.  (CC) Blender Foundation - http://www.tearsofsteel.org",
    "sources":
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    "subtitle": "By Blender Foundation",
    "thumb":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNMjH16AuLnGzNdhAvN7-wBN9BIhBigz6Dnw",
    "title": "Tears of Steel"
  },
];

class VideoInfo {
  String description;
  String sources;
  String subtitle;
  String thumb;
  String title;

  VideoInfo({
    required this.description,
    required this.sources,
    required this.subtitle,
    required this.thumb,
    required this.title,
  });

  factory VideoInfo.fromJson(Map<String, dynamic> json) => VideoInfo(
        description: json['description'],
        sources: json['sources'],
        subtitle: json['subtitle'],
        thumb: json['thumb'],
        title: json['title'],
      );
}

List<VideoInfo> videoCollection = List.from(
  videoList.map(
    (e) => VideoInfo.fromJson(e),
  ),
);
