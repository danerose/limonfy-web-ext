import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:limonfy/core/enum/logged.enum.dart';

class ConfigState extends Equatable {
  const ConfigState({
    this.logged = LoggedEnum.none,
    this.loginOut = false,
    this.loginOutStatus = 0,
    this.showPrivateLinks = false,
    this.theme = ThemeMode.system,
    this.lang,
  });

  final LoggedEnum logged;
  final bool loginOut;
  final int loginOutStatus;
  final bool showPrivateLinks;
  final ThemeMode theme;
  final Locale? lang;

  ConfigState copyWith({
    LoggedEnum? logged,
    bool? loginOut,
    int? loginOutStatus,
    bool? showPrivateLinks,
    ThemeMode? theme,
    Locale? lang,
  }) {
    return ConfigState(
      logged: logged ?? this.logged,
      loginOut: loginOut ?? this.loginOut,
      loginOutStatus: loginOutStatus ?? this.loginOutStatus,
      showPrivateLinks: showPrivateLinks ?? this.showPrivateLinks,
      theme: theme ?? this.theme,
      lang: lang ?? this.lang,
    );
  }

  @override
  List<Object> get props => [
        logged,
        loginOut,
        loginOutStatus,
        showPrivateLinks,
        theme,
        lang ?? '',
      ];
}
