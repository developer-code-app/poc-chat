import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:poc_chat/extensions/material_color.dart';
import 'package:poc_chat/gen/assets.gen.dart';
import 'package:poc_chat/gen/colors.gen.dart';
import 'package:poc_chat/app/app_theme.dart' as app_theme;
import 'package:poc_chat/gen/fonts.gen.dart';

class DarkTheme extends app_theme.AppTheme {
  DarkTheme({app_theme.PageSize? pageSize})
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
            textDefault: ColorName.grey100,
            error: ColorName.error,
            placeholder1: ColorName.grey600,
            placeholder2: ColorName.grey650,
            subtitle: ColorName.grey400,
            subtitle2: ColorName.grey200,
          ),
        ) {
    componentStyle = app_theme.ComponentStyle(
      ratingBar: app_theme.RatingBarStyle(
        unratedColor: ColorName.grey600,
      ),
      editableWidget: app_theme.EditableWidgetStyle(
        removeButtonBackgroundColor: ColorName.grey600,
        removeButtonBorder: const NeumorphicBorder.none(),
      ),
      shimmer: app_theme.Shimmer(
        color: ColorName.grey600,
        highlightColor: ColorName.grey650,
      ),
      appBar: app_theme.AppBarStyle(
        titleStyle: typography.headline3,
        largeTitleStyle: typography.headline1,
      ),
      calendar: app_theme.CalendarStyle(
        monthLabelStyle: typography.headline4,
        dayOfTheWeekLabelStyle: typography.headline4.copyWith(
          color: fontColor.subtitle,
        ),
        dateLabelStyle: typography.body1,
        disabledLabelStyle: typography.body2.copyWith(
          color: ColorName.grey500,
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
          backgroundColor: ColorName.grey800,
          borderColor: ColorName.scOrange,
        ),
        pastEventDateBoxStyle: app_theme.DateBoxStyle(
          textStyle: typography.body1,
          backgroundColor: ColorName.grey800,
          borderColor: ColorName.grey600,
        ),
        eventCardStyle: app_theme.EventCardStyle(
          titleStyle: typography.body1.copyWith(fontWeight: FontWeight.bold),
          subtitleStyle: typography.body1.copyWith(color: fontColor.subtitle),
        ),
      ),
      card: app_theme.CardStyle(
        backgroundColor: ColorName.grey700,
        stackBackgroundColor: ColorName.grey700,
        highlightBackgroundColor: ColorName.grey600,
        dent: app_theme.Dent(
          shadowDarkColor: ColorName.grey1000,
          shadowDarkColorEmboss: ColorName.grey1000,
          shadowLightColor: ColorName.grey800,
          shadowLightColorEmboss: ColorName.grey800,
          backgroundColor: ColorName.grey900,
        ),
        stackDent: app_theme.Dent(
          shadowDarkColor: ColorName.grey800,
          shadowDarkColorEmboss: ColorName.grey800,
          shadowLightColor: ColorName.grey650,
          shadowLightColorEmboss: ColorName.grey650,
          backgroundColor: ColorName.grey700,
        ),
      ),
      stackCard: app_theme.CardStyle(
        backgroundColor: ColorName.grey650,
        stackBackgroundColor: ColorName.grey650,
        highlightBackgroundColor: ColorName.grey600,
        // TODO(pattarapon): dent and stack dent is not definite
        dent: app_theme.Dent(
          shadowDarkColor: ColorName.grey1000,
          shadowDarkColorEmboss: ColorName.grey1000,
          shadowLightColor: ColorName.grey800,
          shadowLightColorEmboss: ColorName.grey800,
          backgroundColor: ColorName.grey900,
        ),
        stackDent: app_theme.Dent(
          shadowDarkColor: ColorName.grey800,
          shadowDarkColorEmboss: ColorName.grey800,
          shadowLightColor: ColorName.grey650,
          shadowLightColorEmboss: ColorName.grey650,
          backgroundColor: ColorName.grey700,
        ),
      ),
      dialog: app_theme.DialogStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        messageStyle: typography.caption,
        buttonLabelStyle: typography.buttonLabel.copyWith(
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
        backgroundColor: ColorName.grey650,
        disabledBackgroundColor: ColorName.grey800,
      ),
      separatorColor: ColorName.grey600,
      primaryButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
      ),
      secondaryButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey700),
      ),
      stackButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey650),
      ),
      sceneButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey700),
      ),
      actionButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel,
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey700),
        placeholderColor: ColorName.grey650,
      ),
      disableButton: app_theme.ButtonStyle(
        textStyle: typography.buttonLabel.copyWith(
          color: fontColor.placeholder1,
        ),
        iconColor: fontColor.placeholder1,
        backgroundColor: app_theme.SolidColor(ColorName.grey700),
      ),
      compactButton: app_theme.CompactButtonStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        subtitleStyle: typography.caption.copyWith(color: fontColor.subtitle),
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.SolidColor(ColorName.grey700),
      ),
      hilightCompactButton: app_theme.CompactButtonStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        subtitleStyle: typography.caption.copyWith(color: fontColor.subtitle),
        iconColor: fontColor.textDefault,
        backgroundColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
      ),
      subduedCompactButton: app_theme.CompactButtonStyle(
        titleStyle: typography.caption.copyWith(fontWeight: FontWeight.bold),
        subtitleStyle: typography.caption.copyWith(color: fontColor.subtitle),
        iconColor: fontColor.placeholder1,
        backgroundColor: app_theme.SolidColor(ColorName.grey700),
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
        backgroundColor: app_theme.SolidColor(ColorName.grey700),
      ),
      switchButton: app_theme.SwitchButtonStyle(
        titleStyle: app_theme.SwitchButtonTextStyleState(
          base: typography.buttonLabel,
          active: typography.buttonLabel,
          error: typography.buttonLabel.copyWith(color: fontColor.placeholder1),
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
          error: fontColor.placeholder1,
          loading: fontColor.textDefault,
        ),
        backgroundColor: app_theme.SwitchButtonColorState(
          base: ColorName.grey700,
          active: ColorName.grey900,
          error: ColorName.grey700,
          loading: ColorName.grey700,
        ),
      ),
      checkbox: app_theme.CheckboxStyle(
        textStyle: typography.body1,
        checkmarkColor: ColorName.white,
        borderColor: ColorName.grey650,
        selectedColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
        backgroundColor: ColorName.grey800,
      ),
      radio: app_theme.RadioStyle(
        textStyle: typography.body1,
        checkmarkColor: ColorName.white,
        borderColor: ColorName.grey650,
        selectedColor: app_theme.GradientColor([
          ColorName.scOrange,
          ColorName.deepOrange,
        ]),
        backgroundColor: ColorName.grey800,
      ),
      toggle: app_theme.ToggleStyle(
        textStyle: typography.subtitle1,
        selectedColor: ColorName.scOrange,
        unselectedColor: ColorName.white,
      ),
      avatar: app_theme.Avatar(
        backgroundColor: ColorName.white,
        borderColor: ColorName.white,
      ),
      stepper: app_theme.Stepper(
        titleStyle: app_theme.StepperTextStyleState(
          pass: typography.headline4.copyWith(color: fontColor.textHighlight),
          current: typography.headline4.copyWith(
            color: fontColor.textHighlight,
          ),
          incoming: typography.headline4.copyWith(
            color: fontColor.placeholder1,
          ),
        ),
        orderLabelStyle: app_theme.StepperTextStyleState(
          pass: typography.headline4.copyWith(color: fontColor.textDefault),
          current: typography.headline4.copyWith(
            color: fontColor.textHighlight,
          ),
          incoming: typography.headline4.copyWith(
            color: fontColor.placeholder1,
          ),
        ),
        borderColor: app_theme.StepperColorState(
          pass: ColorName.scOrange,
          current: ColorName.scOrange,
          incoming: ColorName.grey400,
          base: ColorName.grey900,
        ),
        backgroundColor: app_theme.StepperColorState(
          pass: ColorName.scOrange,
          current: ColorName.grey900,
          incoming: ColorName.grey400,
          base: ColorName.grey700,
        ),
        activeLineColor: ColorName.scOrange,
        inactiveLineColor: ColorName.grey400,
      ),
      tabBar: app_theme.TabBar(
        indicatorColor: ColorName.grey100,
        subtitleStyle: typography.overline.copyWith(
          color: fontColor.subtitle,
        ),
      ),
      bottomNavigationBar: app_theme.BottomNavigationBar(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ColorName.grey700,
              width: 2,
            ),
          ),
        ),
      ),
      placeholderBackgroundColor: ColorName.grey700,
      couponCodeBackgroundColor: ColorName.grey600,
    );
    neumorphic = NeumorphicThemeData(
      baseColor: ColorName.grey900,
      disableDepth: true,
      boxShape: NeumorphicBoxShape.roundRect(
        BorderRadius.circular(16),
      ),
      iconTheme: IconThemeData(color: fontColor.textDefault),
      intensity: 1,
      shadowDarkColor: ColorName.grey1000,
      shadowDarkColorEmboss: ColorName.grey1000,
      shadowLightColor: ColorName.grey800,
      shadowLightColorEmboss: ColorName.grey800,
      defaultTextColor: fontColor.textDefault,
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
        backgroundColor: ColorName.grey900,
        actionTextColor: fontColor.textHighlight,
        contentTextStyle: typography.body2,
      ),
      scaffoldBackgroundColor: ColorName.grey900,
      dialogBackgroundColor: ColorName.grey900,
      fontFamily: _defaultFontFamily,
      tabBarTheme: TabBarTheme(
        labelColor: fontColor.textDefault,
        labelStyle: typography.buttonLabel,
        unselectedLabelStyle: typography.buttonLabel,
        unselectedLabelColor: fontColor.subtitle,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorName.grey900,
        elevation: 12,
        shadowColor: ColorName.grey1000.withOpacity(0.67),
        centerTitle: false,
        titleSpacing: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      iconTheme: IconThemeData(color: fontColor.textDefault),
      primarySwatch: createMaterialColor(ColorName.scOrange),
      primaryColor: ColorName.scOrange,
      colorScheme: const ColorScheme.light(
        primary: ColorName.scOrange,
        onSurface: ColorName.grey100,
        secondary: ColorName.scOrange,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: Brightness.dark,
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: typography.body1.copyWith(fontSize: 18),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorName.grey900,
        selectedItemColor: fontColor.textHighlight,
        unselectedItemColor: fontColor.textDefault,
        selectedLabelStyle: typography.overline,
        unselectedLabelStyle: typography.overline,
        type: BottomNavigationBarType.fixed,
      ),
      dividerColor: componentStyle.separatorColor,
      unselectedWidgetColor: ColorName.grey100,
    );
    imagePickerTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: ColorName.grey900,
      colorScheme: const ColorScheme.dark(
        primary: ColorName.grey900,
        secondary: ColorName.scOrange,
      ),
      shadowColor: Colors.transparent,
      fontFamily: _defaultFontFamily,
    );
    mode = ThemeMode.light;
    ruejaiLogo = Assets.icons.logoLight;
    wallpaper = null;
    isDarkTheme = true;
  }

  @override
  app_theme.AppTheme theme(app_theme.PageSize pageSize) =>
      DarkTheme(pageSize: pageSize);

  static const String _defaultFontFamily = FontFamily.sukhumvitTadmai;
  static const TextStyle _headline1 = TextStyle(
    color: ColorName.grey100,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
  );
  static const TextStyle _headline2 = TextStyle(
    color: ColorName.grey100,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _headline3 = TextStyle(
    color: ColorName.grey100,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _headline4 = TextStyle(
    color: ColorName.grey100,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _headline5 = TextStyle(
    color: ColorName.grey100,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _subtitle1 = TextStyle(
    color: ColorName.grey100,
    fontSize: 18,
    fontFamily: _defaultFontFamily,
  );
  static const TextStyle _subtitle2 = TextStyle(
    color: ColorName.grey100,
    fontSize: 16,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
  static const TextStyle _body1 = TextStyle(
    color: ColorName.grey100,
    fontSize: 16,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _body2 = TextStyle(
    color: ColorName.grey100,
    fontSize: 14,
    fontFamily: _defaultFontFamily,
    height: 1.6,
  );
  static const TextStyle _caption = TextStyle(
    color: ColorName.grey100,
    fontSize: 13,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
  static const TextStyle _buttonLabel = TextStyle(
    color: ColorName.grey100,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
  static const TextStyle _overline = TextStyle(
    color: ColorName.grey100,
    fontSize: 11,
    fontFamily: _defaultFontFamily,
    height: 1.4,
  );
}
