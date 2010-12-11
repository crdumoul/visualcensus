// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

google.load("visualization", "1", {packages:["corechart"]});

function buildData(values) {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('number', 'Value');
    data.addRows(values.length);
    for(i = 0 ; i < values.length ; ++i) {
        data.setValue(i, 0, values[i].name);
        data.setValue(i, 1, values[i].value);
    }
    return data;
}

function drawPie(div, title, width, height, fontSize, values) {
    var data = buildData(values);
    var chart = new google.visualization.PieChart(document.getElementById(div));
    chart.draw(data, {title: title, width: width, height: height, legend: 'none',
                      chartArea: {left:'10%', top:'10%', width: '80%', height: '80%'},
                      titleTextStyle: {color: 'black', fontSize: 16},
                      pieSliceTextStyle: {color: 'black', fontSize: fontSize},
                      tooltipTextStyle: {color: 'black', fontSize: 16}});
}

function drawColumn(div, title, width, height, x_axis, y_axis, values) {
    var data = buildData(values);
    var chart = new google.visualization.ColumnChart(document.getElementById(div));
    chart.draw(data, {title: title, width: width, height: height, legend: 'none',
                      titleTextStyle: {fontSize: 16},
                      hAxis: {title: x_axis, slantedTextAngle: 60, textStyle: {fontSize: 16}},
                      vAxis: {title: y_axis}, textStyle: {fontSize: 16},
                      tooltipTextStyle: {fontSize: 16}});
}
