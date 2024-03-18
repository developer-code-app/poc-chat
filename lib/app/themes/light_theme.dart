import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:poc_chat/app/app_theme.dart' as app_theme;
import 'package:poc_chat/extensions/material_color.dart';
import 'package:poc_chat/gen/assets.gen.dart';
import 'package:poc_chat/gen/colors.gen.dart';
import 'package:poc_chat/gen/fonts.gen.dart';

class LightTheme extends app_theme.AppTheme {
  LightTheme({app_theme.PageSize? pageSize})
      : super(
          typography: app_theme.Typography(
            headline1: _headline1,
            headline2: pageSize == app_theme.PageSize.small
                ? _headline2.copyWith(fontSize: 28)
                : _headline2,
            headline3: pageSize == app_theme.PageSize.small
                ? _headline3.copyWith(fontSize: 16)
                : _headline3,
            headline4: pageSize == app_theme.PageSize.small
                ? _headline4.copyWith(fontSize: 16)
                : _headline4,
            headline5: _headline5,
            subtitle1: _subtitle1,
            subtitle2: pageSize == app_theme.PageSize.small
                ? _subtitle2.copyWith(fontSize: 12)
                : _subtitle2,
            body1: _body1,
            body2: pageSize == app_theme.PageSize.small
                ? _body2.copyWith(fontSize: 12)
                : _body2,
            caption: pageSize == app_theme.PageSize.small
                ? _caption.copyWith(fontSize: 11)
                : _caption,
            buttonLabel: pageSize == app_theme.PageSize.small
                ? _buttonLabel.copyWith(fontSize: 12)
                : _buttonLabel,
            overline: _overline,
          ),
          fontColor: app_theme.FontColor(
            textHighlight: ColorName.scOrange,
            textDefault: ColorName.grey700,
            error: ColorName.error,
            placeholder1: ColorName.grey200,
            placeholder2: ColorName.grey300,
            subtitle: ColorName.grey500,
            subtitle2: ColorName.grey500,
          ),
        ) {
    componentStyle = app_theme.ComponentStyle(
      ratingBar: app_theme.RatingBarStyle(
        unratedColor: ColorName.grey200,
      ),
      editableWidget: app_theme.EditableWidgetStyle(
        removeButtonBackgroundColor: ColorName.grey100,
        removeButtonBorder: const NeumorphicBorder(
          width: 2,
          color: ColorName.scOrange,
        ),
      ),
      shimmer: app_theme.Shimmer(
        color: ColorName.grey150,
        highlightColor: ColorName.grey200,
      ),
      appBar: app_theme.AppBarStyle(
        titleStyle: typography.headline3,
        largeTitleStyle: typography.headline1,
      ),
      calendar: app_theme.CalendarStyle(
        monthLabelStyle: typography.headline4,
        dayOfTheWeekLabelStyle: typography.headline4.copyWith(
          color: fontColor.placeholder2,
        ),
        dateLabelStyle: typography.body1,
        disabledLabelStyle: typography.body2.copyWith(
          color: ColorName.grey200,
        ),
        todayDateBoxStyle: app_theme.DateBoxStyle(
          textStyle: typography.body1.copyWith(
            color: fontColor.textHighlight,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: ColorName.scOrange.withOpacity(0.15),
        ),
        todayEventDateBoxStyle: app_theme.DateBoxStyle(
          textStyle: typography.body1.copyWith(
            color: fontColor.textHighlight,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: ColorName.scOrange.withOpacity(0.15),
          borderColor: ColorName.scOrange,
        ),
        incomingEventDateBoxStyle: app_theme.DateBoxStyle(
          textStyle: typography.body1,
          backgroundColor: ColorName.grey100,
          borderColor: ColorName.scOrange,
        ),
        pastEventDateBoxStyle: app_theme.DateBoxStyle(
          textStyle: typography.body1,
          backgroundColor: ColorName.grey100,
          borderColor: ColorName.grey200,
        ),
        eventCardStyle: app_theme.EventCardStyle(
          titleStyle: typography.body1.copyWith(fontWeight: FontWeight.bold),
          subtitleStyle: typography.body1.copyWith(color: fontColor.subtitle),
        ),
      ),
      card: app_theme.CardStyle(
        backgroundColor: ColorName.grey100,
        stackBackgroundColor: ColorName.grey100,
        highlightBackgroundColor: ColorName.grey200,
        dent: app_theme.Dent(
          shadowDarkColor: ColorName.blueGrey.withOpacity(0.67),
          shadowDarkColorEmboss: ColorName.blueGrey.withOpacity(0.5),
          shadowLightColor: ColorName.white.withOpacity(0.7),
          shadowLightColorEmboss: ColorName.white.withOpacity(0.7),
          backgroundColor: ColorName.grey100,
        ),
        stackDent: app_theme.Dent(
          shadowDarkColor: ColorName.blueGrey.withOpacity(0.67),
          shadowDarkColorEmboss: ColorName.blueGrey.withOpacity(0.5),
          shadowLightColor: ColorName.white.withOpacity(0.7),
          shadowLightColorEmboss: ColorName.white.withOpacity(0.7),
          backgroundColor: ColorName.grey100,
        ),
      ),
      stackCard: app_theme.CardStyle(
        backgroundColor: ColorName.grey100,
        stackBackgroundColor: ColorName.grey100,
        highlightBackgroundColor: ColorName.grey200,
        dent: app_theme.Dent(
          shadowDarkColor: ColorName.blueGrey.withOpacity(0.67),
          shadowDarkColorEmboss: ColorName.blueGrey.withOpacity(0.5),
          shadowLightColor: ColorName.white.withOpacity(0.7),
          shadowLightColorEmboss: ColorName.white.withOpacity(0.7),
          backgroundColor: ColorName.grey100,
        ),
        stackDent: app_theme.Dent(
          shadowDarkColor: ColorName.blueGrey.withOpacity(0.67),
          shadowDarkColorEmboss: ColorName.blueGrey.withOpacity(0.5),
          shadowLightColor: ColorName.white.withOpacity(0.7),
          shadowLightColorEmboss: ColorName.white.withOpacity(0.7),
          backgroundColor: ColorName.grey100,
        ),
      ),
      dialog: app_theme.DialogStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        messageStyle: typography.caption,
        buttonLabelStyle: typography.caption.copyWith(
          color: fontColor.textHighlight,
        ),
        cancelActionSheetColor: fontColor.textDefault,
      ),
      input: app_theme.InputStyle(
        labelStyle: typography.body2.copyWith(color: fontColor.subtitle),
        textStyle: typography.body1,
        errorStyle: typography.caption.copyWith(color: fontColor.error),
        placeholderStyle: typography.body1.copyWith(
          color: fontColor.placeholder1,
        ),
        counterStyle: typography.body2.copyWith(color: fontColor.subtitle),
        backgroundColor: ColorName.grey100,
        disabledBackgroundColor: ColorName.grey150,
      ),
      separatorColor: ColorName.grey200,
      primaryButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel.copyWith(color: ColorName.white),
        iconColor: ColorName.white,
        backgroundColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
        shadowDarkColor:
            app_theme.SolidColor(ColorName.blueGrey.withOpacity(0.67)),
        shadowLightColor: app_theme.SolidColor(ColorName.white),
      ),
      secondaryButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
        shadowDarkColor:
            app_theme.SolidColor(ColorName.blueGrey.withOpacity(0.67)),
        shadowLightColor: app_theme.SolidColor(ColorName.white),
      ),
      stackButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
      ),
      sceneButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
      ),
      actionButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
        placeholderColor: ColorName.grey300,
      ),
      disableButton: app_theme.ButtonStyle(
        textStyle:
            typography.buttonLabel.copyWith(color: fontColor.placeholder1),
        iconColor: fontColor.placeholder1,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
      ),
      compactButton: app_theme.CompactButtonStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        subtitleStyle: typography.caption.copyWith(color: fontColor.subtitle),
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
      ),
      hilightCompactButton: app_theme.CompactButtonStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        subtitleStyle: typography.caption.copyWith(color: fontColor.subtitle),
        iconColor: ColorName.grey100,
        backgroundColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
      ),
      subduedCompactButton: app_theme.CompactButtonStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        subtitleStyle: typography.caption.copyWith(color: fontColor.subtitle),
        iconColor: fontColor.placeholder1,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
      ),
      disableCompactButton: app_theme.CompactButtonStyle(
        titleStyle: typography.caption.copyWith(
          color: fontColor.placeholder2,
          fontWeight: FontWeight.bold,
        ),
        subtitleStyle: typography.caption.copyWith(
          color: fontColor.placeholder1,
        ),
        iconColor: fontColor.placeholder1,
        backgroundColor: app_theme.SolidColor(ColorName.grey100),
      ),
      switchButton: app_theme.SwitchButtonStyle(
        titleStyle: app_theme.SwitchButtonTextStyleState(
          base: typography.buttonLabel,
          active: typography.buttonLabel,
          error: typography.buttonLabel,
          loading: typography.buttonLabel,
        ),
        subtitleStyle: app_theme.SwitchButtonTextStyleState(
          base: typography.caption.copyWith(color: fontColor.subtitle),
          active: typography.caption,
          error: typography.caption.copyWith(color: fontColor.error),
          loading: typography.caption.copyWith(color: fontColor.subtitle),
        ),
        iconColor: app_theme.SwitchButtonColorState(
          base: fontColor.textDefault,
          active: fontColor.textDefault,
          error: fontColor.textDefault,
          loading: fontColor.textDefault,
        ),
        backgroundColor: app_theme.SwitchButtonColorState(
          base: ColorName.grey100,
          active: ColorName.grey100,
          error: ColorName.grey100,
          loading: ColorName.grey100,
        ),
      ),
      checkbox: app_theme.CheckboxStyle(
        textStyle: typography.body1,
        checkmarkColor: ColorName.white,
        borderColor: ColorName.grey200,
        selectedColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
        backgroundColor: ColorName.grey100,
      ),
      radio: app_theme.RadioStyle(
        textStyle: typography.body1,
        checkmarkColor: ColorName.white,
        borderColor: ColorName.grey200,
        selectedColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
        backgroundColor: ColorName.grey100,
      ),
      toggle: app_theme.ToggleStyle(
        textStyle: typography.subtitle1,
        selectedColor: ColorName.scOrange,
        unselectedColor: ColorName.white,
      ),
      avatar: app_theme.Avatar(
        backgroundColor: ColorName.grey200,
        borderColor: ColorName.grey300,
      ),
      stepper: app_theme.Stepper(
        titleStyle: app_theme.StepperTextStyleState(
          pass: typography.headline4.copyWith(color: fontColor.textHighlight),
          current:
              typography.headline4.copyWith(color: fontColor.textHighlight),
          incoming: typography.headline4.copyWith(color: ColorName.grey400),
        ),
        orderLabelStyle: app_theme.StepperTextStyleState(
          pass: typography.headline4.copyWith(color: ColorName.white),
          current:
              typography.headline4.copyWith(color: fontColor.textHighlight),
          incoming: typography.headline4.copyWith(color: ColorName.grey400),
        ),
        borderColor: app_theme.StepperColorState(
          pass: ColorName.scOrange,
          current: ColorName.scOrange,
          incoming: ColorName.grey200,
          base: ColorName.grey100,
        ),
        backgroundColor: app_theme.StepperColorState(
          pass: ColorName.scOrange,
          current: ColorName.grey100,
          incoming: ColorName.grey200,
          base: ColorName.grey100,
        ),
        activeLineColor: ColorName.scOrange,
        inactiveLineColor: ColorName.grey200,
      ),
      tabBar: app_theme.TabBar(
        indicatorColor: ColorName.grey900,
        subtitleStyle: typography.overline.copyWith(
          color: fontColor.placeholder2,
        ),
      ),
      bottomNavigationBar: app_theme.BottomNavigationBar(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorName.grey300,
              blurRadius: 8,
            ),
          ],
        ),
      ),
      placeholderBackgroundColor: ColorName.grey200,
      couponCodeBackgroundColor: ColorName.grey150,
    );
    neumorphic = NeumorphicThemeData(
      baseColor: ColorName.grey100,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
      iconTheme: IconThemeData(color: fontColor.textDefault),
      intensity: 1,
      shadowDarkColor: ColorName.blueGrey.withOpacity(0.67),
      shadowDarkColorEmboss: ColorName.blueGrey.withOpacity(0.5),
      shadowLightColorEmboss: ColorName.white.withOpacity(0.7),
      textTheme: TextTheme(
        displayLarge: typography.headline1,
        displayMedium: typography.headline2,
        displaySmall: typography.headline3,
        headlineMedium: typography.headline4,
        headlineSmall: typography.headline5,
        titleMedium: typography.subtitle1,
        titleSmall: typography.subtitle2,
        bodyLarge: typography.body1,
        bodyMedium: typography.body2,
        bodySmall: typography.caption,
        labelLarge: typography.buttonLabel,
        labelSmall: typography.overline,
      ),
    );
    material = ThemeData(
      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorName.grey100,
        actionTextColor: fontColor.textHighlight,
        contentTextStyle: typography.body2,
      ),
      scaffoldBackgroundColor: ColorName.grey100,
      dialogBackgroundColor: ColorName.grey100,
      fontFamily: _defaultFontFamily,
      tabBarTheme: TabBarTheme(
        labelColor: fontColor.textDefault,
        labelStyle: typography.buttonLabel,
        unselectedLabelStyle: typography.buttonLabel,
        unselectedLabelColor: fontColor.placeholder2,
      ),
      appBarTheme: AppBarTheme(
        elevation: 12,
        backgroundColor: ColorName.grey100,
        shadowColor: ColorName.blueGrey.withOpacity(0.67),
        centerTitle: false,
        titleSpacing: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: fontColor.textDefault),
        titleTextStyle: typography.headline4,
        toolbarTextStyle: typography.body1,
      ),
      iconTheme: IconThemeData(color: fontColor.textDefault),
      primarySwatch: createMaterialColor(ColorName.scOrange),
      primaryColor: ColorName.scOrange,
      colorScheme: const ColorScheme.light(
        primary: ColorName.scOrange,
        secondary: ColorName.scOrange,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: typography.body1.copyWith(fontSize: 18),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorName.grey100,
        selectedItemColor: fontColor.textHighlight,
        unselectedItemColor: fontColor.textDefault,
        selectedLabelStyle: typography.overline,
        unselectedLabelStyle: typography.overline,
        type: BottomNavigationBarType.fixed,
      ),
      dividerColor: componentStyle.separatorColor,
      unselectedWidgetColor: ColorName.grey700,
    );
    imagePickerTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorName.grey100,
      colorScheme: const ColorScheme.light(
        primary: ColorName.grey100,
        secondary: ColorName.scOrange,
      ),
      shadowColor: Colors.transparent,
      fontFamily: _defaultFontFamily,
    );
    mode = ThemeMode.light;
    ruejaiLogo = Assets.icons.logoDark;
    wallpaper = null;
    isDarkTheme = false;
  }

  @override
  app_theme.AppTheme theme(app_theme.PageSize pageSize) =>
      LightTheme(pageSize: pageSize);

  static const String _defaultFontFamily = FontFamily.sukhumvitTadmai;
  static const TextStyle _headline1 = TextStyle(
    color: ColorName.grey700,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
  );
  static const TextStyle _headline2 = TextStyle(
    color: ColorName.grey700,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _headline3 = TextStyle(
    color: ColorName.grey700,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _headline4 = TextStyle(
    color: ColorName.grey700,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _headline5 = TextStyle(
    color: ColorName.grey700,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _subtitle1 = TextStyle(
    color: ColorName.grey700,
    fontSize: 18,
    fontFamily: _defaultFontFamily,
  );
  static const TextStyle _subtitle2 = TextStyle(
    color: ColorName.grey700,
    fontSize: 16,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
  static const TextStyle _body1 = TextStyle(
    color: ColorName.grey700,
    fontSize: 16,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _body2 = TextStyle(
    color: ColorName.grey700,
    fontSize: 14,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _caption = TextStyle(
    color: ColorName.grey700,
    fontSize: 13,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
  static const TextStyle _buttonLabel = TextStyle(
    color: ColorName.grey700,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
  static const TextStyle _overline = TextStyle(
    color: ColorName.grey700,
    fontSize: 11,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
}
