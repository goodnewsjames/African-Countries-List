import 'package:african_countries/app_barrel.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(this.text ,{super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
