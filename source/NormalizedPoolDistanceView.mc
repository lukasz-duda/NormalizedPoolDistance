using Toybox.WatchUi as Ui;
using Toybox.FitContributor as Fit;

class NormalizedPoolDistanceView extends Ui.SimpleDataField {

    var bestPace;
    var distance;
    
    const NORMALIZED_DISTANCE_FIELD_ID = 0;
    var normalizedDistanceField;
    
    var lastReportedDistance = 0;
    var lastDistanceTime = 0;
    var normalizedDistance = 0;
    
    var timerRunning = false;

    function initialize() {
        SimpleDataField.initialize();
        label = Ui.loadResource(Rez.Strings.FieldLabel);
        
        var application = Application.getApp();
        bestPace = application.getProperty("BestPace");
        distance = new Distance();
        
        createNormalizedDistanceField();
    }
    
    function createNormalizedDistanceField() {
            
        normalizedDistanceField = createField(
            "NormalizedDistance",
            NORMALIZED_DISTANCE_FIELD_ID,
            Fit.DATA_TYPE_UINT16,
            { :nativeNum => 5, :mesgType => Fit.MESG_TYPE_LAP, :units => "m" });
            
        normalizedDistanceField.setData(0);
    }

    function compute(info) {
        if(timerRunning) {
            normalizeDistance(info);
            normalizedDistanceField.setData(normalizedDistance);
        }
        
        return normalizedDistance;
    }
    
    function normalizeDistance(info) {
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
    }

    function onTimerStart() {
        timerRunning = true;
    }

    function onTimerStop() {
        timerRunning = false;
    }

    function onTimerPause() {
        timerRunning = false;
    }

    function onTimerResume() {
        timerRunning = true;
    }

    function onTimerLap() {
        lastReportedDistance = 0;
        lastDistanceTime = 0;
        normalizedDistance = 0;
    }

    function onTimerReset() {
        lastReportedDistance = 0;
        lastDistanceTime = 0;
        normalizedDistance = 0;
    }

}