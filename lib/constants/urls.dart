/*
 * urls.dart
 * orino_smart_village
 * Created by Alessandro Riva
 * Copyright (c) 2022.
 */

class URLS {
  // Prevent this class being instantiated
  URLS._();

  static const String baseDomain = 'www.orinosmartvillage.it';
  static const String baseApiUrl =
      'https://www.orinosmartvillage.it/wp-json/wp/v2';
  static const String usersEndpoint = '/users';
  static const String postsEndpoint = '/posts';
  static const String mediaEndpoint = '/media';

  // Cantine
  static const String cantinaMariana =
      'https://www.orinosmartvillage.it/place/cantina-mariana/';
  static const String cantinaGesa =
      'https://www.orinosmartvillage.it/place/cantina-du-la-gesa/';
  static const String cantinaFael =
      'https://www.orinosmartvillage.it/place/cantina-dul-fael/';
  static const String burgettDiRat =
      'https://www.orinosmartvillage.it/place/burghett-rat/';

  // Terms and conditions
  static const String termsAndConditions = 'https://www.orinosmartvillage.it/termini-e-condizioni-duso/';

  // Dashboard
  static const String dashboard =
      'http://34.65.173.216/dashboard/?IMBUILDINGS_PEOPLE_COUNTER=y&IMBUILDINGS_PEOPLE_COUNTER_0=y&IMBUILDINGS_PEOPLE_COUNTER_2=y';
}
