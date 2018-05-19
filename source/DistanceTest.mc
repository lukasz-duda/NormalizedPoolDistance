using Toybox.Test as Test;

class DistanceTest {

    (:test)
    function withMaximumTempo_normalizedEqualsReported(logger) {
        var distance = new Distance();
        var reportedTime = 20;
        
        var request = new Request();
        request.lastDistance = 0;
        request.lastTime = 0;
        request.maximumTempo = 80;
        request.reportedTime = reportedTime;
        request.reportedDistance = 25;
        
        var response = distance.normalize(request);
        
        Test.assertEqual(reportedTime, response.lastTime);
        Test.assertEqual(request.reportedDistance, response.lastDistance);
        
        return true;
    }

}