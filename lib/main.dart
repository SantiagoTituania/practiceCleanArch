import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_clean_arch/app/app.dart';

void main() => runApp(const ProviderScope(child: AppArquitecturaLimpia()));

bool globalIsDarkSelected = false;
