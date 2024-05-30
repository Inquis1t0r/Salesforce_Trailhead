// Declarations
let config = {
  measures: [60, 90, 100],
  measureColors: [],
};

let chartReference;

const selectors = {
  chart: "#Chart",
};

// React specific Callbacks
function connectCallback() {
  renderChart();
}

function disconnectCallback() {
  if (PluginManager.helpers.isDefined(chartReference)) {
    chartReference.destroy();
  }
}

function renderCallback() {
  inputChanged();
}
function setStyles() {
  config.measureColors = [
    PluginManager.pluginConfiguration.Color15,
    PluginManager.pluginConfiguration.Color16,
    PluginManager.pluginConfiguration.Color14
  ];
}

function inputChanged() {
  if (PluginManager.helpers.isDefined(chartReference)) {
    chartReference.load({
      columns: [[PluginManager.locale.labels.CardReportingCompetitorRate_Title, PluginManager.competitorRate]],
    });
  }
}

function renderChart() {
  if (PluginManager.helpers.isDefined(PluginManager.competitorRate)) {
    //destroy chart object before setting new reference
    if (PluginManager.helpers.isDefined(chartReference)) {
      chartReference.destroy();
    }
    //set styles and colors
    if (PluginManager.helpers.isDefined(PluginManager.pluginConfiguration)) {
      setStyles();
    }
    //create chart
    chartReference = c3.generate({
      bindto: selectors.chart,
      data: {
        columns: [
          [PluginManager.locale.labels.CardReportingCompetitorRate_Title, PluginManager.competitorRate],
        ],
        type: "gauge",
      },
      gauge: {},
      color: {
        pattern: config.measureColors, // the three color levels for the percentage values.
        threshold: {
          values: config.measures,
        },
      },
      size: {
        height: 140,
      },
      tooltip: {
        show: false
      }
    });
  }
}
