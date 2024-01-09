class OneWayModelNormal {
  String? name;
  String? travelmode;
  String? travelclass;
  String? origin;
  String? destination;
  String? traveldate;
  String? traveltime;
  String? eta;
  String? seat;
  String? comments;
  String? food;
  String? accomodation;
  String? occupancy;
  String? checkin;
  String? checkout;
  String? hotel;
  String? bags;
  String? weight;
  String? remarks;
  String? currencymode;
  String? currency;
  String? amount;
  String? cab;
  String? purpose;
  String? connectiontotravellertable;
  OneWayModelNormal({
    this.name,
    this.travelmode,
    this.travelclass,
    this.origin,
    this.destination,
    this.traveldate,
    this.traveltime,
    this.eta,
    this.food,
    this.accomodation,
    this.bags,
    this.comments,
    this.hotel,
    this.occupancy,
    this.checkin,
    this.checkout,
    this.remarks,
    this.seat,
    this.weight,
    this.connectiontotravellertable,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'travelmode': travelmode ?? '',
      'travelclass': travelclass ?? '',
      'origin': origin ?? '',
      'destination': destination ?? '',
      'traveldate': traveldate ?? '',
      'traveltime': traveltime ?? '',
      'eta': eta ?? '',
      'food': food ?? '',
      'accomodation': accomodation ?? '',
      'bags': bags ?? '',
      'comments': comments ?? '',
      'hotel': hotel ?? '',
      'occupancy': occupancy ?? '',
      'checkin': checkin ?? '',
      'checkout': checkout ?? '',
      'remarks': remarks ?? '',
      'seat': seat ?? '',
      'weight': weight ?? '',
      'connectiontotravellertable': connectiontotravellertable ?? ''
    };
  }
}

class OneWayModelInternational {
  String? name;
  String? travelmode;
  String? travelclass;
  String? origin;
  String? destination;
  String? traveldate;
  String? traveltime;
  String? eta;
  String? seat;
  String? comments;
  String? food;
  String? accomodation;
  String? occupancy;
  String? checkin;
  String? checkout;
  String? hotel;
  String? bags;
  String? weight;
  String? remarks;
  String? region;
  String? connectiontocurrencytable;
  String? insurancerequired;
  String? insurancefromdate;
  String? insurancetodate;
  String? insuranceavailability;
  String? insurancename;
  String? insurancevaliddate;
  String? visa;
  String? cab;
  String? purpose;
  String? connectiontotravellertable;
  Map<String, dynamic> toMap() {
    return {
      'name': name ?? '',
      'travelmode': travelmode ?? '',
      'travelclass': travelclass ?? '',
      'origin': origin ?? '',
      'destination': destination ?? '',
      'traveldate': traveldate ?? '',
      'traveltime': traveltime ?? '',
      'eta': eta ?? '',
      'food': food ?? '',
      'accomodation': accomodation ?? '',
      'bags': bags ?? '',
      'comments': comments ?? '',
      'hotel': hotel ?? '',
      'occupancy': occupancy ?? '',
      'checkin': checkin ?? '',
      'checkout': checkout ?? '',
      'remarks': remarks ?? '',
      'seat': seat ?? '',
      'weight': weight ?? '',
      'region': region ?? '',
      'connectiontocurrencytable': connectiontocurrencytable ?? '',
      'insuranceavailability': insuranceavailability ?? '',
      'insurancefromdate': insurancefromdate ?? '',
      'insurancetodate': insurancetodate ?? '',
      'insurancerequired': insurancerequired ?? '',
      'insurancename': insurancename ?? '',
      'insurancevaliddate': insurancevaliddate ?? '',
      'visa': visa ?? '',
      'cab': cab ?? '',
      'purpose': purpose ?? '',
      'connectiontotravellertable': connectiontotravellertable ?? '',
    };
  }

  OneWayModelInternational(
      {this.name,
      this.travelmode,
      this.travelclass,
      this.origin,
      this.destination,
      this.traveldate,
      this.traveltime,
      this.eta,
      this.food,
      this.accomodation,
      this.bags,
      this.comments,
      this.hotel,
      this.occupancy,
      this.checkin,
      this.checkout,
      this.remarks,
      this.seat,
      this.weight,
      this.region,
      this.connectiontocurrencytable,
      this.insurancerequired,
      this.insurancetodate,
      this.insurancefromdate,
      this.insuranceavailability,
      this.insurancename,
      this.insurancevaliddate,
      this.visa,
      this.cab,
      this.purpose,
      this.connectiontotravellertable});
}
