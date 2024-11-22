import 'package:animation_demo/Model/MarkerResponse.dart';
import 'package:latlong2/latlong.dart';

class MapRepository{
  final List<LatLng> markerPositions = const [
    LatLng(51.5000, -0.0950), // Center
    LatLng(51.4900, -0.0700), // South-East
    LatLng(51.4800, -0.0700), // Farther South-East
    LatLng(51.5050, -0.0700), // North-East
    LatLng(51.5150, -0.0850), // North
    LatLng(51.4850, -0.0950), // South
  ];
  List<MarkerResponse> fetchMarkerResponse(){
    final List<MarkerResponse> markerResponses = List.generate(
      markerPositions.length,
          (index) => MarkerResponse(
        markerPositions[index],
        'Location ${index + 1}',
      ),
    );
    return markerResponses;
  }
}