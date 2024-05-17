import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'incredients_model.dart';
export 'incredients_model.dart';

class IncredientsWidget extends StatefulWidget {
  const IncredientsWidget({super.key});

  @override
  State<IncredientsWidget> createState() => _IncredientsWidgetState();
}

class _IncredientsWidgetState extends State<IncredientsWidget> {
  late IncredientsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncredientsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 300.0,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (FFAppState().addIngred)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().addIngred = false;
                        });
                      },
                      child: Container(
                        width: 100.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFDD66),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().addIngred = false;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xFF060502),
                                  size: 36.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 2.0,
                                      sigmaY: 2.0,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 2.0, 5.0, 2.0),
                                      child: Text(
                                        'Hinzufügen',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFF060502),
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<List<IngredienceRecord>>(
                      stream: queryIngredienceRecord(),
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
                        List<IngredienceRecord> rowIngredienceRecordList =
                            snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                                  rowIngredienceRecordList.length, (rowIndex) {
                            final rowIngredienceRecord =
                                rowIngredienceRecordList[rowIndex];
                            return Container(
                              width: 100.0,
                              height: 160.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF201E27),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    rowIngredienceRecord.photoUrl,
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ToggleIcon(
                                        onPressed: () async {
                                          setState(
                                            () => FFAppState()
                                                    .ingredience
                                                    .contains(
                                                        rowIngredienceRecord
                                                            .iid)
                                                ? FFAppState()
                                                    .removeFromIngredience(
                                                        rowIngredienceRecord
                                                            .iid)
                                                : FFAppState().addToIngredience(
                                                    rowIngredienceRecord.iid),
                                          );
                                          if (FFAppState().ingredience.contains(
                                                  rowIngredienceRecord
                                                      .reference.id) ==
                                              true) {
                                            _model.updatePage(() {
                                              FFAppState()
                                                  .removeFromIngredience('');
                                            });
                                          } else {
                                            _model.updatePage(() {
                                              FFAppState().addToIngredience('');
                                            });
                                          }
                                        },
                                        value: FFAppState()
                                            .ingredience
                                            .contains(rowIngredienceRecord.iid),
                                        onIcon: const Icon(
                                          Icons.check_box,
                                          color: Color(0xFFE7E7EF),
                                          size: 25.0,
                                        ),
                                        offIcon: const Icon(
                                          Icons.check_box_outline_blank,
                                          color: Color(0xFFE7E7EF),
                                          size: 25.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 16.0,
                                            sigmaY: 16.0,
                                          ),
                                          child: Container(
                                            constraints: const BoxConstraints(
                                              maxWidth: 80.0,
                                            ),
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 2.0, 5.0, 2.0),
                                              child: Text(
                                                rowIngredienceRecord.name,
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: const Color(0xFFE7E7EF),
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                              .divide(const SizedBox(width: 20.0))
                              .addToStart(const SizedBox(width: 30.0))
                              .addToEnd(const SizedBox(width: 30.0)),
                        );
                      },
                    ),
                  ]
                      .addToStart(const SizedBox(width: 20.0))
                      .addToEnd(const SizedBox(width: 20.0)),
                ),
              ),
            if (FFAppState().addIngred)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Fertig',
                      options: FFButtonOptions(
                        height: 35.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x014B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: const Color(0xFFE7E7EF),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Color(0xFFE7E7EF),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            if (!FFAppState().addIngred)
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      _model.uploadedFileUrl,
                    ).image,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 12.0,
                          sigmaY: 2.0,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x7D000000),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  child: const Icon(
                                    Icons.upload,
                                    color: Color(0xFFE7E7EF),
                                    size: 60.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 5.0, 10.0, 5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.isDataUploading = false;
                                      _model.uploadedLocalFile = FFUploadedFile(
                                          bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl = '';
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Color(0xFFE7E7EF),
                                    size: 60.0,
                                  ),
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
            if (!FFAppState().addIngred)
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 0.0),
                        child: SizedBox(
                          width: 80.0,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Zutat',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFFE7E7EF),
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (!FFAppState().addIngred)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        var ingredienceRecordReference =
                            IngredienceRecord.collection.doc();
                        await ingredienceRecordReference
                            .set(createIngredienceRecordData(
                          name: _model.textController.text,
                          photoUrl: _model.uploadedFileUrl,
                        ));
                        _model.docID = IngredienceRecord.getDocumentFromData(
                            createIngredienceRecordData(
                              name: _model.textController.text,
                              photoUrl: _model.uploadedFileUrl,
                            ),
                            ingredienceRecordReference);

                        await _model.docID!.reference
                            .update(createIngredienceRecordData(
                          iid: _model.docID?.reference.id,
                        ));
                        setState(() {
                          _model.isDataUploading = false;
                          _model.uploadedLocalFile =
                              FFUploadedFile(bytes: Uint8List.fromList([]));
                          _model.uploadedFileUrl = '';
                        });

                        setState(() {
                          _model.textController?.clear();
                        });
                        setState(() {
                          FFAppState().addIngred = true;
                        });

                        setState(() {});
                      },
                      text: 'Speichern',
                      options: FFButtonOptions(
                        height: 35.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x014B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Roboto',
                                  color: const Color(0xFFE7E7EF),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Color(0xFFE7E7EF),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
