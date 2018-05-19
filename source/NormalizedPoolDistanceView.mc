using Toybox.WatchUi as Ui;
using Toybox.FitContributor as Fit;

class NormalizedPoolDistanceView extends Ui.SimpleDataField {

    var distance;

    var maximumTempo;
    var lastTime = 0;
    var lastDistance = 0;
    
    var normalizedDistanceField;
    const NORMALIZED_DISTANCE_FIELD_ID = 0;

    function initialize() {
        SimpleDataField.initialize();
        label = Ui.loadResource(Rez.Strings.Label);
        var application = Application.getApp();
        maximumTempo = application.getProperty("MaximumTempo");
        distance = new Distance();
        
        createNormalizedDistanceField();
    }
    
    function createNormalizedDistanceField() {
        normalizedDistanceField = createField(
            label,
            NORMALIZED_DISTANCE_FIELD_ID,
            FitContributor.DATA_TYPE_UINT16,
            { :mesgType => Fit.MESG_TYPE_RECORD, :units => "m" });
    }

    function compute(info) {
        var request = new Request();
        request.lastDistance = lastTime;
        request.lastTime = lastDistance;
        request.maximumTempo = maximumTempo;
        request.setTimerTime(info.timerTime);
        request.setElapsedDistance(info.elapsedDistance);
        
        var response = distance.normalize(request);
        
        lastTime = response.lastTime;
        lastDistance = response.lastDistance;
        
        normalizedDistanceField.setData(lastDistance);
        
        return lastDistance;
    }

}