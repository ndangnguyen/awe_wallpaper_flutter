class CountriesResponse {
    List<String> response;
    int results;

    CountriesResponse({this.response, this.results});

    factory CountriesResponse.fromJson(Map<String, dynamic> json) {
        return CountriesResponse(
            response: json['response'] != null ? new List<String>.from(json['response']) : null, 
            results: json['results'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['results'] = this.results;
        if (this.response != null) {
            data['response'] = this.response;
        }
        return data;
    }
}