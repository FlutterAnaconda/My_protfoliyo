class ProductModel {
  String? title;
  String? image;
  String? subtitle;
  int? price;
  int? rating;
  String? location;
  bool isfav;

  ProductModel(
      {this.title,
      this.image,
      this.price,
      this.rating,
      this.location,
      this.subtitle,
      this.isfav = false});
}
