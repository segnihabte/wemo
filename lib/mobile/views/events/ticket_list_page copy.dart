import 'package:etiocart/mobile/model/purchase_list.dart';
import 'package:flutter/material.dart';

import '../../../constants/theme_data.dart';
import '../../../repository/event_servics.dart';

class CopyTicketListPage extends StatelessWidget {
  const CopyTicketListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<List<Purchases>> _puchaseList = EventServics().fetchList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Tickets',
            style: StylingData.appBarText,
          ),
          backgroundColor: StylingData.bgColor,
          foregroundColor: StylingData.frColor,
        ),
        body: Column(
          children: [
            ticketsList(),
            ticketsList(),
            FutureBuilder(
                future: _puchaseList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 500,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              width: 100,
                              child:
                                  Text(snapshot.data![index].amount.toString()),
                            );
                          }),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("some error ${snapshot.error}"),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
          ],
        ));
  }

  ticketsList() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        child: Column(
          children: [
            Row(
              children: [Text('event title')],
            ),
            Row(
              children: [Text('date')],
            ),
          ],
        ),
      ),
    );
  }
}
