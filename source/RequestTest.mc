using Toybox.Test as Test;

class RequestTest {

    (:test)
    function setElapsedDistance_setsReportedDistance(logger) {
        var request = new Request();
        
        request.setElapsedDistance(123.45);
        
        RequestTest.assertEqual(123.45, request.reportedDistance);
        return true; 
    }
    
    function assertEqual(expected, actual) {
        var message = actual + " should be equal to " + expected;
        Test.assertEqualMessage(expected, actual, message);
    }

    (:test)
    function nullElapsedDistance(logger) {
        var request = new Request();
        
        request.setElapsedDistance(null);
        
        RequestTest.assertEqual(0, request.reportedDistance);
        return true;        
    }

    (:test)
    function setTimerTime_setsReportedTime(logger) {
        var request = new Request();
        
        request.setTimerTime(123000);
        
        RequestTest.assertEqual(123, request.reportedTime);
        return true; 
    }
    
}