using Toybox.Test as Test;

class DistanceTest {

    (:test)
    function whenbestPace_normalizedEqualsReported(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastReportedDistance = 0;
        request.normalizedDistance = 0;
        request.lastDistanceTime = 0;
        request.bestPace = 80;
        request.reportedTime = 20;
        request.reportedDistance = 25;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(request.reportedDistance, response.normalizedDistance);
        DistanceTest.assertEqual(request.reportedTime, response.lastDistanceTime);
        
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
        request.normalizedDistance = 0;
        request.lastDistanceTime = 20;
        request.bestPace = 80;
        request.reportedTime = 39;
        request.reportedDistance = 50;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(request.lastReportedDistance, response.normalizedDistance);
        DistanceTest.assertEqual(request.lastDistanceTime, response.lastDistanceTime);
        return true;
    }
    
    (:test)
    function whenNoMove_normalizedEqualsLast(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastReportedDistance = 25;
        request.normalizedDistance = 25;
        request.lastDistanceTime = 20;
        request.bestPace = 80;
        request.reportedTime = 40;
        request.reportedDistance = 25;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(request.lastReportedDistance, response.normalizedDistance);
        DistanceTest.assertEqual(request.lastDistanceTime, response.lastDistanceTime);
        return true;
    }
    
    (:test)
    function afterInvalidPool_acceptsTheNextValid(logger) {
        var distance = new Distance();
        
        var request = new Request();
        request.lastReportedDistance = 50;
        request.normalizedDistance = 25;
        request.lastDistanceTime = 20;
        request.bestPace = 80;
        request.reportedTime = 40;
        request.reportedDistance = 75;
        
        var response = distance.normalize(request);
        
        DistanceTest.assertEqual(request.reportedDistance, response.lastReportedDistance);
        DistanceTest.assertEqual(50, response.normalizedDistance);
        DistanceTest.assertEqual(request.reportedTime, response.lastDistanceTime);
        return true;
    }

}