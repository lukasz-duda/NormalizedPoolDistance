class Response {

    // The last time of normalizedDistance change is seconds. Toybox::Lang::Number
    var lastTime;
    
    // The last elapsedDistance reported by the device in meters. Toybox::Lang::Number
    var lastReportedDistance;
    
    // The calculated distance according to maximumPace. Toybox::Lang::Number
    var normalizedDistance;

}