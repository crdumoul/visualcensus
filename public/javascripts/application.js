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

function drawPie(div, values) {
    var data = buildData(values);
    var chart = new google.visualization.PieChart(document.getElementById(div));
    chart.draw(data, {width: 500, height: 400, legend: 'none',
                      chartArea: {width: '80%', height: '100%'},
                      pieSliceTextStyle: {color: 'black', fontSize: 12},
                      tooltipTextStyle: {color: 'black', fontSize: 16}});
}

function drawColumn(div, x_axis, y_axis, values) {
    var data = buildData(values);
    var chart = new google.visualization.ColumnChart(document.getElementById(div));
    chart.draw(data, {width: 500, height: 500, legend: 'none',
                      chartArea: {left:'10%', top:'5%', width: '90%', height: '75%'},
                      hAxis: {title: x_axis, slantedTextAngle: 60, textStyle: {fontSize: 16}},
                      vAxis: {title: y_axis}, textStyle: {fontSize: 16},
                      tooltipTextStyle: {fontSize: 16}});
}

$(document).ready(function () {
    $("#minimizer").toggle(function() {
        $("#top_div").animate({width:"0px", height:"0px"}, "fast");
        $(this).attr({src:"/images/up_chevron.jpg"});
        $("#click_me").hide("fast");
    },function() {
        $(this).attr({src:"/images/down_chevron.jpg"});
        $("#top_div").animate({width:"400px", height:"200px"}, "fast");
        $("#click_me").show("fast");
    });
});
