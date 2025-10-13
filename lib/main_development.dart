import 'package:verdora_app/app/app.dart';
import 'package:verdora_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
