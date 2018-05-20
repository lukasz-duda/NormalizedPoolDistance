class Distance {

    function normalize(request) {
        var invalidReport = noMove(request) || tooFast(request); 
         
        if(invalidReport) {
            var response = new Response();
            response.lastTime = request.lastTime;
            response.lastReportedDistance = request.reportedDistance;
            response.normalizedDistance = request.lastReportedDistance;
            return response;
        }
        else {
	        var response = new Response();
	        response.lastTime = request.reportedTime;
            response.lastReportedDistance = request.reportedDistance;
            var poolLength = request.reportedDistance - request.lastReportedDistance;
            response.normalizedDistance = (request.normalizedDistance + poolLength).toNumber();
	        return response;
        }        
    }
    
    function noMove(request) {
        var distanceDifference = request.reportedDistance - request.lastReportedDistance;
        return distanceDifference == 0;
    }
    
    function tooFast(request) {
        var distanceDifference = request.reportedDistance - request.lastReportedDistance;
        var tempoDistance = 100;
        var timeDifference = request.reportedTime - request.lastTime;
        var minimumTimeDifference = request.maximumTempo / (tempoDistance / distanceDifference);
        var tooFast = timeDifference < minimumTimeDifference;
        return tooFast;
    }
    
}