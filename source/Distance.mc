class Distance {

    function normalize(request) {
        var invalidReport = noMove(request) || tooFast(request); 
         
        if(invalidReport) {
            var response = new Response();
            response.lastDistanceTime = request.lastDistanceTime;
            response.lastReportedDistance = request.reportedDistance;
            response.normalizedDistance = request.normalizedDistance;
            return response;
        }
        else {
	        var response = new Response();
	        response.lastDistanceTime = request.reportedTime;
            response.lastReportedDistance = request.reportedDistance;
            var poolLength = request.reportedDistance - request.lastReportedDistance;
            response.normalizedDistance = request.normalizedDistance + poolLength;
	        return response;
        }        
    }
    
    function noMove(request) {
        var distanceDifference = request.reportedDistance - request.lastReportedDistance;
        return distanceDifference == 0;
    }
    
    function tooFast(request) {
        var distanceDifference = request.reportedDistance - request.lastReportedDistance;
        var bestPaceDistane = 100;
        var timeDifference = request.reportedTime - request.lastDistanceTime;
        var minimumTimeDifference = request.bestPace / (bestPaceDistane / distanceDifference);
        var tooFast = timeDifference < minimumTimeDifference;
        return tooFast;
    }
    
}