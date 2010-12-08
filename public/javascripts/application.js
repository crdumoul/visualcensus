// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
	'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

google.load("visualization", "1", {packages:["corechart"]});

function drawChart(div, title, width, height, fontSize, values) {
    data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('number', 'Value');
    data.addRows(values.length);
		for(i = 0 ; i < values.length ; ++i) {
			data.setValue(i, 0, values[i].name);
			data.setValue(i, 1, values[i].value);
		}

    var chart = new google.visualization.PieChart(document.getElementById(div));
    chart.draw(data, {title: title, width: width, height: height, legend: 'none',
                      chartArea: {left:'10%', top:'10%', width: '80%', height: '80%'},
                      titleTextStyle: {color: 'black', fontSize: 16},
                      pieSliceTextStyle: {color: 'black', fontSize: fontSize},
                      tooltipTextStyle: {color: 'black', fontSize: 16}});
}
