import 'package:deprem_bilgi/models/earth_quake_list_model.dart';
import 'package:deprem_bilgi/pages/earth_quake_detail.dart';
import 'package:deprem_bilgi/services/earth_quake_list_service.dart';
import 'package:flutter/material.dart';

class EarthQuakeList extends StatefulWidget {
  const EarthQuakeList({Key? key}) : super(key: key);

  @override
  State<EarthQuakeList> createState() => _EarthQuakeListState();
}

class _EarthQuakeListState extends State<EarthQuakeList> {
  final EarthQuakeListService _earthQuakeListService = EarthQuakeListService();
  List<EarthQuakeListModel> _earthQuakeList = [];

  @override
  void initState() {
    _earthQuakeListService.getEarthQuake().then((value) {
      setState(() {
        _earthQuakeList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Son Depremler'),
        centerTitle: true,
      ),
      body: _earthQuakeList.isNotEmpty
          ? ListView.builder(
              itemCount: _earthQuakeList.length,
              itemBuilder: (BuildContext context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      height: 70,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EarthQuakeDetail(_earthQuakeList[index])),
                          );
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.warning,
                            size: 40,
                            color: _earthQuakeList[index].mag! > 2.0
                                ? Colors.red
                                : Colors.green,
                          ),
                          title: Text(
                            'Merkez Üssü: ${_earthQuakeList[index].lokasyon}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                'Şiddet: ${_earthQuakeList[index].mag}',
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Tarih: ${_earthQuakeList[index].date}',
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
