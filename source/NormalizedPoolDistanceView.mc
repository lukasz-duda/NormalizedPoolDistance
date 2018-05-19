using Toybox.WatchUi as Ui;

class NormalizedPoolDistanceView extends Ui.SimpleDataField {

    function initialize() {
        SimpleDataField.initialize();
        label = Ui.loadResource(Rez.Strings.Label);
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        return 0.0;
    }

}