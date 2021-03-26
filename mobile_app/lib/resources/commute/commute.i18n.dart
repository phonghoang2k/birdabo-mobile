import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, _t);
  static var _t = Translations.byLocale("en_us") +
      {
        "vi_vn": {
          "Find place": "Tìm địa điểm, tên sân",
          "Discount": "Khuyến mại",
          "Favorite": "Yêu thích",
          "Nearest": "Gần nhất",
          "Weekend": "Cuối tuần",
          "Suggestion": "Đề xuất dành cho bạn",
          "Member price": "Giá thành viên",
        }
      };
}
