import '/flutter_flow/flutter_flow_util.dart';
import 'cocktail_page_widget.dart' show CocktailPageWidget;
import 'package:flutter/material.dart';

class CocktailPageModel extends FlutterFlowModel<CocktailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
