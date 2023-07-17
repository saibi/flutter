const googleApiKey = 'Copy & Paste Google API key';

class ApiService {
  static getLocationUrl(double lat, double lng) {
    return 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey';
  }

  static getMapImageUrl(double lat, double lng) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=colorScheme.background:red%7Clabel:S%7C$lat,$lng&key=$googleApiKey';
  }
}
