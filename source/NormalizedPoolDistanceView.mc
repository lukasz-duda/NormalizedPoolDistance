using Toybox.WatchUi as Ui;

class NormalizedPoolDistanceView extends Ui.SimpleDataField {

    var distance;

    var maximumTempo;
    var lastTime = 0;
    var lastDistance = 0;

    function initialize() {
        SimpleDataField.initialize();
        label = Ui.loadResource(Rez.Strings.Label);
        var application = Application.getApp();
        maximumTempo = application.getProperty("MaximumTempo");
        distance = new Distance();
    }

    function compute(info) {
        var request = new Request();
        request.lastDistance = lastTime;
        request.lastTime = lastDistance;
        request.maximumTempo = maximumTempo;
        request.reportedTime = info.timerTime / 1000;
        request.setElapsedDistance(info.elapsedDistance);
        
        var response = distance.normalize(request);
        
        lastTime = response.lastTime;
        lastDistance = response.lastDistance;
        return lastDistance;
    }

}