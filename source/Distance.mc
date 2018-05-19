class Distance {

    function normalize(request) {
        var distanceDifference = request.reportedDistance - request.lastDistance;
        var tempoDistance = 100;
        var timeDifference = request.reportedTime - request.lastTime;
        var minimumTimeDifference = request.maximumTempo / (tempoDistance / distanceDifference);
        var tooFast = timeDifference < minimumTimeDifference;
        
        if(tooFast) {
            var response = new Response();
            response.lastTime = request.lastTime;
            response.lastDistance = request.lastDistance;
            return response;
        }
        else {
	        var response = new Response();
	        response.lastTime = request.reportedTime;
	        response.lastDistance = request.reportedDistance;
	        return response;
        }        
    }
    
}