class Distance {

    function normalize(request) {
        var invalidReport = noMove(request) || tooFast(request); 
         
        if(invalidReport) {
            var response = new Response();
            response.lastTime = request.lastTime;
            response.lastDistance = request.lastDistance;
            return response;
        }
        else {
	        var response = new Response();
	        response.lastTime = request.reportedTime;
	        response.lastDistance = request.reportedDistance.toNumber();
	        return response;
        }        
    }
    
    function noMove(request) {
        var distanceDifference = request.reportedDistance - request.lastDistance;
        return distanceDifference == 0;
    }
    
    function tooFast(request) {
        var distanceDifference = request.reportedDistance - request.lastDistance;
        var tempoDistance = 100;
        var timeDifference = request.reportedTime - request.lastTime;
        var minimumTimeDifference = request.maximumTempo / (tempoDistance / distanceDifference);
        var tooFast = timeDifference < minimumTimeDifference;
        return tooFast;
    }
    
}