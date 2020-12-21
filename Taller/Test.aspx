<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Taller_Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- DATA TABLES -->
	<link rel="stylesheet" type="text/css" href="../Theme/js/datatables/css/jquery.dataTables.min.css" />

    <!-- MAGIC SUGGEST -->
    <link href="../Theme/js/magic-suggest/magicsuggest-1.3.1-min.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="jumbotron">
        <h1>ASP.NET Web API - TEST</h1>
        <div class="row">
            <div class="col-md-12" style="font-size:medium">
                <div class="form-group">
                    <div id="divTest" class="col-md-offset-2 col-md-10">
                        <a href="javascript:test();" class="btn btn-default">Test</a>
                    </div>
                </div>
            </div>
         </div>
        <div class="row">
            <div class="col-md-12">
                <!-- Data List -->
                <div class="row" id="divList">
                    <!-- DATA TABLES -->
		            <div class="col-md-12">            
			            <!-- BOX -->
			            <div class="box border blue">
				            <div class="box-title">
					            <h4><i class="fa fa-users"></i>Tests</h4>
					            <div class="tools hidden-xs hidden">
						            <a href="#box-config" data-toggle="modal" class="config">
							            <i class="fa fa-cog"></i>
						            </a>
						            <a href="javascript:;" class="reload">
							            <i class="fa fa-refresh"></i>
						            </a>
						            <a href="javascript:;" class="collapse">
							            <i class="fa fa-chevron-up"></i>
						            </a>
						            <a href="javascript:;" class="remove">
							            <i class="fa fa-times"></i>
						            </a>
					            </div>
				            </div>
				            <div class="box-body">
                                <!--
					            <table id="dtList" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						            <thead>
							            <tr>
                                            <th class="">Col1</th>
                                            <th class="">Col2</th>
                                            <th class="">Col3</th>        
                                            <th class="">Options</th>
							            </tr>
						            </thead>
						            <tbody>
						            </tbody>
						            <tfoot>
						            </tfoot>
					            </table>
                                <input type="button" onclick="resetTable();" value="Reset"/>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" /></div></td>
                                        </tr>
                                    </tbody>
                                </table>
                                -->
                                <input type="text" id="txtSelect" />
                                <input type="file" id="fuFile" />
				            </div>
			            </div>
			            <!-- /BOX -->
		            </div>
	            </div>
	            <!-- /DATA TABLES -->
            </div>
        </div>
    </div>

    <!-- DATA TABLES -->
	<script type="text/javascript" src="../Theme/js/datatables/js/jquery.dataTables.min.js"></script>

    <!-- MAGIC SUGGEST -->
    <script src="../Theme/js/magic-suggest/magicsuggest-1.3.1-min.js" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(
            function()
            {
                formatFile();

                formatTable();

                selCity = $('#txtSelect').magicSuggest({
                    placeholder: 'Seleccione ciudad',
                    maxSelection: 1,
                    infoMsgCls: 'custom',
                    data: [{ "id": "prs", "name": "Paris" }, { "id": "ny", "name": "New York" }, { "id": "anf", "name": "Antofagasta" }]

                    //resultsField: 'cities',
                    //groupBy: 'country.name'
                    //displayField: 'gender'
                    //http://nicolasbize.com/magicsuggest/doc.html <-- ajaxConfig
                });
            }
        );

        function formatFile()
        {
            $('#fuFile').change(
                function()
                {
                    alert('Selected file');

                    var file = $('#fuFile').get(0).files[0];

                    tryUploadFile(file);
                }
            );
        }

        function downloadFile(id)
        {
            var data = new FormData();

            data.append('id', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/getArchivo_JSON",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (response)
                        {
                            var responseText = $(response).text();
                            var responseJson = $.parseJSON(responseText);

                            var statusCode = responseJson['statusCode'];

                            switch (statusCode)
                            {
                                case -2: //PARAMETER
                                    {
                                        var msg = responseJson['msg'];

                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'PARÁMETRO',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        break;
                                    }

                                case -1: //EXCEPTION
                                    {
                                        var msg = responseJson['msg'];

                                        $.alert(
		                                        {
		                                            icon: 'fa fa-cogs',
		                                            title: 'ERROR',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        break;
                                    }

                                case 0: //ERROR
                                    {
                                        var msg = responseJson['msg'];

                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'ERROR',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        break;
                                    }

                                case 1: //SUCCESS
                                    {
                                        var downloadedFile = responseJson['data'][0];

                                        var linkFile = document.createElement("a");
                                        linkFile.href = "data:application/octet-stream;charset=utf-8;base64," + downloadedFile.contenido;
                                        linkFile.download = downloadedFile.nombre;
                                        linkFile.text = downloadedFile.nombre;

                                        console.log(linkFile);
                                        $(linkFile)[0].click();

                                        break;
                                    }

                                default:
                                    {

                                        break;
                                    }
                            }
                        }
                    }
            );
        }

        function tryUploadFile(file)
        {
            if (file === null)
            {
                $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'No se ha seleccionado un archivo válido',
		                    confirmButton: 'Cerrar'
		                }
                );

                return;
            }
            else if (file.size > 3145728)
            {
                $.alert(
                       {
                           icon: 'fa fa-warning',
                           title: 'TAMAÑO DE ARCHIVO',
                           content: 'El tamaño máximo de archivo permitido es de 3 megabytes (mb)',
                           confirmButton: 'Cerrar'
                       }
                );
            }

            var data = new FormData();

            data.append('file', file);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/insertArchivo_JSON",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (response)
                        {
                            var responseText = $(response).text();
                            var responseJson = $.parseJSON(responseText);

                            var statusCode = responseJson['statusCode'];

                            switch (statusCode)
                            {
                                case -2: //PARAMETER
                                    {
                                        var msg = responseJson['msg'];

                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'PARÁMETRO',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        break;
                                    }

                                case -1: //EXCEPTION
                                    {
                                        var msg = responseJson['msg'];

                                        $.alert(
		                                        {
		                                            icon: 'fa fa-cogs',
		                                            title: 'ERROR',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        break;
                                    }

                                case 0: //ERROR
                                    {
                                        var msg = responseJson['msg'];

                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'ERROR',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        break;
                                    }

                                case 1: //SUCCESS
                                    {
                                        var msg = responseJson['msg'];

                                        $.alert(
		                                        {
		                                            icon: 'fa fa-check',
		                                            title: 'REALIZADO',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        break;
                                    }

                                default:
                                    {

                                        break;
                                    }
                            }
                        }
                    }
            );
        }

        function detailItem(row, data)
        {
            alert('Detailing item ' + data[0]);
        }

        function editItem(row, data)
        {
            alert('Editing item ' + data[0]);
        }

        function removeItem(row, data)
        {
            alert('Removing item ' + data[0]);

            table.row(row).remove().draw(false);
        }

        function formatTable()
        {
            table = $('#dtList').DataTable({
                "createdRow": function (row, data, index)
                {
                    $($($(row).find('td')).get(2)).attr('align', 'right');
                    $($($(row).find('td')).get(3)).attr('align', 'center');

                    $(row).find('td > .btn-success').click(
                        function ()
                        {
                            detailItem(row, data);
                        }
                    );

                    $(row).find('td > .btn-warning').click(
                        function ()
                        {
                            editItem(row, data);
                        }
                    );

                    $(row).find('td > .btn-danger').click(
                        function ()
                        {
                            removeItem(row, data);
                        }
                    );
                }
            });
        }

        function addRow(col1, col2, col3, detail, edit, remove)
        {
            var buttonIcon = document.createElement('i');
            buttonIcon.className = 'fa fa-search';
            var detailButton = document.createElement('a');
            detailButton.className = 'btn btn-success';
            detailButton.style = 'margin-right: 2px;';
            $(detailButton).append($(buttonIcon));

            var buttonIcon = document.createElement('i');
            buttonIcon.className = 'fa fa-pencil';
            var editButton = document.createElement('a');
            editButton.className = 'btn btn-warning';
            editButton.style = 'margin-right: 2px;';
            $(editButton).append($(buttonIcon));

            var buttonIcon = document.createElement('i');
            buttonIcon.className = 'fa fa-trash-o';
            var removeButton = document.createElement('a');
            removeButton.className = 'btn btn-danger';
            $(removeButton).append($(buttonIcon));

            if (detail === false)
            {
                detailButton.classList.add('disabled');
            }

            if (remove === false)
            {
                removeButton.classList.add('disabled');
            }

            if (edit === false)
            {
                editButton.classList.add('disabled');
            }

            var options = detailButton.outerHTML + editButton.outerHTML + removeButton.outerHTML;

            table.row.add([col1, col2, formatPeso(col3), options]).draw(false);
        }

        function resetTable()
        {
            for(var i=0; i<3; i++)
            {
                addRow('Col1-' + i, 'Col2-' + i, (Math.floor((Math.random() * 50000) + 1)).toString(), true, false, true);
            }

            for (var i = 0; i < 3; i++)
            {
                addRow('Col1-' + i, 'Col2-' + i, (Math.floor((Math.random() * 50000) + 1)).toString(), true, true, false);
            }
        }

        function unformatPeso(val)
        {
            var strValue = val.replace('$', '').replace('.', '');

            return parseInt(strValue);
        }

        function formatPeso(val)
        {
            var strValue = val.toString();
            var pesoValue = '';

            var counter = 0;
            for (var i = 0; i < strValue.length; i++)
            {
                pesoValue = strValue[strValue.length - i - 1] + pesoValue;

                if((counter === 2) && (i < strValue.length -1))
                {
                    pesoValue = '.' + pesoValue;
                    counter = 0;
                }
                else
                {
                    counter++;
                }
            }
            console.log('Original:' + strValue + ', Formated: ' + pesoValue);

            return '$' + pesoValue;
        }

        function test()
        {
            downloadFile(69);
        }

    </script>
</asp:Content>

