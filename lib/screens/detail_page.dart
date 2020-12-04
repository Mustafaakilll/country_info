import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key key,
    this.name,
    this.area,
    this.capital,
    this.region,
    this.population,
    this.flag,
  }) : super(key: key);

  final name;
  final capital;
  final region;
  final population;
  final area;
  final flag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme"),
      ),
      body: buildDetailPage(),
    );
  }

  ListView buildDetailPage() {
    return ListView(
      children: [
        buildListTileDetail(title: "Name", value: name),
        buildListTileDetail(title: "Capital", value: capital),
        buildListTileDetail(title: "Population", value: population),
        buildListTileDetail(title: "Area", value: area),
        buildListTileDetail(title: "Region", value: region),
        buildListTileFlag(title: "Flag", value: flag),
      ],
    );
  }

  buildListTileDetail({final title, final value}) {
    return ListTile(
      leading: Text(
        "$title:",
        style: TextStyle(fontSize: 24),
      ),
      title: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  buildListTileFlag({String title, value}) {
    return ListTile(
      leading: Text(
        "$title:",
        style: TextStyle(fontSize: 24),
      ),
      title: SvgPicture.network(
        value,
        height: 50,
        width: 50,
      ),
    );
  }
}
