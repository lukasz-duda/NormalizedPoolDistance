using Toybox.WatchUi as Ui;
using Toybox.FitContributor as Fit;

class NormalizedPoolDistanceView extends Ui.SimpleDataField {

    var distance;

    var maximumTempo;
    var lastTime = 0;
    var lastReportedDistance = 0;
    var normalizedDistance = 0;
    
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
            "NormalizedDistance",
            NORMALIZED_DISTANCE_FIELD_ID,
            Fit.DATA_TYPE_UINT16,
            { :mesgType => Fit.MESG_TYPE_RECORD, :units => "m" });
    }

    function compute(info) {
        var request = new Request();
        request.lastReportedDistance = lastReportedDistance;
        request.lastTime = lastTime;
        request.normalizedDistance = normalizedDistance;
        request.maximumTempo = maximumTempo;
        request.setTimerTime(info.timerTime);
        request.setElapsedDistance(info.elapsedDistance);
        
        var response = distance.normalize(request);
        
        lastTime = response.lastTime;
        lastReportedDistance = response.lastReportedDistance;
        normalizedDistance = response.normalizedDistance;
        
        normalizedDistanceField.setData(normalizedDistance);
        
        return normalizedDistance;
    }

}