using Toybox.Test as Test;

class DistanceTest {

    (:test)
    function whenMaximumTempo_normalizedEqualsReported(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastReportedDistance = 0;
        request.lastTime = 0;
        request.normalizedDistance = 0;
        request.maximumTempo = 80;
        request.reportedTime = 20;
        request.reportedDistance = 25;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.reportedTime, response.lastTime);
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(request.reportedDistance, response.normalizedDistance);
        
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
        request.lastReportedDistance = 25;
        request.lastTime = 20;
        request.normalizedDistance = 0;
        request.maximumTempo = 80;
        request.reportedTime = 39;
        request.reportedDistance = 50;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.lastTime, response.lastTime);
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(request.lastReportedDistance, response.normalizedDistance);
        return true;
    }
    
    (:test)
    function whenNoMove_normalizedEqualsLast(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastReportedDistance = 25;
        request.lastTime = 20;
        request.maximumTempo = 80;
        request.reportedTime = 40;
        request.reportedDistance = 25;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.lastTime, response.lastTime);
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(request.lastReportedDistance, response.normalizedDistance);
        return true;
    }
    
    (:test)
    function afterInvalidPool_acceptsTheNextValid(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastReportedDistance = 50;
        request.lastTime = 20;
        request.normalizedDistance = 25;
        request.maximumTempo = 80;
        request.reportedTime = 40;
        request.reportedDistance = 75;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.reportedTime, response.lastTime);
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(50, response.normalizedDistance);
        return true;
    }

}