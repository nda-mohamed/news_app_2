class ArticleModel {
  String? author;
  String? image;
  String? date;
  String? title;
  String? description;
  String? content;

  ArticleModel({
    this.author,
    this.image,
    this.date,
    this.title,
    this.description,
    this.content,
  });

  ArticleModel.fromjson(Map<String, dynamic> json) {
    author = json['author'];
    image = json['urlToImage'];
    date = json['publishedAt'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
  }

}