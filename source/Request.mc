class Request {

    var lastTime;
    var lastReportedDistance;
    var normalizedDistance;
    var maximumTempo;
    var reportedTime;
    var reportedDistance;

    function setElapsedDistance(elapsedDistance) {
        reportedDistance = elapsedDistance != null ? elapsedDistance : 0;
    }
    
    function setTimerTime(timerTime) {
        reportedTime = timerTime != null ? timerTime / 1000 : 0;
    }
}