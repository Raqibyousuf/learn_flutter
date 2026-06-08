class Survey {
  String shopName;
  String width;
  String height;
  String notes;
  double area;
  String? imagePath;

  Survey({
    required this.shopName,
    required this.width,
    required this.height,
    required this.notes,
    required this.area,
    this.imagePath,
  });
}