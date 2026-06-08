// ============================
// SURVEY MODEL
// ============================

class Survey {
  // ============================
  // SHOP DETAILS
  // ============================

  String shopName;
  String ownerName;
  String ownerPhone;
  String alternatePhone;
  String address;

  // ============================
  // SIGNAGE DETAILS
  // ============================

  String width;
  String height;
  String signageType;

  // ============================
  // SURVEY DETAILS
  // ============================

  String notes;
  String surveyDate;

  // ============================
  // CALCULATED VALUES
  // ============================

  double area;

  // ============================
  // PHOTO
  // ============================

  String? imagePath;

  Survey({
    required this.shopName,
    required this.ownerName,
    required this.ownerPhone,
    required this.alternatePhone,
    required this.address,
    required this.width,
    required this.height,
    required this.signageType,
    required this.notes,
    required this.surveyDate,
    required this.area,
    this.imagePath,
  });
}