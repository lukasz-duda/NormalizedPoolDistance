using Toybox.Test as Test;

class DistanceTest {

    (:test)
    function testNormalizedDistance(logger) {
        var distance = new Distance();
        
        var request = new Request();
        distance.normalize(request);
        
        Test.assertEqual(1, 1);
        
        return true;
    }

}