

class ServiceScrArg {
  final String serviceName;
  final int serviceTimeMin;
  ServiceScrArg(this.serviceName, this.serviceTimeMin);
}

class ChooseTimeScrArg {
  final String serviceName;
  final int serviceTimeMIn;
  final String selectedTime;
  final String selectedDate;

  ChooseTimeScrArg(this.serviceName, this.serviceTimeMIn, this.selectedTime,
      this.selectedDate);
}

class PatientDetailsArg {
  final String pFirstName;
  final String pLastName;
  final String pPhn;
  final String pEmail;
  final String pDOB;
  final String pCity;
  final String serviceName;
  final int serviceTimeMIn;
  final String selectedTime;
  final String selectedDate;
  PatientDetailsArg(
      this.pFirstName,
      this.pLastName,
      this.pPhn,
      this.pEmail,
      this.pDOB,
      this.pCity,
      this.serviceName,
      this.serviceTimeMIn,
      this.selectedTime,
      this.selectedDate);
}
