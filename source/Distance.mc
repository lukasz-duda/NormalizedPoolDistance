class Distance {

    function normalize(request) {
        var response = new Response();
        response.lastTime = request.reportedTime;
        response.lastDistance = request.reportedDistance;
        return response;
    }
    
}