import 'package:country_api/data/http.dart';
import 'package:country_api/model/country.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CountryService _countryService;

  @override
  void initState() {
    _countryService = CountryService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contry"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: _countryService.fetchCountries(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<List<Country>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  Text("Yükleniyor"),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final country = snapshot.data[index];
                return ListTile(
                  leading: Text((index + 1).toString()),
                  trailing: Text(
                    "Tap for more info",
                    style: TextStyle(color: Colors.grey),
                  ),
                  title: Text(country.name),
                  onTap: () {
                    return Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          name: country.name,
                          area: country.area == null ? "No Info" : country.area.toString(),
                          capital: country.capital,
                          flag: country.flag,
                          population: country.population.toString(),
                          region: buildRegionInfo(country.region.index),
                          //country.region.index.toString(),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  buildRegionInfo(int index) {
    switch (index) {
      case 0:
        return "Asia";
        break;
      case 1:
        return "Europe";
        break;
      case 2:
        return "Africa";
        break;
      case 3:
        return "Oceania";
        break;
      case 4:
        return "America";
        break;
      case 5:
        return "Polar";
        break;
      case 6:
        return "No Info";
        break;

      default:
    }
  }
}
