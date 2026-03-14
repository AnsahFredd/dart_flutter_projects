abstract class FindDoctorEvent {}

class GetDoctorsEvent extends FindDoctorEvent {}

class SearchDoctorsEvent extends FindDoctorEvent {
  final String query;
  SearchDoctorsEvent(this.query);
}

class FilterDoctorsEvent extends FindDoctorEvent {
  final String query;
  FilterDoctorsEvent(this.query);
}

class SortDoctorsEvent extends FindDoctorEvent {
  final String query;
  SortDoctorsEvent(this.query);
}

class GetDoctorsBySpecialtyEvent extends FindDoctorEvent {
  final String specialty;
  GetDoctorsBySpecialtyEvent(this.specialty);
}

class GetDoctorsByCityEvent extends FindDoctorEvent {
  final String city;
  GetDoctorsByCityEvent(this.city);
}

class GetDoctorsByStateEvent extends FindDoctorEvent {
  final String state;
  GetDoctorsByStateEvent(this.state);
}

class GetDoctorsByZipCodeEvent extends FindDoctorEvent {
  final String zipCode;
  GetDoctorsByZipCodeEvent(this.zipCode);
}

class GetDoctorsByCountryEvent extends FindDoctorEvent {
  final String country;
  GetDoctorsByCountryEvent(this.country);
}