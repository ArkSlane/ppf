import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'cocktail_page_model.dart';
export 'cocktail_page_model.dart';

class CocktailPageWidget extends StatefulWidget {
  const CocktailPageWidget({
    super.key,
    required this.drinkRef,
  });

  final DocumentReference? drinkRef;

  @override
  State<CocktailPageWidget> createState() => _CocktailPageWidgetState();
}

class _CocktailPageWidgetState extends State<CocktailPageWidget> {
  late CocktailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CocktailPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DrinksRecord>(
      stream: DrinksRecord.getDocument(widget.drinkRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final cocktailPageDrinksRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            body: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF33253B),
                    Color(0xFF100F17),
                    Color(0xFF100F17),
                    Color(0xFF33253B)
                  ],
                  stops: [0.0, 0.2, 0.7, 1.0],
                  begin: AlignmentDirectional(0.94, 1.0),
                  end: AlignmentDirectional(-0.94, -1.0),
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.43),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            cocktailPageDrinksRecord.drinkPhoto,
                          ).image,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        decoration: const BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color(0xFFE7E7EF),
                                size: 30.0,
                              ),
                            ),
                            ToggleIcon(
                              onPressed: () async {
                                final drinkHeartsElement = currentUserUid;
                                final drinkHeartsUpdate =
                                    cocktailPageDrinksRecord.drinkHearts
                                            .contains(drinkHeartsElement)
                                        ? FieldValue.arrayRemove(
                                            [drinkHeartsElement])
                                        : FieldValue.arrayUnion(
                                            [drinkHeartsElement]);
                                await cocktailPageDrinksRecord.reference
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'drink_hearts': drinkHeartsUpdate,
                                    },
                                  ),
                                });
                                if (cocktailPageDrinksRecord.drinkHearts
                                        .contains(currentUserUid) ==
                                    false) {
                                  await cocktailPageDrinksRecord.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'drink_hearts': FieldValue.arrayUnion(
                                            [currentUserUid]),
                                        'hearts_count': FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                } else {
                                  await cocktailPageDrinksRecord.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'drink_hearts': FieldValue.arrayRemove(
                                            [currentUserUid]),
                                        'hearts_count':
                                            FieldValue.increment(-(1)),
                                      },
                                    ),
                                  });
                                }
                              },
                              value: cocktailPageDrinksRecord.drinkHearts
                                  .contains(currentUserUid),
                              onIcon: const Icon(
                                Icons.favorite_outlined,
                                color: Color(0xFFE7E7EF),
                                size: 30.0,
                              ),
                              offIcon: const Icon(
                                Icons.favorite_border,
                                color: Color(0xFFE7E7EF),
                                size: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.55,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF33253B), Color(0xFF100F17)],
                          stops: [0.0, 0.7],
                          begin: AlignmentDirectional(0.53, -1.0),
                          end: AlignmentDirectional(-0.53, 1.0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.7,
                                    decoration: const BoxDecoration(),
                                    child: Text(
                                      cocktailPageDrinksRecord.drinkName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Piazzolla',
                                            color: const Color(0xFFE7E7EF),
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w100,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.ios_share_sharp,
                                    color: Color(0x0AE7E7EF),
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 10.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.favorite_border,
                                    color: Color(0xFFE7E7EF),
                                    size: 20.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      cocktailPageDrinksRecord.heartsCount
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: const Color(0xFFE7E7EF),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 60.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'GLASS TYPE',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: const Color(0xFFE7E7EF),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w100,
                                              ),
                                        ),
                                        Text(
                                          cocktailPageDrinksRecord.drinkGlass,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: const Color(0xFFFFDD66),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ),
                                  Container(
                                    height: 60.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'COCKTAIL TYPE',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: const Color(0xFFE7E7EF),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w100,
                                              ),
                                        ),
                                        Text(
                                          cocktailPageDrinksRecord.drinkSeason,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: const Color(0xFFFFDD66),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ),
                                  Container(
                                    height: 60.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'STRENGTH',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: const Color(0xFFE7E7EF),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w100,
                                              ),
                                        ),
                                        Text(
                                          cocktailPageDrinksRecord
                                              .drinkPercentage,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: const Color(0xFFFFDD66),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30.0, 30.0, 30.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Ingredients',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: const Color(0xFFE7E7EF),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: StreamBuilder<List<IngredienceRecord>>(
                                stream: queryIngredienceRecord(
                                  queryBuilder: (ingredienceRecord) =>
                                      ingredienceRecord.whereIn('iid',
                                          cocktailPageDrinksRecord.ingredience),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<IngredienceRecord>
                                      rowIngredienceRecordList = snapshot.data!;
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                              rowIngredienceRecordList.length,
                                              (rowIndex) {
                                        final rowIngredienceRecord =
                                            rowIngredienceRecordList[rowIndex];
                                        return Container(
                                          width: 100.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.19,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF201E27),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                rowIngredienceRecord.photoUrl,
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 16.0,
                                                    sigmaY: 16.0,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 2.0,
                                                                5.0, 2.0),
                                                    child: Text(
                                                      rowIngredienceRecord.name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: const Color(
                                                                0xFFE7E7EF),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                          .divide(const SizedBox(width: 20.0))
                                          .addToStart(const SizedBox(width: 30.0))
                                          .addToEnd(const SizedBox(width: 30.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
