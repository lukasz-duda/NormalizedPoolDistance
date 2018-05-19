using Toybox.Test as Test;

class DistanceTest {

    (:test)
    function whenMaximumTempo_normalizedEqualsReported(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastDistance = 0;
        request.lastTime = 0;
        request.maximumTempo = 80;
        request.reportedTime = 20;
        request.reportedDistance = 25;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.reportedTime, response.lastTime);
        DistanceTest.assertEqual(request.reportedDistance, response.lastDistance);
        
        return true;
    }
    
    function assertEqual(expected, actual) {
        var message = actual + " should be equal to " + expected;
        Test.assertEqualMessage(expected, actual, message);
    }
    
    (:test)
    function whenTooFast_normalizedEqualsLast(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastDistance = 25;
        request.lastTime = 20;
        request.maximumTempo = 80;
        request.reportedTime = 39;
        request.reportedDistance = 50;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.lastTime, response.lastTime);
        DistanceTest.assertEqual(request.lastDistance, response.lastDistance);
        return true;
    }

}