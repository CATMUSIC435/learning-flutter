class HomePageModel {
  final List<SliderItem> sliders;
  final AboutSection about;

  HomePageModel({required this.sliders, required this.about});

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    final acf = json['acf'];

    return HomePageModel(
      sliders: (acf['slider_home'] as List)
          .map((e) => SliderItem.fromJson(e))
          .toList(),
      about: AboutSection.fromJson(acf),
    );
  }
}

class SliderItem {
  final String link;
  final String title;
  final String subTitle;

  SliderItem({required this.link, required this.title, required this.subTitle});

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(
      link: json['link'] ?? '',
      title: json['title'] ?? '',
      subTitle: json['sub_title'] ?? '',
    );
  }
}

class AboutSection {
  final String image;
  final String title;
  final String subTitle;

  AboutSection({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  factory AboutSection.fromJson(Map<String, dynamic> acf) {
    return AboutSection(
      image: acf['about_img'] ?? '',
      title: acf['about_title'] ?? '',
      subTitle: acf['about_title_sub'] ?? '',
    );
  }
}
