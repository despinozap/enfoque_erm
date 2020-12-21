var chart6;
var chart7;
var chart8;
var chart9;

var g1;
var g2;
var g3;
var g4;
var g5;
var g6;
var g7;

function update_justgage(_id,_value){//, _min, _max,_title,_label){
    /*var g = new JustGage({
    id: _id,
    value: _value,
    min: _min,
    max: _max,
    title: _title,
    label: _label
  });*/
  switch (_id) {
        case 1:/* g1.refresh(_value);*/alert("g1"); break;
        case 2: g2.refresh(_value); break;
        case 3: g3.refresh(_value); break;
    } 
  
}
function update_pie(id, value) {
    switch (id) {
        case 7: chart7.update(value); break;
        case 8: chart8.update(value); break;
        case 9: chart9.update(value); break;
    }    
}
function pie_chart(){
//Pie 1
		$('#pie_1').easyPieChart({
			easing: 'easeOutBounce',
			onStep: function(from, to, percent) {
				$(this.el).find('.percent').text(Math.round(percent)+"%");
			},
			lineWidth: 6,
			barColor: '#F0AD4E'
		});
		var chart1 = window.chart = $('#pie_1').data('easyPieChart');
		
		//Pie 2
		$('#pie_2').easyPieChart({
			easing: 'easeOutBounce',
			onStep: function(from, to, percent) {
				$(this.el).find('.percent').text(Math.round(percent)+"%");
			},
			lineWidth: 6,
			barColor: '#D9534F'
		});
		var chart2 = window.chart = $('#pie_2').data('easyPieChart');
		
		//Pie 3
		$('#pie_3').easyPieChart({
			easing: 'easeOutBounce',
			onStep: function(from, to, percent) {
				$(this.el).find('.percent').text(Math.round(percent)+"%");
			},
			lineWidth: 6,
			barColor: '#70AFC4'
		});
		var chart3 = window.chart = $('#pie_3').data('easyPieChart');
}

function dash_pie() {
    //Pie 1
    $('#dash_pie_1').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.purple
    });
    var chart1 = window.chart = $('#dash_pie_1').data('easyPieChart');
    //Pie 2
    $('#dash_pie_2').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.yellow
    });
    var chart2 = window.chart = $('#dash_pie_2').data('easyPieChart');
    //Pie 3
    $('#dash_pie_3').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.red
    });
    var chart3 = window.chart = $('#dash_pie_3').data('easyPieChart');
    //Pie 4
    $('#dash_pie_4').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.purple
    });
    var chart4 = window.chart = $('#dash_pie_4').data('easyPieChart');
    //Pie 5
    $('#dash_pie_5').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.blue
    });
    var chart5 = window.chart = $('#dash_pie_5').data('easyPieChart');
    //Pie 6
    $('#dash_pie_6').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.green
    });
    chart6 = window.chart = $('#dash_pie_6').data('easyPieChart');
    //Pie 7
    $('#dash_pie_7').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.orange
    });
    chart7 = window.chart = $('#dash_pie_7').data('easyPieChart');
    //Pie 8
    $('#dash_pie_8').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.red
    });
    chart8 = window.chart = $('#dash_pie_8').data('easyPieChart');
    //Pie 9
    $('#dash_pie_9').easyPieChart({
        easing: 'easeOutBounce',
        onStep: function (from, to, percent) {
            $(this.el).find('.percent').text(Math.round(percent) + "%");
        },
        lineWidth: 6,
        barColor: Theme.colors.pink
    });
    chart9 = window.chart = $('#dash_pie_9').data('easyPieChart');

}
    //Revenue chart
    function chart_revenue() {
    var likes = [[1, Math.random()*100], [2, Math.random()*100], [3, Math.random()*100], [4, Math.random()*100],[5,Math.random()*100],[6, Math.random()*100],[7, Math.random()*100],[8, Math.random()*100],[9, Math.random()*100],[10, Math.random()*100],[11, Math.random()*100],[12, Math.random()*100]];
    
    var chartColor = $(this).parent().parent().css("color");
			
    var plot = $.plot($("#chart-revenue"),
    [ { data: likes} ], {
	    series: {
		    label: "like",
		    lines: { 
			    show: true,
			    lineWidth: 3, 
			    fill: false
		    },
		    points: { 
			    show: true, 
			    lineWidth: 3,
			    fill: true,
			    fillColor: chartColor 
		    },	
		    shadowSize: 0
	    },
	    grid: { hoverable: true, 
			    clickable: true, 
			    tickColor: "rgba(255,255,255,.15)",
			    borderColor: "rgba(255,255,255,0)"
			    },
	    colors: ["#fff"],
	    xaxis: {
		    font: {
			    color: "#fff"
		    },
		    ticks:6, 
		    tickDecimals: 0, 
		    tickColor: chartColor,
	    },
	    yaxis: {
		    font: {
			    color: "#fff"
		    },
		    ticks:4, 
		    tickDecimals: 0,
		    autoscaleMargin: 0.000001
	    },
	    legend: {
		    show: false
	    }
	    });
    function showTooltip(x, y, contents) {
		    $('<div id="tooltip">' + contents + '</div>').css( {
			    position: 'absolute',
			    display: 'none',
			    top: y + 5,
			    left: x + 5,
			    border: '1px solid #fdd',
			    padding: '2px',
			    'background-color': '#dfeffc',
			    opacity: 0.80
		    }).appendTo("body").fadeIn(200);
	    }

	    var previousPoint = null;
	    $("#chart-revenue").bind("plothover", function (event, pos, item) {
		    $("#x").text(pos.x.toFixed(2));
		    $("#y").text(pos.y.toFixed(2));

			    if (item) {
				    if (previousPoint != item.dataIndex) {
					    previousPoint = item.dataIndex;

					    $("#tooltip").remove();
					    var x = item.datapoint[0].toFixed(2),
						    y = item.datapoint[1].toFixed(2);

					    showTooltip(item.pageX, item.pageY,
								    item.series.label + " on " + x + " = " + y);
				    }
			    }
			    else {
				    $("#tooltip").remove();
				    previousPoint = null;
			    }
	    });
}
var grafico = function () {
	/*-----------------------------------------------------------------------------------*/
	/*	Justgage
	/*-----------------------------------------------------------------------------------*/
	var handleGage = function () {
		var g1, g2, g3, g4, g5, g6;      
      window.onload = function(){
      g1 = new JustGage({
        id: "g1", 
        value: getRandomInt(0, 100), 
        min: 0,
        max: 100,
        title: "Custom Width",
        label: "",    
        gaugeWidthScale: 0.2
      });      
      g2 = new JustGage({
        id: "g2", 
        value: getRandomInt(0, 100), 
        min: 0,
        max: 100,
        title: "Custom Shadow",
        label: "",    
        shadowOpacity: 1,
        shadowSize: 0,
        shadowVerticalOffset: 4	
      });      
      g3 = new JustGage({
        id: "g3", 
        value: getRandomInt(0, 100), 
        min: 0,
        max: 100,
        title: "Custom Colors",
        label: "",  
        levelColors: [Theme.colors.red, Theme.colors.yellow, Theme.colors.green]
      });      
      g4 = new JustGage({
        id: "g4", 
        value: getRandomInt(0, 100), 
        min: 0,
        max: 100,
        title: "Hide Labels",
        showMinMax: false		
      });     
      g5 = new JustGage({
        id: "g5", 
        value: getRandomInt(0, 100), 
        min: 0,
        max: 100,
        title: "Animation Type",
        label: "",  
        startAnimationTime: 2000,
        startAnimationType: ">",
        refreshAnimationTime: 1000,
        refreshAnimationType: "bounce"			
      });      
      g6 = new JustGage({
        id: "g6", 
        value: getRandomInt(0, 100), 
        min: 0,
        max: 100,
        title: "Minimal",
        label: "",  
        showMinMax: false,
        gaugeColor: "#E6E6E6",
        levelColors: ["#555555"],
        showInnerShadow: false,        
        startAnimationTime: 1,
        startAnimationType: "linear",
        refreshAnimationTime: 1,
        refreshAnimationType: "linear"          
      });/*      
        setInterval(function() {
          g1.refresh(getRandomInt(0, 100));
          g2.refresh(getRandomInt(0, 100));          
          g3.refresh(getRandomInt(0, 100));
          g4.refresh(getRandomInt(0, 100));
          g5.refresh(getRandomInt(0, 100));          
          g6.refresh(getRandomInt(0, 100));
        }, 2500);*/
      };
	}	
    return {
        init: function () {
            if (App.isPage("Home")) {
            }
            handleGage();//funcion del grafico
        },
    };
}();
(function (a, b) {
    a.fn.admin_tree = function (d) {
        var c = {
            "open-icon": "fa fa-folder-open",
            "close-icon": "fa fa-folder",
            selectable: true,
            "selected-icon": "fa fa-check",
            "unselected-icon": "tree-dot"
        };
        c = a.extend({}, c, d);
        this.each(function () {
            var e = a(this);
            e.html('<div class = "tree-folder" style="display:none;">				<div class="tree-folder-header">					<i class="' + c["close-icon"] + '"></i>					<div class="tree-folder-name"></div>				</div>				<div class="tree-folder-content"></div>				<div class="tree-loader" style="display:none"></div>			</div>			<div class="tree-item" style="display:none;">				' + (c["unselected-icon"] == null ? "" : '<i class="' + c["unselected-icon"] + '"></i>') + '				<div class="tree-item-name"></div>			</div>');
            e.addClass(c.selectable == true ? "tree-selectable" : "tree-unselectable");
            e.tree(c)
        });
        return this
    }
})(window.jQuery);
(function () {
    this.Theme = (function () {
        function Theme() {}
        Theme.colors = {
			white: "#FFFFFF",
			primary: "#5E87B0",
            red: "#D9534F",
            green: "#A8BC7B",
            blue: "#70AFC4",
            orange: "#F0AD4E",
			yellow: "#FCD76A",
            gray: "#6B787F",
            lightBlue: "#D4E5DE",
			purple: "#A696CE",
			pink: "#DB5E8C",
			dark_orange: "#F38630"
        };
        return Theme;
    })();
})(window.jQuery);