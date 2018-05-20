using Toybox.WatchUi as Ui;
using Toybox.FitContributor as Fit;

class NormalizedPoolDistanceView extends Ui.SimpleDataField {

    var distance;

    var bestPace;
    var lastReportedDistance = 0;
    var lastDistanceTime = 0;
    var normalizedDistance = 0;
    
    const NORMALIZED_DISTANCE_FIELD_ID = 0;
    const NORMALIZED_LAP_DISTANCE_FIELD_ID = 1;
    const NORMALIZED_SESSION_DISTANCE_FIELD_ID = 2;
    var normalizedDistanceField;
    var normalizedLapDistanceField;
    var normalizedSessionDistanceField;

    function initialize() {
        SimpleDataField.initialize();
        label = Ui.loadResource(Rez.Strings.FieldLabel);
        var application = Application.getApp();
        bestPace = application.getProperty("BestPace");
        distance = new Distance();
        
        createNormalizedDistanceFields();
    }
    
    function createNormalizedDistanceFields() {
        normalizedDistanceField = createField(
            "NormalizedDistance",
            NORMALIZED_DISTANCE_FIELD_ID,
            Fit.DATA_TYPE_UINT16,
            { :mesgType => Fit.MESG_TYPE_RECORD, :units => "m" });
            
        normalizedLapDistanceField = createField(
            "NormalizedLapDistance",
            NORMALIZED_LAP_DISTANCE_FIELD_ID,
            Fit.DATA_TYPE_UINT16,
            { :mesgType => Fit.MESG_TYPE_LAP, :units => "m" });
            
        normalizedSessionDistanceField = createField(
            "NormalizedSessionDistance",
            NORMALIZED_SESSION_DISTANCE_FIELD_ID,
            Fit.DATA_TYPE_UINT16,
            { :mesgType => Fit.MESG_TYPE_SESSION, :units => "m" });
            
        normalizedDistanceField.setData(0);
        normalizedLapDistanceField.setData(0);
        normalizedSessionDistanceField.setData(0);
    }

    function compute(info) {
        var request = new Request();
        request.lastReportedDistance = lastReportedDistance;
        request.normalizedDistance = normalizedDistance;
        request.lastDistanceTime = lastDistanceTime;
        request.bestPace = bestPace;
        request.setTimerTime(info.timerTime);
        request.setElapsedDistance(info.elapsedDistance);
        
        var response = distance.normalize(request);
        
        lastReportedDistance = response.lastReportedDistance;
        normalizedDistance = response.normalizedDistance;
        lastDistanceTime = response.lastDistanceTime;
        
        normalizedDistanceField.setData(normalizedDistance);
        normalizedLapDistanceField.setData(normalizedDistance);
        normalizedSessionDistanceField.setData(normalizedDistance);
        
        return normalizedDistance;
    }

}