// ignore_for_file: constant_identifier_names

import 'package:janson_wighting/domain/models/models.dart';
import 'package:janson_wighting/utils/strings.dart';

enum WhigtTecketAction {
  create_newTicket,
  create_fristWhight,
  create_secondWhigt,
  archive_tecket
  
}

extension Xdf5 on WhigtTecketAction {
  ActionModel get add {
    switch (this) {
      case WhigtTecketAction.create_fristWhight:
        return ActionModel(
            action: "create_fristWhight",
            who: StringManger.username,
            when: DateTime.now());
      case WhigtTecketAction.create_secondWhigt:
        return ActionModel(
            action: "create_secondWhigt",
            who: StringManger.username,
            when: DateTime.now());
      case WhigtTecketAction.archive_tecket:
        return ActionModel(
            action: "archive_tecket",
            who: StringManger.username,
            when: DateTime.now());
      case WhigtTecketAction.create_newTicket:
  return ActionModel(
            action: "create_newTicket",
            who: StringManger.username,
            when: DateTime.now());    }
  }
  String get getTitle {
  switch (this) {
    case WhigtTecketAction.create_newTicket:
      return "create_newTicket";
    case WhigtTecketAction.create_fristWhight:
      return "create_fristWhight";
    case WhigtTecketAction.create_secondWhigt:
      return "create_secondWhigt";
    case WhigtTecketAction.archive_tecket:
      return "archive_tecket";
  }
}

}

