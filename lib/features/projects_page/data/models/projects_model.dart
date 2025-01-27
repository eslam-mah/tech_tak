class ProjectsModel {
  final int? id; // Primary key
  final DateTime? createdAt; // Timestamp with default value of now()
  final String? nameAr; // Arabic name (nullable)
  final String? descriptionAr; // Arabic description (nullable)
  final bool? isWeb; // Boolean to indicate web support (nullable)
  final bool? isMobile; // Boolean to indicate mobile support (nullable)
  final String? photoUrl; // URL to the ProjectsModel photo (nullable)
  final String? googlePlayLink; // Google Play store link (nullable)
  final String? appStoreLink; // App Store link (nullable)
  final String? webLink; // Website link (nullable)
  final String? nameEn; // English name (nullable)
  final String? descriptionEn; // English description (nullable)

  ProjectsModel({
    this.id,
    this.createdAt,
    this.nameAr,
    this.descriptionAr,
    this.isWeb,
    this.isMobile,
    this.photoUrl,
    this.googlePlayLink,
    this.appStoreLink,
    this.webLink,
    this.nameEn,
    this.descriptionEn,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) {
    return ProjectsModel(
      id: json['id'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      nameAr: json['name_ar'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      isWeb: json['is_web'] ?? false,
      isMobile: json['is_mobile'] ?? false,
      photoUrl: json['photo_url'] ?? '',
      googlePlayLink: json['google_play_link'] ?? '',
      appStoreLink: json['app_store_link'] ?? '',
      webLink: json['web_link'] ?? '',
      nameEn: json['name_en'] ?? '',
      descriptionEn: json['description_en'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'name_ar': nameAr,
      'description_ar': descriptionAr,
      'is_web': isWeb,
      'is_mobile': isMobile,
      'photo_url': photoUrl,
      'google_play_link': googlePlayLink,
      'app_store_link': appStoreLink,
      'web_link': webLink,
      'name_en': nameEn,
      'description_en': descriptionEn,
    };
  }
}
