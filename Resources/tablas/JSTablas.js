var tablas = function () {
    /*-----------------------------------------------------------------------------------*/
	/*	Data Tables
	/*-----------------------------------------------------------------------------------*/
	var handleDataTables = function () {
		$('#datatable1').dataTable({
				"sPaginationType": "bs_full"
		});
		$('#datatable2').dataTable({
				"sPaginationType": "bs_full",
				sDom: "<'row'<'dataTables_header clearfix'<'col-md-4'l><'col-md-8'Tf>r>>t<'row'<'dataTables_footer clearfix'<'col-md-6'i><'col-md-6'p>>>",
                oTableTools: {
                    aButtons: ["copy", "print", "csv", "xls", "pdf"],
                    sSwfPath: "../Theme/js/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
                }
			});
		$('.datatable').each(function(){
			var datatable = $(this);
			// SEARCH - Add the placeholder for Search and Turn this into in-line form control
			var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
			search_input.attr('placeholder', 'Search');
			search_input.addClass('form-control input-sm');
			// LENGTH - Inline-Form control
			var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
			length_sel.addClass('form-control input-sm');
		});
	}

    return {
        init: function () {
            handleDataTables();	//Function to display data tables
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
            dark_orange: "#F38630",
            black: "#F38630"
        };
        return Theme;
    })();
})(window.jQuery);