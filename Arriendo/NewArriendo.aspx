<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="NewArriendo.aspx.cs" Inherits="Arriendo_NewArriendo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- AUTOSIZE -->
    <script type="text/javascript" src="../Theme/js/autosize/jquery.autosize.min.js"></script>

    <!-- MAGIC SUGGEST -->
    <link href="../Resources/MagicSuggest/magicsuggest.css" rel="stylesheet" type="text/css" />
    <script src="../Resources/MagicSuggest/magicsuggest.js" type="text/javascript"></script>

    <!-- DATE PICKER -->
    <link href="../Resources/datepicker/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
    <script src="../Resources/datepicker/moment.js" type="text/javascript"></script>
    <script src="../Resources/datepicker/transition.js" type="text/javascript"></script>
    <script src="../Resources/datepicker/collapse.js" type="text/javascript"></script>
    <script src="../Resources/datepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>

    <script src="../Resources/tablas/JSTablas.js"></script>

    <!-- DATA TABLES -->
    <link rel="stylesheet" type="text/css" href="../Theme/js/datatables/css/jquery.dataTables.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="content" class="col-lg-12">
        <div class="row">
            <!-- HEAD -->
            <div class="col-md-12" style="background-color: #FFFFFF; border-bottom: 1px solid #cdd2d2; margin-bottom: 20px;">
                <div class="clearfix" style="margin: 20px;">
                    <h3 class="content-title pull-left padding-top-10"><i class="fa fa-file-text-o"></i>Nuevo Arriendo</h3>
                    <!-- SELECT CLIENT -->
                    <h3 class="content-title pull-right padding-top-10">
                        <input style="min-width: 250px;" id="msEmpresa" type="text" /></h3>
                    <!-- /SELECT CLIENT -->
                </div>
            </div>
            <div class="separator"></div>
            <!-- /HEAD -->
            <div class="col-md-4">
                <div class="box border blue">
                    <div class="box-title">
                        <h4>DATOS CONTRATO</h4>
                    </div>
                    <div class="box-body big">
                        <div class="form-horizontal" role="form">
                            <!-- -->
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Fecha</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="fecha" type="text" disabled />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Cliente</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="cliente" type="text" disabled />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Rut</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="rut" type="text" disabled />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Direccion</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-dot-circle-o"></i></span>
                                        <input class="form-control" id="direccion" type="Direccion Cliente" disabled />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label">Fecha Inicio:</label>
                                <div class="col-md-8">
                                    <!--<input type="text" id="dpInicio" class="form-control datepicker">-->
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="fechaInicio" class="datetimepicker form-control" type="text"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Duraccion Minima:</label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <input id="duracionMinima" type="number" class="form-control" />
                                        <span class="input-group-addon">Mes(es)</span>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Observaciones</label>
                                <div class="col-sm-8">
                                    <textarea rows="3" id="observaciones"cols="5" name="textarea" class="autosize form-control"></textarea>
                                    <span class="help-block">Precione enter para expandir el campo</span>
                                </div>
                            </div>
                            <!-- -->
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-8">
                <div class="box border">
                    <div class="box-title">
                        <h4>ARRIENDO EQUIPOS</h4>
                        <div class="tools">
                        </div>
                    </div>
                    <div class="box-body big" id="bodyReserva" runat="server" style="padding-top: 10px;">
                        
                        <div class="row hidden">
                            <div class="panel panel-default col-md-4 ms-sel-ctn" style="padding-right: 5px; margin-right: 10px;">
                                <div class="tabbable">
                                    <span>XVC001 - 205256</span>
                                    <span style="float: right; cursor: pointer;">x</span>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Valor Diario</label>
                                        <div class="col-sm-9">
                                            <input class="form-control input-sm" type="number" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-4 ms-sel-ctn" style="padding-right: 5px; margin-right: 10px;">
                                <div class="tabbable">
                                    <span>ASKI - 205256</span>
                                    <span style="float: right; cursor: pointer;">x</span>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Valor Diario</label>
                                        <div class="col-sm-9">
                                            <input class="form-control input-sm" type="number" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-5 ms-sel-ctn" style="padding-right: 5px; margin-right: 10px;">
                                <div class="tabbable">
                                    <span>ECHI - 205256</span>
                                    <span style="float: right; cursor: pointer;">x</span>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Valor Diario</label>
                                        <div class="col-sm-9">
                                            <input class="form-control input-sm" type="number" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-5 ms-sel-ctn" style="padding-right: 5px; margin-right: 10px;">
                                <div class="tabbable">
                                    <span>PJFG - 205256</span>
                                    <span style="float: right; cursor: pointer;">x</span>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Valor Diario</label>
                                        <div class="col-sm-9">
                                            <input class="form-control input-sm" type="number" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="panel panel-default col-md-5 ms-sel-ctn" style="padding-right: 5px; margin-right: 10px;">
                                <div class="tabbable">
                                    <span>PJFG - 205256</span>
                                    <span style="float: right; cursor: pointer;">x</span>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Valor Diario</label>
                                        <div class="col-sm-9">
                                            <input class="form-control input-sm" type="number" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <h4>Equipos Seleccionados</h4>
                            <table id="tablaEquiposArriendo" cellpadding="0" cellspacing="0" border="0" width="100%"
                                class="datatable table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>SAP</th>
                                        <th>Cod</th>
                                        <th>Serie</th>
                                        <th>Nombre</th>
                                        <th>Familia</th>
                                        <th>Tipo</th>
                                        <th>Precio diario</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                        <hr />
                       <%-- <tr id="tablaEquiposArriendo_vacia">
                                        <td colspan="8" style="text-align: center;">
                                            <label>Para agregar seleccione de la lista inferior</label>
                                        </td>
                                    </tr>--%>
                        <div class="row">
                            <h4>Equipos Disponibles</h4>
                            <table id="tablaEquiposDisponibles" cellpadding="0" cellspacing="0" border="0" width="100%"                               
                                data-toggle="tooltip" data-placement="top" data-original-title="Click en alguna fila para agregar al arriendo"
                                class="datatable table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>SAP</th>
                                        <th>Cod</th>
                                        <th>Serie</th>
                                        <th>Nombre</th>
                                        <th>Familia</th>
                                        <th>Tipo</th>
                                        <th>Precio diario</th>
                                    </tr>
                                </thead>
                                <tbody id="bodyTablaEquipos" runat="server">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="navbar clearfix navbar-fixed-bottom" style="background-color: #FFFFFF; border-top: 1px solid #cdd2d2;">

            <asp:LinkButton ID="btnCancel" CssClass="btn btn-danger" runat="server" Style="height: 40px; margin: 5px; float: right;">
            <i class="fa fa-times"></i> Cancelar
            </asp:LinkButton>

            <asp:LinkButton ID="btnOk" CssClass="btn btn-success" runat="server" Style="height: 40px; margin: 5px; float: right;">
            <i class="fa fa-check"></i> Aceptar
            </asp:LinkButton>


        </div>
    </div>

    <!-- DATA TABLES -->
    <script type="text/javascript" src="../Theme/js/datatables/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript">
        menu.setPage('mArriendo', 'maArriendo');
        var tablaDisponibles, tablaArriendo;
        $(document).ready(function () {
            //SELECT
            $(function () {
                $('#msEmpresa').magicSuggest({
                    placeholder: 'Seleccione Cliente',
                    maxSelection: 1,
                    infoMsgCls: 'custom',
                    data: [{ "id": "Paris", "name": "Paris" }, { "id": "New York", "name": "New York" }, { "id": "Antofagasta", "name": "Antofagasta" }]

                    //resultsField: 'cities',
                    //groupBy: 'country.name'
                    //displayField: 'gender'
                    //http://nicolasbize.com/magicsuggest/doc.html <-- ajaxConfig
                });
            });

            $('textarea.autosize').autosize();
            $('textarea.autosize').addClass('textarea-transition');
            var d = new Date();
            var month = d.getMonth() + 1;
            var day = d.getDate();
            var hoy = (('' + day).length < 2 ? '0' : '') + day  + '/' +
                (('' + month).length < 2 ? '0' : '') + month + '/' + d.getFullYear();                
            $('#fecha').val(hoy);
            $('.datetimepicker').datetimepicker({
                showTodayButton: true,
                showClear: true,
                showClose: true,
                minDate: new Date(new Date().getTime()-(7*24*60*60*1000)),
                //viewMode: 'years',
                format: 'DD/MM/YYYY'
                //http://eonasdan.github.io/bootstrap-datetimepicker/ <-- Calendar
            });

            tablaDisponibles = $('#tablaEquiposDisponibles').DataTable(
                {
                    "columnDefs": [
                        {
                            "targets": [0],
                            "visible": false,
                            "searchable": false
                        },
                        {
                            "targets": [7],
                            "visible": false,
                            "searchable": false
                        }
                    ],
                    "scrollX": true
                });
            tablaArriendo = $('#tablaEquiposArriendo').DataTable(
                {
                    "columnDefs": [
                        {
                            "targets": [0],
                            "visible": false,
                            "searchable": false
                        },
                        {
                            "targets": [5],
                            "visible": false,
                            "searchable": false
                        },
                        {
                            "targets": [6],
                            "visible": false,
                            "searchable": false
                        }
                    ]
            });
            $('[data-toggle="tooltip"]').tooltip();
        });

        $(function () {
            tablaDisponibles.on('click', 'tr', function () {
                var $row = $(this);
                var addRow = tablaDisponibles.row($row);
                var dataRow = addRow.data();
                tablaArriendo.row.add(dataRow).draw();
                addRow.remove().draw();
            });
            tablaArriendo.on('click', 'tr', function () {
                if (!$(event.target).is('input')) {
                    var $row = $(this);
                    var addRow = tablaArriendo.row($row);
                    var dataRow = addRow.data();
                    tablaDisponibles.row.add(dataRow).draw();
                    addRow.remove().draw();
                }
            });
        });
    </script>
</asp:Content>

