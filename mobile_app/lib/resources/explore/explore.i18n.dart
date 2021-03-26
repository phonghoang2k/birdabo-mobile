import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  String get i18n => localize(this, _t);
  static var _t = Translations.byLocale("en_us") +
      {
        "vi_vn": {
          "Search Friend": "Tìm bạn",
          "comment": "bình luận",
          "like": "thích",
          "confirm": "xác nhận",
          "incorrect": "báo sai",
          "Like": "Thích",
          "Comment": "Bình luận",
          "Share": "Chia sẻ",
        }
      };
}
