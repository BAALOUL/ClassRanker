class Links {
  static const String server = "https://baalsoft.com/ecommerce";
  static const String test = "$server/test.php";

  //auth
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodeSignUp = "$server/auth/verfiycode.php";
  static const String loginAsProvider = "$server/auth/loginAsProvider.php";
  static const String signUpAsProvider = "$server/auth/signUpAsProvider.php";
  static const String verifyOTP = "$server/auth/verifyOTP.php";
  static const String tokenUpdate = "$server/auth/tokenUpdate.php";
  static const String getProviderId = "$server/auth/getProviderId.php";

  // Services
  static const String servicesView = "$server/services/servicesSelect.php";
  static const String servicesByCatView = "$server/services/servicesCat.php";
  static const String sectionsView = "$server/services/sectionsView.php";
  static const String categoryView = "$server/services/categoriesView.php";
  static const String sectionsAndServicesView =
      "$server/services/sectionsAndServicesView.php";

// reviews
  static const String reviewsView = "$server/reviews/reviewsByProvider.php";
  static const String addReviews = "$server/reviews/addReview.php";

  // Providers
  static const String providersView = "$server/providers/view.php";
  static const String providersByService =
      "$server/providers/providersByService.php";
  static const String providersByIdView = "$server/providers/providerById.php";
  static const String providersPhotoUpdate =
      "$server/providers/photoUpdateProvider.php";
  static const String isProvider = "$server/providers/isProvider.php";
  static const String providerUpdate = "$server/providers/providerUpdate.php";

  //service provider
  static const String serviceProviderUpdate =
      "$server/serviceProvider/serviceProviderUpdate.php";
  static const String selectServicesByProvider =
      "$server/serviceProvider/selectServicesByProvider.php";

  //Bookings
  static const String bookingUp = "$server/booking/booking.php";
  static const String bookingByUser = "$server/booking/bookingsByUser.php";
  static const String bookingStatusUpdate =
      "$server/booking/bookingStatusUpdate.php";

  // orders
  static const String ordersByProvider = "$server/orders/ordersByProvider.php";

  // Home
  static const String home = "$server/home.php";
  // properties
  static const String propertiesItems = "$server/properties/properties.php";

  // Upload
  static const String imagesUploaded = "https://baalsoft.com/ecommerce/upload";
  static const String categories = "$imagesUploaded/categories";
  static const String properties = "$imagesUploaded/properties";
  static const String sections = "$imagesUploaded/sections";
  static const String services = "$imagesUploaded/services";
  static const String providers = "$imagesUploaded/providers";
  static const String providerStatusUpdate =
      "$server/providers/providerStatusUpdate.php";
  static const String providerLocationUpdate =
      "$server/providers/providerLocationUpdate.php";
}
