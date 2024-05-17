import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'home_cocktail_model.dart';
export 'home_cocktail_model.dart';

class HomeCocktailWidget extends StatefulWidget {
  const HomeCocktailWidget({super.key});

  @override
  State<HomeCocktailWidget> createState() => _HomeCocktailWidgetState();
}

class _HomeCocktailWidgetState extends State<HomeCocktailWidget> {
  late HomeCocktailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCocktailModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() navigate = () {};
      if (FFAppState().auth == false) {
        GoRouter.of(context).prepareAuthEvent();
        final user = await authManager.signInAnonymously(context);
        if (user == null) {
          return;
        }
        navigate = () => context.goNamedAuth('HomeCocktail', context.mounted);
        setState(() {
          FFAppState().auth = true;
        });
      }

      navigate();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Drawer(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: const BoxDecoration(
                color: Color(0xFF100F17),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: MediaQuery.sizeOf(context).width * 0.3,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.13,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Purple Fox',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Piazzolla',
                                      color: const Color(0xFFE7E7EF),
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('NewDrink');
                                },
                                child: Text(
                                  'Neuer Cocktail',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFFE7E7EF),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('NewPost');
                                  },
                                  child: Text(
                                    'Neuer Post',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: const Color(0xFFE7E7EF),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'AGB',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: const Color(0xFFE7E7EF),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Impressum',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFFE7E7EF),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Datenschutz',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFFE7E7EF),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Kontakt',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: const Color(0xFFE7E7EF),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
                alignment: const AlignmentDirectional(0.6, 1.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: StreamBuilder<List<DrinksRecord>>(
                    stream: queryDrinksRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<DrinksRecord> listViewDrinksRecordList =
                          snapshot.data!;
                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          130.0,
                          0,
                          100.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: listViewDrinksRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 20.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewDrinksRecord =
                              listViewDrinksRecordList[listViewIndex];
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.42,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  listViewDrinksRecord.drinkPhoto,
                                ).image,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'CocktailPage',
                                  queryParameters: {
                                    'drinkRef': serializeParam(
                                      listViewDrinksRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 15.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.47,
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        listViewDrinksRecord.drinkName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: const Color(0xFFE7E7EF),
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 15.0, 0.0),
                                    child: ToggleIcon(
                                      onPressed: () async {
                                        final drinkHeartsElement =
                                            currentUserUid;
                                        final drinkHeartsUpdate =
                                            listViewDrinksRecord
                                                    .drinkHearts
                                                    .contains(
                                                        drinkHeartsElement)
                                                ? FieldValue.arrayRemove(
                                                    [drinkHeartsElement])
                                                : FieldValue.arrayUnion(
                                                    [drinkHeartsElement]);
                                        await listViewDrinksRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'drink_hearts': drinkHeartsUpdate,
                                            },
                                          ),
                                        });
                                        if (listViewDrinksRecord.drinkHearts
                                                .contains(currentUserUid) ==
                                            false) {
                                          await listViewDrinksRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'drink_hearts':
                                                    FieldValue.arrayUnion(
                                                        [currentUserUid]),
                                                'hearts_count':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });
                                        } else {
                                          await listViewDrinksRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'drink_hearts':
                                                    FieldValue.arrayRemove(
                                                        [currentUserUid]),
                                                'hearts_count':
                                                    FieldValue.increment(-(1)),
                                              },
                                            ),
                                          });
                                        }
                                      },
                                      value: listViewDrinksRecord.drinkHearts
                                          .contains(currentUserUid),
                                      onIcon: const Icon(
                                        Icons.favorite_outlined,
                                        color: Color(0xFFE7E7EF),
                                        size: 32.0,
                                      ),
                                      offIcon: const Icon(
                                        Icons.favorite_border,
                                        color: Color(0xFFE7E7EF),
                                        size: 32.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    decoration: const BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/Gruppe_1.png',
                              width: 25.0,
                              height: 19.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(35.0, 55.0, 0.0, 0.0),
                child: Text(
                  'Cocktails',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Piazzolla',
                        color: const Color(0xFFE7E7EF),
                        fontSize: 56.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w100,
                        lineHeight: 1.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.4),
                child: Container(
                  width: 67.0,
                  height: 164.0,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('News');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Pfad_4.png',
                            width: 67.0,
                            height: 164.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.3, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('News');
                          },
                          child: const Icon(
                            Icons.feedback_rounded,
                            color: Color(0xFF636181),
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  width: 67.0,
                  height: 164.0,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Game');
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Pfad_3.png',
                            width: 67.0,
                            height: 164.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.2, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Game');
                          },
                          child: const Icon(
                            Icons.games_sharp,
                            color: Color(0xFFA0A5BE),
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, -0.4),
                child: Container(
                  width: 67.0,
                  height: 164.0,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Pfad_2.png',
                          width: 67.0,
                          height: 164.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(-0.1, 0.0),
                        child: FaIcon(
                          FontAwesomeIcons.cocktail,
                          color: Color(0xFF060502),
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.4, 0.8),
                child: Transform.rotate(
                  angle: 270.0 * (math.pi / 180),
                  child: Text(
                    'Purple Fox',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Piazzolla',
                          color: const Color(0x32E7E7EF),
                          fontSize: 32.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.93),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  height: 55.0,
                  decoration: const BoxDecoration(
                    color: Color(0x34000000),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.home,
                            color: Color(0xFFFFDD66),
                            size: 35.0,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Favorites');
                            },
                            child: const Icon(
                              Icons.favorite_border,
                              color: Color(0xFFE7E7EF),
                              size: 35.0,
                            ),
                          ),
                          const Icon(
                            Icons.search_sharp,
                            color: Color(0xFFE7E7EF),
                            size: 35.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
