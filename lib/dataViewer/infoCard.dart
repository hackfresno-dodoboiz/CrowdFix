import 'package:flutter/material.dart';

class InfoListViewBuilder extends StatelessWidget {
  //final Ticket ticket;
  const InfoListViewBuilder({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 251, 108, 112),
      child: OrientationBuilder(
        builder: (context, orientation) {
          return new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            /*separatorBuilder: (context, i) => Divider(
                  color: Colors.red,
            ),*/
            itemBuilder: (BuildContext context, i) {
              return Container(
                height: orientation == Orientation.landscape
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height * .50,
                padding: EdgeInsets.all(8),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.spaceEvenly,
                        spacing: 10.0,
                        runSpacing: 20.0,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topCenter,
                            child: Image.network(
                             // alignment: Alignment.topCenter,
                                 data[i]["fields"]["image"]["stringValue"]),
                          ),
                          Container(
                            child: Text("\nCategory: " +
                                data[i]["fields"]["category"]["stringValue"] +
                                "\nTitle: " +
                                data[i]["fields"]["event_title"]["stringValue"]+
                                "\nDescription: " +
                                data[i]["fields"]["desc"]["stringValue"]+
                                "\nLikes: " +
                                data[i]["fields"]["likes"]["integerValue"]+
                                "\nDislikes: " +
                                data[i]["fields"]["dislikes"]["integerValue"]+
                                "\nLat : " +
                                data[i]["fields"]["location"]["geoPointValue"]["latitude"].toString()+
                                "\nLong :"+
                                data[i]["fields"]["location"]["geoPointValue"]["latitude"].toString()),
                          ),

                          /* Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  " Price: " +
                                      data[i]["pennyPrice"].toString() +
                                      "\n Duration: " +
                                      data[i]["duration"].toString(),
                                ),
                                Text(" \nDEPARTURE: " +
                                    data[i]["departure"] +
                                    "\nARRIVAL: " +
                                    data[i]["arrival"] +
                                    "\nColor: " +
                                    data[i]['color'] +
                                    "\nSourceLocation: " +
                                    data[i]["sourceLocation"] +
                                    "\nDestinationLocation: " +
                                    data[i]["destLocation"]),
                              ]),*/
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/* new ListTile(
          leading:
              new Text(data[i]["from"] + "\n| |\n| |\nV\n" + data[i]["to"]),
          title: new Text(
            " Price: " +
                data[i]["pennyPrice"].toString() +
                " Duration: " +
                data[i]["duration"].toString(),
          ),
          subtitle: new Text(" \nDEPARTURE: " +
              data[i]["departure"] +
              "\nARRIVAL: " +
              data[i]["arrival"] +
              "\nColor: " +
              data[i]['color'] +
              "\nSourceLocation: " +
              data[i]["sourceLocation"] +
              "\nDestinationLocation: " +
              data[i]["destLocation"]),
        );*/
