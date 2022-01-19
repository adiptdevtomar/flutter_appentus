// Created by Adipt on 18/01/2022

class GridImages {
  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  GridImages({
    required this.height,
    required this.width,
    required this.author,
    required this.url,
    required this.id,
    required this.downloadUrl,
  });

  factory GridImages.fromJson(dynamic obj) => GridImages(
    width: obj['width'],
    height: obj['height'],
    author: obj['author'],
    url: obj['url'],
    id: obj['id'],
    downloadUrl: obj['download_url'],
  );
}
