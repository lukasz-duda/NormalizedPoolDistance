class Request {

    var lastTime;
    var lastDistance;
    var maximumTempo;
    var reportedTime;
    var reportedDistance;

    function setElapsedDistance(elapsedDistance) {
        reportedDistance = elapsedDistance != null ? elapsedDistance : 0;
    }
    
    function setTimerTime(timerTime) {
        reportedTime = timerTime / 1000;
    }
}