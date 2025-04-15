import 'package:african_countries/app_barrel.dart';

class Subtext extends StatelessWidget {
  const Subtext(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      textAlign: TextAlign.start,
    );
  }
}
