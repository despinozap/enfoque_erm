<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Equipo.aspx.cs" Inherits="maestros_Equipo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- DATA TABLES -->
    <link rel="stylesheet" type="text/css" href="../Theme/js/datatables/media/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="../Theme/js/datatables/media/assets/css/datatables.min.css" />
    <link rel="stylesheet" type="text/css" href="../Theme/js/datatables/extras/TableTools/media/css/TableTools.min.css" />
    <link rel="stylesheet" type="text/css" href="../Resources/chosen/chosen.min.css" />
    <style>
        .requiredText {
            color: red;
            display: none;
        }
    </style>
    <!-- DATA TABLES -->
    <script type="text/javascript" src="../Theme/js/datatables/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Theme/js/datatables/media/assets/js/datatables.min.js"></script>
    <script type="text/javascript" src="../Theme/js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
    <script type="text/javascript" src="../Theme/js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>
    <script type="text/javascript" src="../Theme/js/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../Resources/tablas/JSTablas.js" type="text/javascript"></script>
    <!--<script src="../Resources/usuario/JSusuario.js" type="text/javascript"></script>-->

    <!-- AUTOSIZE -->
    <script type="text/javascript" src="../Theme/js/autosize/jquery.autosize.min.js"></script>

    <!-- MAGIC SUGGEST -->
    <link href="../Resources/MagicSuggest/magicsuggest.css" rel="stylesheet" type="text/css" />
    <script src="../Resources/MagicSuggest/magicsuggest.js" type="text/javascript"></script>

    <!-- Chosen -->
    <script src="../Resources/chosen/chosen.jquery.min.js"></script>

    <!-- DATE PICKER -->
    <link href="../Resources/datepicker/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
    <script src="../Resources/datepicker/moment.js" type="text/javascript"></script>
    <script src="../Resources/datepicker/transition.js" type="text/javascript"></script>
    <script src="../Resources/datepicker/collapse.js" type="text/javascript"></script>
    <script src="../Resources/datepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>

    <script type="text/javascript">
        jQuery(document).ready(function () {
            tablas.init(); //Initialise plugins and elements
            //usuario.init();
        });
        $(document).load(function () {
            //var myCss = $("#liUsuario").attr("css","active");
            //myCss = myCss.replace("", "active");
            //alert("hola");
            $(".active").removeClass("active");
            $(".current").removeClass("current");
            $("#aUsuario").addClass("current");
            $("#liUsuario").addClass("active");
            //alert("hola2");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button ID="postBack" runat="server" Text="Button" CssClass="hidden" OnClick="postBack_Click" />
    <div id="content" class="col-lg-12">
        <!-- PAGE HEADER-->
        <div class="row">
            <div class="col-sm-12">
                <div class="page-header">
                    <!-- STYLER -->
                    <!-- /STYLER -->
                    <!-- BREADCRUMBS -->
                    <!--
				<ul class="breadcrumb">
					<li>Dashboard</li>
				</ul>
                -->
                    <!-- /BREADCRUMBS -->
                    <div class="clearfix" style="margin: 20px">
                        <h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i>Equipo</h3>
                        <a id="btnNuevo" href="#" onclick="divInsert();" class="btn btn-lg btn-success pull-right"><i class="fa fa-plus"></i>Nuevo</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /PAGE HEADER -->
        <!--Div Nuevo -->
        <div class="row divInsertar" id="InsertEquipoDiv">
            <div class="col-md-12">
                <!-- BOX -->
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-Equipo"></i>Equipo Nuevo</h4>
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
                        <div class="form-horizontal" role="form" action="#">
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Sap
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox class="form-control" runat="server" ID="txtNewSap"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_sap"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Cod
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewCod" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_cod"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    NumeroSerie
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewNumeroSerie" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_numSerie"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Nombre
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_nombre"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Precio Compra
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewPrecioCompra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_precioCompra"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Fecha Compra
                                </label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="txtNewFechaCompra" runat="server" readonly="true" class="datetimepicker form-control" type="text" />
                                    </div>
                                    <span class="requiredText" id="errorNewEquipo_fechaCompra"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Proveedor
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewProveedor" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_proveedor"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Modelo
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewModelo" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_modelo"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Horometro
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewHorometro" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_horometro"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Fecha Horometro
                                </label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="txtNewFechaHorometro" runat="server" readonly="true" class="datetimepicker form-control" type="text" />
                                    </div>
                                    <span class="requiredText" id="errorNewEquipo_fechaHorometro"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Familia
                                </label>
                                <div class="col-md-3">
                                    <select id="selectFamiliaNew" runat="server" class="form-control chzn-select chosen-select"></select>
                                    <span class="requiredText" id="errorNewEquipo_familia"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Tipo
                                </label>
                                <div class="col-md-3">
                                    <select id="selectTipoNew" runat="server" class="form-control chzn-select chosen-select"></select>
                                    <span class="requiredText" id="errorNewEquipo_tipo"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Observaciones
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewDescripcion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText" id="errorNewEquipo_descripcion"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="toolbox bottom center clearfix">
                        <a id="btnCancel2" href="#" onclick="divCancel();" class="btn btn-lg btn-danger pull-right"><i class="fa fa-times"></i>Cancelar</a>
                        <asp:LinkButton ID="btnInsertOk" CssClass="btn btn-success btn-lg pull-right" runat="server" OnClientClick="tryInsertEquipo(); return false;"><img style="max-height: 19px; display:none" id="loadNew" src="../Resources/loading/hourglass.gif" /><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
                    </div>
                </div>
                <!-- /BOX -->
            </div>
        </div>
        <!-- Div Update -->
        <div class="row divEditar" id="UpdateEquipoDiv">
            <div class="col-md-12">
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-Equipo"></i>Editar Equipo</h4>
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
                        <div class="form-horizontal" role="form" action="#">
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Sap
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox class="form-control" runat="server" ID="txtUpdateSap"></asp:TextBox>
                                    <span class="requiredText"></span>
                                    <asp:HiddenField ID="hddID" runat="server" />
                                </div>
                                <label class="col-md-2 control-label">
                                    Cod
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateCod" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Numero Serie
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateNumeroSerie" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Nombre
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Precio Compra
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdatePrecioCompra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Fecha Compra
                                </label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="txtUpdateFechaCompra" readonly="true" runat="server" class="datetimepicker form-control" type="text" />
                                    </div>
                                    <span class="requiredText"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Proveedor
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateProveedor" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Modelo
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateModelo" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Horometro
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateHorometro" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Fecha Horometro
                                </label>
                                <div class="col-md-3">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input id="txtUpdateFechaHorometro" runat="server" readonly="true" class="datetimepicker form-control" type="text" />
                                    </div>
                                    <span class="requiredText"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Familia
                                </label>
                                <div class="col-md-3">                                    
                                    <select id="selectFamiliaUpdate" runat="server" class="form-control chzn-select chosen-select"></select>
                                    <span class="requiredText"></span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Tipo
                                </label>
                                <div class="col-md-3">
                                    <select id="selectTipoUpdate" runat="server" class="form-control chzn-select chosen-select"></select>                                    
                                    <span class="requiredText"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Observaciones
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateDescripcion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                    <span class="requiredText"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="toolbox bottom center clearfix">
                        <a id="btnCancel" href="#" onclick="divCancel();" class="btn btn-lg btn-danger pull-right"><i class="fa fa-times"></i>Cancelar</a>
                        <a id="btnUpdateOk" class="btn btn-success btn-lg pull-right" runat="server" onclick="tryUpdateEquipo(); return false;"><img style="max-height: 19px; display:none" id="loadUpdate" src="../Resources/loading/hourglass.gif" /><i class="fa fa-check"></i>Aceptar</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Div Delete -->
        <div class="row divDelete" id="DeleteEquipoDiv" style="display: none;">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-title">
                        <h4><i class="fa fa-exclamation"></i>Alerts</h4>
                        <div class="tools">
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="alert alert-block alert-danger fade in">
                            <asp:HiddenField ID="hddKey" runat="server" />
                            <h4><i class="fa fa-times"></i>Eliminar Equipo!</h4>
                            <p>Esta Seguro que desea eliminar el Equipo</p>
                            <p>
                                <a class="btn btn-danger" href="#" onclick="divCancel();">Cancelar</a>
                                <asp:LinkButton ID="btnDeleteOk" CssClass="btn btn-success" runat="server" OnClick="btnDeleteOk_Click"><i class="fa fa-check"></i>Eliminar</asp:LinkButton>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Data Table -->
        <div class="row">
            <!-- DATA TABLES -->
            <div class="col-md-12">
                <!-- BOX -->
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-users"></i>Equipos</h4>
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
                        <table id="datatable1" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="">Sap</th>
                                    <th class="">Cod</th>
                                    <th class="">Nombre</th>
                                    <th class="">Tipo</th>
                                    <th class="">Observaciones</th>
                                    <th class=""></th>
                                </tr>
                            </thead>
                            <tbody id="BodyTable" runat="server">
                            </tbody>
                            <tfoot>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <!-- /BOX -->
            </div>
        </div>
        <!-- /DATA TABLES -->
        <asp:HiddenField ID="respuestaAjax" runat="server" />
    </div>
    <script type="text/javascript">
        $(document).ready(            
            $("#InsertEquipoDiv").fadeOut(),
            $("#UpdateEquipoDiv").fadeOut(),
            $("#DeleteEquipoDiv").fadeOut(),
            $(".requiredText").fadeOut(),
            $('.datetimepicker').datetimepicker({
                showTodayButton: true,
                showClear: true,
                showClose: true,
                maxDate: 'now',
                ignoreReadonly: true,
                format: 'DD/MM/YYYY'
            }),
            cargarChosen()
            //$(".chzn-select").chosen()
            //cargarMagicSuggest()            
        );

        function cargarChosen() {
            var select, chosen;
            //Precione Enter para agregar
            // cache the select element as we'll be using it a few times
            select = $("#<%=selectFamiliaNew.ClientID %>");
            // init the chosen plugin
            select.chosen({ no_results_text: 'Enter para agregar:' });
            // get the chosen object
            chosen = select.data('chosen');
            // Bind the keyup event to the search box input
            chosen.dropdown.find('input').on('keyup', function (e) {
                // if we hit Enter and the results list is empty (no matches) add the option
                if (e.which == 13 && chosen.dropdown.find('li.no-results').length > 0) {
                    var option = $("<option>").val(this.value).text(this.value);
                    // add the new option
                    //select.prepend(option);
                    select.append(option);
                    //$("<option>").val(this.value).text(this.value).insertAfter(select.children().first());
                    // automatically select it
                    //select.find(option).prop('selected', true);
                    // trigger the update
                    select.trigger("chosen:updated");
                }
            });
            //tipoNew
            var selectTN = $("#<%=selectTipoNew.ClientID %>");
            selectTN.chosen({ no_results_text: 'Enter para agregar:' });
            var chosenTN = selectTN.data('chosen');
            chosenTN.dropdown.find('input').on('keyup', function (e) {
                if (e.which == 13 && chosenTN.dropdown.find('li.no-results').length > 0) {
                    var option = $("<option>").val(this.value).text(this.value);
                    selectTN.append(option);
                    selectTN.trigger("chosen:updated");
                }
            });
            //FamiliaUpdate
            var selectFU = $("#<%=selectFamiliaUpdate.ClientID %>");
            selectFU.chosen({ no_results_text: 'Enter para agregar:' });
            var chosenFU = selectFU.data('chosen');
            chosenFU.dropdown.find('input').on('keyup', function (e) {
                if (e.which == 13 && chosenFU.dropdown.find('li.no-results').length > 0) {
                    var option = $("<option>").val(this.value).text(this.value);
                    selectFU.append(option);
                    selectFU.trigger("chosen:updated");
                }
            });
            //tipoUpdate
            var selectTU = $("#<%=selectTipoUpdate.ClientID %>");
            selectTU.chosen({ no_results_text: 'Enter para agregar:' });
            var chosenTU = selectTU.data('chosen');
            chosenTU.dropdown.find('input').on('keyup', function (e) {
                if (e.which == 13 && chosenTU.dropdown.find('li.no-results').length > 0) {
                    var option = $("<option>").val(this.value).text(this.value);
                    selectTU.append(option);
                    selectTU.trigger("chosen:updated");
                }
            });
        }

        $("#<%=selectFamiliaNew.ClientID %>").change(function () {
            //alert("Handler for .change() called.");
            var familia = $("#<%=selectFamiliaNew.ClientID %> option:selected").val();
            if (familia == "0") {
                $('#<%=selectTipoNew.ClientID %>').html("");
                $('#<%=selectTipoNew.ClientID %>').append($('<option>', {
                    value: 0,
                    text: "Seleccione un tipo"
                }));
                return;
            }
            var tipos = "";
            var data = new FormData();
            data.append('familia', familia);
            $.ajax({
                type: "POST",
                url: '../service/WSEquipo.asmx/getTipos',
                data: data,
                contentType: false,
                processData: false,
                success: function (response) {
                    var responseText = $(response).text();
                    tipos = $.parseJSON(responseText);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR + ',' + textStatus + ',' + errorThrown);
                },
                complete: function () {
                    //alert(tipos);
                    $('#<%=selectTipoNew.ClientID %>').html("");
                    $('#<%=selectTipoNew.ClientID %>').append($('<option>', {
                        value: 0,
                        text: "Seleccione un tipo"
                    }));
                    $.each(tipos, function (i, item) {
                        $('#<%=selectTipoNew.ClientID %>').append($('<option>', {
                            value: item.id,
                            text: item.name
                        }));
                    });
                    $('#<%=selectTipoNew.ClientID %>').trigger("chosen:updated");
                }
            });
        });

        $("#<%=selectFamiliaUpdate.ClientID %>").change(function () {
            //alert("Handler for .change() called.");
            var familia = $("#<%=selectFamiliaUpdate.ClientID %> option:selected").val();
            if (familia == "0") {
                $('#<%=selectTipoUpdate.ClientID %>').html("");
                $('#<%=selectTipoUpdate.ClientID %>').append($('<option>', {
                    value: 0,
                    text: "Seleccione un tipo"
                }));
                return;
            }
            actualizarSelectTiposUpdate(familia,"0");
        });

        function actualizarSelectTiposUpdate(familia,tipo) {
            var tipos = "";
            var data = new FormData();
            data.append('familia', familia);
            $.ajax({
                type: "POST",
                url: '../service/WSEquipo.asmx/getTipos',
                data: data,
                contentType: false,
                processData: false,
                success: function (response) {
                    var responseText = $(response).text();
                    tipos = $.parseJSON(responseText);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR + ',' + textStatus + ',' + errorThrown);
                },
                complete: function () {
                    //alert(tipos);
                    $('#<%=selectTipoUpdate.ClientID %>').html("");
                    $('#<%=selectTipoUpdate.ClientID %>').append($('<option>', {
                        value: 0,
                        text: "Seleccione un tipo"
                    }));
                    $.each(tipos, function (i, item) {
                        $('#<%=selectTipoUpdate.ClientID %>').append($('<option>', {
                            value: item.id,
                            text: item.name
                        }));
                    });
                    if (tipo != "0") {
                        $("#<%=selectTipoUpdate.ClientID%> option[value='" + tipo + "']").prop('selected', true);
                    }
                    $('#<%=selectTipoUpdate.ClientID %>').trigger("chosen:updated");
                }
            });
        }

        function goTop() {
            $("html, body").animate({ scrollTop: 0 }, 300);
        }

        function divInsert() {
            $("#InsertEquipoDiv").fadeIn();
            $("#UpdateEquipoDiv").fadeOut();
            $("#DeleteEquipoDiv").fadeOut();
            goTop();
        }

        function divCancel() {
            $("#InsertEquipoDiv").fadeOut();
            $("#UpdateEquipoDiv").fadeOut();
            $("#DeleteEquipoDiv").fadeOut();
            goTop();
        }

        function updateEquipo(e) {
            $("#InsertEquipoDiv").fadeOut();
            $("#UpdateEquipoDiv").fadeIn();
            $("#DeleteEquipoDiv").fadeOut();
            goTop();
            $("#txtUpdateRut").text();
            var id = $(e).attr("key");
            var sap = $(e).attr("sap");
            var cod = $(e).attr("cod");
            var pc = $(e).attr("pc");
            var fc = $(e).attr("fc");
            var me = $(e).attr("me");
            var fe = $(e).attr("fe");
            var obs = $(e).attr("obs");
            var ns = $(e).attr("ns");
            var pe = $(e).attr("pe");
            var hr = $(e).attr("hr");
            var fh = $(e).attr("fh");
            var ne = $(e).attr("ne");
            var te = $(e).attr("te");
            $("#<%=hddID.ClientID %>").val(id);
            $("#<%=txtUpdateSap.ClientID %>").val(sap);
            $("#<%=txtUpdateCod.ClientID %>").val(cod);
            $("#<%=txtUpdatePrecioCompra.ClientID %>").val(pc);
            $("#<%=txtUpdateFechaCompra.ClientID %>").val(fc);
            $("#<%=txtUpdateModelo.ClientID %>").val(me);
            $("#<%=selectFamiliaUpdate.ClientID%> option[value='" + fe + "']").prop('selected', true);
            $('#<%=selectFamiliaUpdate.ClientID %>').trigger("chosen:updated");
            actualizarSelectTiposUpdate(fe,te);
            //$("#<%=selectFamiliaUpdate.ClientID %>").prop('selectedIndex', fe);
            $("#<%=txtUpdateDescripcion.ClientID %>").val(obs);
            $("#<%=txtUpdateNumeroSerie.ClientID %>").val(ns);
            $("#<%=txtUpdateProveedor.ClientID %>").val(pe);
            $("#<%=txtUpdateHorometro.ClientID %>").val(hr);
            $("#<%=txtUpdateFechaHorometro.ClientID %>").val(fh);
            $("#<%=txtUpdateNombre.ClientID %>").val(ne);
            //$("#<%=selectTipoUpdate.ClientID %>").prop('selectedIndex', te);
            //$("#<%=selectTipoUpdate.ClientID%> option[value='" + te + "']").prop('selected', true);
            //$('#<%=selectTipoUpdate.ClientID %>').trigger("chosen:updated");

            return false
        }

        function deleteEquipo(e) {
            $("#InsertEquipoDiv").fadeOut();
            $("#UpdateEquipoDiv").fadeOut();
            $("#DeleteEquipoDiv").fadeIn();
            var id = $(e).attr("key");
            $("#<%=hddKey.ClientID %>").val(id);
            return false;
        }

        function tryInsertEquipo() {
            var data = new FormData();
            limpiarErrores();
            var errores = camposNoValidos();
            if (errores) {
                goTop();
                return false;
            }
            data.append('sap', $("#<%= txtNewSap.ClientID %>").val());
            data.append('cod', $("#<%= txtNewCod.ClientID %>").val());
            data.append('fechaCompra', $("#<%= txtNewFechaCompra.ClientID %>").val());
            data.append('precioCompra', $("#<%= txtNewPrecioCompra.ClientID %>").val());
            data.append('nombre', $("#<%= txtNewNombre.ClientID %>").val());
            data.append('tipo', $("#<%= selectTipoNew.ClientID %> option:selected").val());
            data.append('observacion', $("#<%= txtNewDescripcion.ClientID %>").val());
            data.append('numeroSerie', $("#<%= txtNewNumeroSerie.ClientID %>").val());
            data.append('proveedor', $("#<%= txtNewProveedor.ClientID %>").val());
            data.append('horometro', $("#<%= txtNewHorometro.ClientID %>").val());
            data.append('fechaHorometro', $("#<%= txtNewFechaHorometro.ClientID %>").val());
            data.append('modelo', $("#<%= txtNewModelo.ClientID %>").val());
            data.append('familia', $("#<%= selectFamiliaNew.ClientID %> option:selected").val());
            $.ajax(
            {
                type: "POST",
                url: "../service/WSEquipo.asmx/insertarEquipo",
                contentType: false,
                processData: false,
                data: data,
                beforeSend: function () {
                    $('#loadNew').show();
                },
                success: function (response) {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode) {
                        case -2: //PARAMETER
                            {
                                var msg = responseJson['msg'];
                                alert("PARAMETER: " + msg);
                                return false;
                                break;
                            }

                        case -1: //EXCEPTION
                            {
                                var msg = responseJson['msg'];
                                alert("EXCEPTION: " + msg);

                                return false;
                                break;
                            }

                        case 0: //ERROR
                            {
                                var msg = responseJson['msg'];
                                alert("ERROR: " + msg);

                                return false;
                                break;
                            }

                        case 1: //SUCCESS
                            {
                                var msg = responseJson['msg'];

                                $("#<%= respuestaAjax.ClientID %>").val("si");
                                return false;
                                break;
                            }

                        default:
                            {
                                return false;
                                break;
                            }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR + ',' + textStatus + ',' + errorThrown);
                    return false;
                }
            }).done(function (msg) {
                if ($("#<%= respuestaAjax.ClientID %>").val() == "si") {
                    alert("Equipo agregado");
                    reloadPage();
                }
            });
        }

        function mensaje() {
            alert('Hola?');
        }

        function tryUpdateEquipo() {
            var data = new FormData();
            limpiarErrores();
            var errores = camposNoValidosUpdate();
            if (errores) {
                goTop();
                return false;
            }
            data.append('id', $("#<%= hddID.ClientID %>").val());
            data.append('sap', $("#<%= txtUpdateSap.ClientID %>").val());
            data.append('cod', $("#<%= txtUpdateCod.ClientID %>").val());
            data.append('fechaCompra', $("#<%= txtUpdateFechaCompra.ClientID %>").val());
            data.append('precioCompra', $("#<%= txtUpdatePrecioCompra.ClientID %>").val());
            data.append('nombre', $("#<%= txtUpdateNombre.ClientID %>").val());
            data.append('tipo', $("#<%= selectTipoUpdate.ClientID %> option:selected").val());
            data.append('observacion', $("#<%= txtUpdateDescripcion.ClientID %>").val());
            data.append('numeroSerie', $("#<%= txtUpdateNumeroSerie.ClientID %>").val());
            data.append('proveedor', $("#<%= txtUpdateProveedor.ClientID %>").val());
            data.append('horometro', $("#<%= txtUpdateHorometro.ClientID %>").val());
            data.append('fechaHorometro', $("#<%= txtUpdateFechaHorometro.ClientID %>").val());
            data.append('modelo', $("#<%= txtUpdateModelo.ClientID %>").val());
            data.append('familia', $("#<%= selectFamiliaUpdate.ClientID %> option:selected").val());

            $.ajax(
            {
                type: "POST",
                url: "../service/WSEquipo.asmx/modificarEquipo",
                contentType: false,
                processData: false,
                data: data,
                beforeSend: function () {
                    $('#loadUpdate').show();
                },
                success: function (response) {
                    $('#btnUpdateOk').html('<i class="fa fa-check"></i>Aceptar');
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);
                    var statusCode = responseJson['statusCode'];
                    switch (statusCode) {
                        case -2: //PARAMETER
                            {
                                var msg = responseJson['msg'];
                                alert("PARAMETER: " + msg);
                                return false;
                                break;
                            }
                        case -1: //EXCEPTION
                            {
                                var msg = responseJson['msg'];
                                alert("EXCEPTION: " + msg);
                                return false;
                                break;
                            }
                        case 0: //ERROR
                            {
                                var msg = responseJson['msg'];
                                alert("ERROR: " + msg);
                                return false;
                                break;
                            }
                        case 1: //SUCCESS
                            {
                                var msg = responseJson['msg'];
                                $("#<%= respuestaAjax.ClientID %>").val("si");
                                return false;
                                break;
                            }
                        default:
                            {
                                return false;
                                break;
                            }
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR + ',' + textStatus + ',' + errorThrown);
                    return false
                }
            }).done(function (msg) {
                if ($("#<%= respuestaAjax.ClientID %>").val() == "si") {
                    alert("Equipo modificado");
                    reloadPage();
                }
            });
        }

        function limpiarErrores() {
            $(".requiredText").fadeOut();
        }

        function camposNoValidosUpdate() {
            var cantidadErrores = 0;
            var campo = $('#<%= txtUpdateSap.ClientID %>');
            var respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtUpdateCod.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtUpdateNumeroSerie.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtUpdateNombre.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtUpdatePrecioCompra.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            //fecha
            campo = $('#<%= txtUpdateFechaCompra.ClientID %>');
            respuesta = validarInputFecha(campo.val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().parent().find('span.requiredText').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtUpdateProveedor.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtUpdateModelo.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            //Horometro
            campo = $('#<%= txtUpdateHorometro.ClientID %>');
            respuesta = validarInputEntero(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            //Fecha Horo
            campo = $('#<%= txtUpdateFechaHorometro.ClientID %>');
            respuesta = validarInputFecha(campo.val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().parent().find('span.requiredText').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= selectFamiliaUpdate.ClientID %>');
            respuesta = validaSelectSimple($('#<%= selectFamiliaUpdate.ClientID %> option:selected').val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            else {
                if (campo == "0") {
                    cantidadErrores += 1;
                    campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
                }
            }
            campo = $('#<%= selectTipoUpdate.ClientID %>');
            respuesta = validaSelectSimple($('#<%= selectTipoUpdate.ClientID %> option:selected').val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            else {
                if (campo == "0") {
                    cantidadErrores += 1;
                    campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
                }
            }
            campo = $('#<%= txtUpdateDescripcion.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            return cantidadErrores > 0;
        }

        function validaInpuText(texto, maxLength) {
            var respuesta = new Array();
            respuesta['estado'] = false;
            if (texto.length == 0) {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'El campo no puede ser vacio';
                return respuesta;
            }
            if (texto.length > maxLength) {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'No puede superar los 255 caracteres, actuales(' + texto.length + ').';
                return respuesta;
            }
            return respuesta;
        }

        function camposNoValidos() {
            var cantidadErrores = 0;
            var campo = $('#<%= txtNewSap.ClientID %>');
            var respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtNewCod.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtNewNumeroSerie.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtNewNombre.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtNewPrecioCompra.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            //fecha
            campo = $('#<%= txtNewFechaCompra.ClientID %>');
            respuesta = validarInputFecha(campo.val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().parent().find('span.requiredText').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtNewProveedor.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= txtNewModelo.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            //Horometro
            campo = $('#<%= txtNewHorometro.ClientID %>');
            respuesta = validarInputEntero(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }            
            //Fecha Horo
            campo = $('#<%= txtNewFechaHorometro.ClientID %>');
            respuesta = validarInputFecha(campo.val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().parent().find('span.requiredText').text(respuesta['mensaje']).fadeIn();
            }
            campo = $('#<%= selectFamiliaNew.ClientID %>');
            respuesta = validaSelectSimple($('#<%= selectFamiliaNew.ClientID %> option:selected').val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            else
            {
                if (campo == "0") {
                    cantidadErrores += 1;
                    campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
                }
            }
            campo = $('#<%= selectTipoNew.ClientID %>');
            respuesta = validaSelectSimple($('#<%= selectTipoNew.ClientID %> option:selected').val());
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            else {
                if (campo == "0") {
                    cantidadErrores += 1;
                    campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
                }
            }
            campo = $('#<%= txtNewDescripcion.ClientID %>');
            respuesta = validaInpuText(campo.val(), 255);
            if (respuesta['estado']) {
                cantidadErrores += 1;
                campo.parent().find('span').text(respuesta['mensaje']).fadeIn();
            }
            return cantidadErrores > 0;
        }

        function validaInpuText(texto, maxLength) {
            var respuesta = new Array();
            respuesta['estado'] = false;
            if (texto.length == 0) {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'El campo no puede ser vacio';
                return respuesta;
            }
            if (texto.length > maxLength) {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'No puede superar los 255 caracteres, actuales('+texto.length+').';
                return respuesta;
            }
            return respuesta;
        }

        function validarInputFecha(fechaTxt) {
            var respuesta = new Array();
            respuesta['estado'] = false;
            var pattern = new RegExp(/^(0?[1-9]|[12][0-9]|3[01])[\/\-\.](0?[1-9]|1[012])[\/\-\.](\d{4})$/);
            var match = pattern.exec(fechaTxt); 
            if (match == null)                
            {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'El formato de la fecha es errorneo (dd/mm/aaaa)';
                return respuesta;
            }
            return respuesta;
        }

        function validarInputEntero(enteroTxt) {
            var respuesta = new Array();
            respuesta['estado'] = false;            
            if (enteroTxt % 1 != 0) {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'El campo debe ser numerico';
                return respuesta;
            }
            if (enteroTxt.length == 0) {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'El campo no puede ser vacio';
                return respuesta;
            }
            return respuesta;
        }

        function validaSelectSimple(seleccion) {
            var respuesta = new Array();
            respuesta['estado'] = false;
            if (seleccion == "0") {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'Debe seleccionar un elemento';
                return respuesta;
            }
            if (seleccion.length < 2) {
                respuesta['estado'] = true;
                respuesta['mensaje'] = 'El campo debe tener mas de 2 caracteres';
                return respuesta;
            }
            return respuesta;
        }

        function reloadPage() {
            var btn = $("#<%= postBack.ClientID %>");
            btn.click();
        }
    </script>

</asp:Content>
