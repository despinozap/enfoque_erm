var usuario = function () {
    /*-----------------------------------------------------------------------------------*/
	/*	Bootbox alerts
	/*-----------------------------------------------------------------------------------*/
	var handleBootbox = function () {
		$(".basic-alert").click(function(){
			bootbox.alert("Hello World");
		});
		$(".confirm-dialog").click(function(){
			bootbox.confirm("Are you sure?", function(result){});
		});
		$(".multiple-buttons").click(function(){
			bootbox.dialog({
			message: "I am a custom dialog",
			title: "Custom title",
			buttons: {
				success: {
					label: "Success!",
					className: "btn-success",
					callback: function() {
					Example.show("great success");
					}
				},
				danger: {
					label: "Danger!",
					className: "btn-danger",
					callback: function() {
					Example.show("uh oh, look out!");
					}
				},
				main: {
					label: "Click ME!",
					className: "btn-primary",
					callback: function() {
					Example.show("Primary button");
					}
				}
			}
			});
		});
		$(".multiple-dialogs").click(function(){
			bootbox.alert("In 1 second a new modal will open");
			setTimeout(function() {
				bootbox.dialog({
			message: "Will you purchase this awesome theme",
			title: "Pop quiz",
			buttons: {
				success: {
					label: "Yes!",
					className: "btn-success",
					callback: function() {
						bootbox.alert("Congratulations! You made the right decision.", function(){
							$(".bootbox").modal("hide");
						});
					}
				},
				danger: {
					label: "No!",
					className: "btn-danger",
					callback: function() {
						bootbox.alert("Oops, we're sorry to hear that!", function(){
							$(".bootbox").modal("hide");
						});
						
					}
				},
				main: {
					label: "Click ME!",
					className: "btn-primary",
					callback: function() {
						bootbox.alert("Hello World", function(){
							$(".bootbox").modal("hide");
						});
					}
				}
			}
			});
			}, 1000);
		});
		$(".programmatic-close").click(function(){
			bootbox.alert("In 3 second this modal will close..");
			setTimeout(function() {
				$(".bootbox").modal("hide");
			}, 3000);
		});
		
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Magic Suggest
	/*-----------------------------------------------------------------------------------*/
	var handleMagicSuggest = function () {
		var jsonData = [];
            var cities = 'New York,Los Angeles,Chicago,Houston,Paris,Marseille,Toulouse,Lyon,Bordeaux,Philadelphia,Phoenix,San Antonio,San Diego,Dallas,San Jose,Jacksonville'.split(',');
            for(var i=0;i<cities.length;i++) jsonData.push({id:i,name:cities[i],status:i%2?'Already Visited':'Planned for visit',coolness:Math.floor(Math.random() * 10) + 1});
            var ms1 = $('#ms1').magicSuggest({
                data: jsonData,
                sortOrder: 'name',
                value: [0],
                selectionPosition: 'right',
                groupBy: 'status',
                maxDropHeight: 200
            });
            var ms2 = $('#ms2').magicSuggest({
				width: '80%',
                data: jsonData
            });
            var ms3 = $('#ms3').magicSuggest({
                selectionPosition: 'bottom',
                renderer: function(city){
                    return '<div>' +
                            '<div style="font-family: Arial; font-weight: bold">' + city.name + '</div>' +
                            '<div><b>Cooooolness</b>: ' + city.coolness + '</div>' +
                           '</div>';
                },
                minChars: 1,
                selectionStacked: true,
                data: jsonData
            });
            var ms4 = $('#ms4').magicSuggest({
                data: [{id:1,label:'one'}, {id:2,label:'two'}, {id:3,label:'three'}],
                displayField: 'label',
                value: [1,3]
            });
            var ms5 = $('#ms5').magicSuggest({
                width: '80%',
                data: 'marilyn@monroe.com,mother@teresa.com,john@kennedy.com,martin@luther.com,nelson@mandela.com,'+
				'winston@churchill.com,bill@gates.com,muhammad@ali.com,mahatma@gandhi.com,margaret@thatcher.com,charles@gaulle.com,'+
				'christopher@colombus.com,george@orwell.com,charles@darwin.com,elvis@presley.com,albert@einstein.com,paul@mccartney.com,'+
				'queen@elizabeth.com,queen@victoria.com,john@keynes.com,mikhail@gorbachev.com,jawaharlal@nehru.com,leonardo@vinci.com,louis@pasteur.com,'+
				'leo@tolstoy.com,pablo@picasso.com,vincent@gogh.com,franklin@roosevelt.com,john@paul.com,neil@armstrong.com,'+
				'thomas@edison.com,rosa@parks.com,aung@kyi.com,lyndon@johnson.com,ludwig@beethoven.com,oprah@winfrey.com,indira@gandhi.com,'+
				'eva@peron.com,benazir@bhutto.com,desmond@tutu.com,dalai@lama.com,walt@disney.com,peter@sellers.com,barack@obama.com,malcolm@x.com,'+
				'richard@branson.com,jesse@owens.com,ernest@hemingway.com,john@lennon.com,henry@ford.com,haile@selassie.com,joseph@stalin.com,'+
				'lord@baden.com,michael@jordon.com,george@bush.com,osama@laden.com,fidel@castro.com,oscar@wilde.com,coco@chanel.com,'+
				'amelia@earhart.com,adolf@hitler.com,mary@magdalene.com,alfred@hitchcock.com,michael@jackson.com,mata@hari.com,emmeline@pankhurst.com,'+
				'ronald@reagan.com,lionel@messi.com,babe@ruth.com,bob@geldof.com,leon@trotsky.com,roger@federer.com,sigmund@freud.com,'+
				'woodrow@wilson.com,mao@zedong.com,katherine@hepburn.com,audrey@hepburn.com,david@beckham.com,tiger@woods.com,usain@bolt.com,'+
				'bill@cosby.com,carl@lewis.com,prince@charles.com,jacqueline@onassis.com,billie@holiday.com,virginia@woolf.com,billie@king.com,'+
				'kylie@minogue.com,anne@frank.com,emile@zatopek.com,lech@walesa.com,christiano@ronaldo.com,yoko@ono.com,julie@andrews.com,'+
				'florence@nightingale.com,marie@curie.com,stephen@hawking.com,tim@lee.com,lady@gaga.com,lance@armstrong.com,jon@stewart.com,'+
				'scarlett@johansson.com,larry@page.com,sergey@brin.com,roman@abramovich.com,rupert@murdoch.com,al@gore.com,sacha@baron.com,'+
				'george@clooney.com,paul@krugman.com,jimmy@wales.com'
            });
            var ms6 = $('#ms6').magicSuggest({
                // will fetch data from options
            });
            var ms7 = $('#ms7').magicSuggest({
                data: jsonData,
                resultAsString: true,
                maxSelection: 1,
                maxSelectionRenderer: function(){}
            })
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Date & Color Picker
	/*-----------------------------------------------------------------------------------*/
	var handleDateColorpicker = function () {
		$(".datepicker").datepicker();
		$(".inlinepicker").datepicker({
			inline: true,
			showOtherMonths: true
		});
		$(".datepicker-fullscreen").pickadate();
		$(".timepicker-fullscreen").pickatime();
		//Color picker
		$('.colorpicker').colorpicker();
		var a = $("#color-pickers")[0].style;
		$("#colorpicker-event").colorpicker().on("changeColor", function (b) {
			a.backgroundColor = b.color.toHex()
		});
	}

    /*-----------------------------------------------------------------------------------*/
	/*	Raty
	/*-----------------------------------------------------------------------------------*/
	var handleRaty = function () {
		$.fn.raty.defaults.path = 'js/jquery-raty/img';
		$('#score-demo').raty({ score: 3 });
		$('#number-demo').raty({ number: 10 });
		$('#readOnly-demo').raty({ readOnly: true, score: 2 });
		$('#halfShow-true-demo').raty({ score: 3.26 });
		$('#starHalf-demo').raty({
			path    : 'js/jquery-raty/img',
			half    : true,
			starOff : 'cookie-off.png',
			starOn  : 'cookie-on.png',

			starHalf: 'cookie-half.png'
		  });
		$('#star-off-and-star-on-demo').raty({
			path   : 'js/jquery-raty/img',
			starOff: 'off.png',
			starOn : 'on.png'
		});
		$('#cancel-off-and-cancel-on-demo').raty({
			path     : 'js/jquery-raty/img',
			cancel   : true,
			cancelOff: 'cancel-custom-off.png',
			cancelOn : 'cancel-custom-on.png',
			starOn   : 'star-on.png',
			starOff  : 'star-off.png'
		});
		$('#size-demo').raty({
			path     : 'js/jquery-raty/img',
			cancel   : true,
			cancelOff: 'cancel-off-big.png',
			cancelOn : 'cancel-on-big.png',
			half     : true,
			size     : 24,
			starHalf : 'star-half-big.png',
			starOff  : 'star-off-big.png',
			starOn   : 'star-on-big.png'
		});
		$('#target-div-demo').raty({
			cancel: true,
			target: '#target-div-hint'
		});
	}
	/*-----------------------------------------------------------------------------------*/
	/*	Timeago
	/*-----------------------------------------------------------------------------------*/
	var handleTimeAgo = function () {
		jQuery(document).ready(function() {
			var curr_time = moment().format('YYYY-MM-DD HH:mm');
			var yesterday = moment().subtract('days', 1).format('MMM D, YYYY');
			$("#curr-time").html(curr_time);
			$("#curr-time").attr('title', curr_time);
			$("#curr-time").attr('data-original-title', curr_time);
			$("#yesterday").html(yesterday);
			$("#yesterday").attr('title', yesterday);
			$("#yesterday").attr('data-original-title', yesterday);
		  jQuery("abbr.timeago").timeago();
		});
	}

    return {
        init: function () {
            handleBootbox(); //Function to display Date Timepicker
			handleMagicSuggest(); //Function to display autosuggest
			handleDateColorpicker(); //Function to handle date and time picker
			handleRaty(); //To show star ratings
			handleTimeAgo(); //Function to handle timestamps
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
        function Theme() { }
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