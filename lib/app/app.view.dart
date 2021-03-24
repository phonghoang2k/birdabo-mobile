import 'package:birdablo_mobile/config/application.dart';
import 'package:birdablo_mobile/config/locale.dart';
import 'package:birdablo_mobile/utils/api.dart';
import 'package:birdablo_mobile/utils/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:i18n_extension/i18n_widget.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    Application.api = API();
    Application.toast = Toastify();
    Application.sharePreference.putString('locale', "en_us");
  }

  @override
  Widget build(BuildContext context) {
    return I18n(
        initialLocale: AppLocale.locales[Application.sharePreference.getString('locale')],
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
          supportedLocales: AppLocale.locales.values.toList(),
          builder: (context, child) => MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          ),
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            canvasColor: Colors.white,
            fontFamily: "SF-Pro",
          ),
          navigatorKey: Modular.navigatorKey,
          onGenerateRoute: Modular.generateRoute,
          debugShowCheckedModeBanner: false,
        ));
  }
}
