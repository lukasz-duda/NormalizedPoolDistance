class Request {

    // The last time of normalizedDistance change is seconds. Toybox::Lang::Number
    var lastTime;
    
    // The last elapsedDistance reported by the device in meters. Toybox::Lang::Number
    var lastReportedDistance;
    
    // The last calculated distance according to maximumPace. Toybox::Lang::Number
    var normalizedDistance;
    
    // The maximum pace given by the user. Minimum number of seconds per 100 meters. Toybox::Lang::Number
    var maximumTempo;
    
    // The timerTime reported by the device in seconds. Toybox::Lang::Number
    var reportedTime;
    
    // elapsedDistance reported by the device in meters. Toybox::Lang::Number
    var reportedDistance;

    function setElapsedDistance(elapsedDistance) {
        reportedDistance = elapsedDistance != null ? elapsedDistance.toNumber() : 0;
    }
    
    function setTimerTime(timerTime) {
        reportedTime = timerTime != null ? timerTime / 1000 : 0;
    }
}