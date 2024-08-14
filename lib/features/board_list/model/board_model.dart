import 'package:flutter/material.dart';

class GameBoard {
  final List<String> players;
  final BoardSettings settings;

  GameBoard({
    required this.players,
    required this.settings,
  });

  // JSON'dan GameBoard sınıfına dönüştürmek için
  factory GameBoard.fromJson(Map<String, dynamic> json) {
    return GameBoard(
      players: List<String>.from(json['players']),
      settings: BoardSettings.fromJson(json['settings']),
    );
  }

  // GameBoard sınıfını JSON'a dönüştürmek için
  Map<String, dynamic> toJson() {
    return {
      'players': players,
      'settings': settings.toJson(),
    };
  }
}

class BoardSettings {
  final String gameName;
  final Color boardColor;

  BoardSettings({
    required this.gameName,
    required this.boardColor,
  });

  // JSON'dan BoardSettings sınıfına dönüştürmek için
  factory BoardSettings.fromJson(Map<String, dynamic> json) {
    return BoardSettings(
      gameName: json['gameName'],
      boardColor: Color(int.parse(json['boardColor'].toString().split('(0x')[1].split(')')[0], radix: 16)),
    );
  }

  // BoardSettings sınıfını JSON'a dönüştürmek için
  Map<String, dynamic> toJson() {
    return {
      'gameName': gameName,
      'boardColor': boardColor.value.toString(),
    };
  }
}
