import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material/api/material.dart';
import 'package:material/model/vendor.dart';

class MapScreen extends StatefulWidget{
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(32.071084, 72.667994); //location to show in map
  
  List<VendorModel> vendors = [];
  getVendors() async {
    var mvendors = await MaterialApi.getMaterial();
    setState(() {
      vendors = mvendors;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print('sdafhadsfafd');
      getVendors();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar( 
             title: Text("Vendors location"),
             backgroundColor: Colors.blue,
          ),
          body: GoogleMap( //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: showLocation, //initial position
                      zoom: 12.0, //initial zoom level
                    ),
                    markers: getmarkers(), //markers to show on map
                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) { //method called when map is created
                      setState(() {
                        mapController = controller; 
                      });
                    },
                  ),
       );
  }

  Set<Marker> getmarkers() { 
      markers.clear(); // Clear existing markers

  for (var vendor in vendors) {
    print(vendor.lat);
    markers.add(Marker(
      markerId: MarkerId(vendor.id.toString()),
      position: LatLng(double.parse(vendor.lat!), double.parse(vendor.lng!)),
      infoWindow: InfoWindow(
        title: vendor.name,
        snippet: vendor.name,
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }

  return markers;

  
  }
}