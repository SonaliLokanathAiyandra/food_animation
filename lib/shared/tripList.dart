import 'package:flutter/material.dart';
import 'package:food/models/Trip.dart';
import 'package:food/screens/details.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addTrips();
  }

  void _addTrips() {
    List<Trip> _trips = [
      Trip(title: 'Beach Paradise', price: '350', img: 'food1.jpg'),
      Trip(title: 'City Break', price: '400', img: 'food3.jpg'),
      Trip(title: 'Ski Adventure', price: '750',  img: 'food4.jpg'),
      Trip(title: 'Space Blast', price: '600',  img: 'food5.jpg'),
      Trip(title: 'Spicy Blast', price: '600',  img: 'food2.webp'),
    ];

    _trips.forEach((Trip trip) {
      _tripTiles.add(_buildTile(trip));
    });
  }

  Widget _buildTile(Trip trip) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
        },
        contentPadding: EdgeInsets.all(25),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//
            Text(trip.title, style: TextStyle(fontSize: 14, color: Colors.red[600])),
          ],
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(13.0),
          child: Hero(
            tag: 'location-img-${trip.img}',
            child: Image.asset(
              'images/${trip.img}',
              height: 60.0,
              width: 80.0,
            ),
          ),
        ),
        trailing: Text('\$${trip.price}',style: TextStyle(color:Colors.blue),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: _tripTiles.length,
      itemBuilder: (context, index) {
        return _tripTiles[index];
      }
    );
  }
}
