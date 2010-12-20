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

function setupCategoryLinks() {
    $(".inactive_tab").click(function() {
        $("#loading_dialog").show();
        $(".table_name").fadeTo(200, 0);
        $(".table_row").fadeTo(200, 0);
        $.post($(this).attr("href"), null, null, "script");
        return false;
    });
}

var which_ward = '2';

$(document).ready(function () {
    $("#minimizer").toggle(function() {
        $("#map_div").animate({width:"0px", height:"0px"}, "fast");
        $(this).attr({src:"/images/up_chevron.jpg"});
        $("#which_ward_div").hide();
    },function() {
        $(this).attr({src:"/images/down_chevron.jpg"});
        $("#map_div").animate({width:"400px", height:"300px"}, "fast");
        $("#which_ward_div").show();
    });
    setupCategoryLinks();
    $("#loading_dialog").hide();

    if(which_ward == '1') {
        $("#which_ward1_radio").attr("checked", true);
    } else {
        $("#which_ward2_radio").attr("checked", true);
    }

    $(".which_ward_radio").click(function() {
        which_ward = $(this).attr("value");
    });

});
