import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat/app/app_theme.dart';

class AppThemeCubit extends Cubit<AppTheme> {
  AppThemeCubit({
    required AppTheme theme,
    // required this.prefs,
  }) : super(theme);

  PageSize _pageSize = PageSize.regular;
  final _minWidthOfRegularScreen = 360;
  final _maxWidthOfRegularScreen = 414;
  // final SharedPreferences prefs;

  PageSize get pageSize {
    return _pageSize;
  }

  void updateThemePageSize(double pageWidth) {
    PageSize pageSize;
    if (pageWidth < _minWidthOfRegularScreen) {
      pageSize = PageSize.small;
    } else if (pageWidth <= _maxWidthOfRegularScreen) {
      pageSize = PageSize.regular;
    } else {
      pageSize = PageSize.large;
    }

    if (_pageSize != pageSize) {
      _pageSize = pageSize;
      emit(state.theme(_pageSize));
    }
  }

  void changeTheme(AppTheme theme) {
    emit(theme.theme(_pageSize));
    // _saveThemeToPrefs(theme);
  }

  // void _saveThemeToPrefs(AppTheme theme) {
  //   prefs.setString(
  //     PreferenceKeys.appTheme,
  //     SupportedThemeContructor.fromAppTheme(theme).valueString,
  //   );
  // }
}
