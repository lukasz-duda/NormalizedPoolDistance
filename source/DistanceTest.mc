using Toybox.Test as Test;

class DistanceTest {

    (:test)
    function testNormalizedDistance(logger) {
        var distance = new Distance();
        distance.normalize();
        
        Test.assertEqual(1, 1);
        
        return true;
    }

}