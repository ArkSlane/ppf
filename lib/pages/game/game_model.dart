import '/flutter_flow/flutter_flow_util.dart';
import 'game_widget.dart' show GameWidget;
import 'package:flutter/material.dart';

class GameModel extends FlutterFlowModel<GameWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
