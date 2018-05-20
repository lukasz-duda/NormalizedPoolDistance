class Request {

    // The previous elapsed distance of the current activity reported by the device in meters. Toybox::Lang::Number
    var lastReportedDistance;
    
    // The last calculated distance in meters according to best pace. Toybox::Lang::Number
    var normalizedDistance;
    
    // The last time of normalized distance change is seconds. Toybox::Lang::Number
    var lastDistanceTime;
    
    // The best pace given by the user. Minimum number of seconds per 100 meters. Toybox::Lang::Number
    var bestPace;
    
    // The current timer value in seconds reported by the device. Toybox::Lang::Number
    var reportedTime;
    
    //  The elapsed distance of the current activity in meters reported by the device. Toybox::Lang::Number
    var reportedDistance;

    function setElapsedDistance(elapsedDistance) {
        reportedDistance = elapsedDistance != null ? elapsedDistance.toNumber() : 0;
    }
    
    function setTimerTime(timerTime) {
        reportedTime = timerTime != null ? timerTime / 1000 : 0;
    }
}