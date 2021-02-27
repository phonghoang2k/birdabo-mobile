import 'package:birdablo_mobile/config/application.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAgoWrapper {
  static Map<String, String> _localeMap = {
    "en_us": "en_short",
    "vi_vn": "vi_short",
    "zh_cn": "zh_CN",
  };

  void init() {
    // Todo: Add more language here
    timeago.setLocaleMessages("vi_short", timeago.ViShortMessages());
    timeago.setLocaleMessages("zh_CN", timeago.ZhCnMessages());
  }

  static String formatTimeAgo(DateTime date, {String locale, DateTime clock, bool allowFromNow}) {
    return timeago.format(
      date,
      locale: _localeMap[Application.sharePreference.getString("locale")] ?? locale,
      allowFromNow: allowFromNow,
      clock: clock,
    );
  }
}
