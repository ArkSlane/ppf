import '/flutter_flow/flutter_flow_util.dart';
import 'home_cocktail_widget.dart' show HomeCocktailWidget;
import 'package:flutter/material.dart';

class HomeCocktailModel extends FlutterFlowModel<HomeCocktailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
