import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'registratio_page_widget.dart' show RegistratioPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistratioPageModel extends FlutterFlowModel<RegistratioPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for pass widget.
  FocusNode? passFocusNode;
  TextEditingController? passController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passControllerValidator;
  // State field(s) for ConpAss widget.
  FocusNode? conpAssFocusNode;
  TextEditingController? conpAssController;
  late bool conpAssVisibility;
  String? Function(BuildContext, String?)? conpAssControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passVisibility = false;
    conpAssVisibility = false;
  }

  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passFocusNode?.dispose();
    passController?.dispose();

    conpAssFocusNode?.dispose();
    conpAssController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
