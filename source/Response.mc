class Response {

    // The elapsed distance of the current activity reported by the device in meters. Toybox::Lang::Number
    var lastReportedDistance;
    
    // The calculated distance in meters according to best pace. Toybox::Lang::Number
    var normalizedDistance;
    
    // The last time of normalized distance change is seconds. Toybox::Lang::Number
    var lastDistanceTime;

}