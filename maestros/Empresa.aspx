<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Empresa.aspx.cs" Inherits="maestros_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- DATA TABLES -->
    <link rel="stylesheet" type="text/css" href="../Theme/js/datatables/media/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="../Theme/js/datatables/media/assets/css/datatables.min.css" />
    <link rel="stylesheet" type="text/css" href="../Theme/js/datatables/extras/TableTools/media/css/TableTools.min.css" />
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
        <asp:HiddenField ID="respuestaAjax" runat="server" />
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
                        <h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i>Empresas</h3>
                        <a id="btnNuevo" href="#" onclick="divInsert();" class="btn btn-lg btn-success pull-right"><i class="fa fa-plus"></i>Nueva empresa</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /PAGE HEADER -->
        <!--Div Nueva Empresa-->
        <div class="row divInsertar" id="InsertUserDiv">
            <div class="col-md-12">
                <!-- BOX -->
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-user"></i>Empresa Nuevo</h4>
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
                                    Razon Social
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox class="form-control" runat="server" ID="txtNewRazonSocial"></asp:TextBox>
                                    <span class="requiredText" id="errorInsertEmpresa_rznSocial">Debes ingresar una razón social</span>
                                </div>
                                <label class="col-md-2 control-label">
                                    Rut
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewRut" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Alias
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewAlias" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">
                                    Observación
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewObservacion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group hidden">
                                <label class="col-md-2 control-label">
                                    Direccion
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewDirc" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">
                                    Fono
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewFono" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group hidden">
                                <label class="col-md-2 control-label">
                                    Forma de pago
                                </label>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="ddlFormaPago" runat="server">
                                        <asp:ListItem Text="Contado" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Credito" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <label class="col-md-2 control-label">
                                    Razon social
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNew2" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group hidden">
                                <label class="col-md-2 control-label">
                                    Correo electronico
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNewMail" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">
                                    Observacion
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtNew1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="toolbox bottom center clearfix">
                        <a id="btnCancel2" href="#" onclick="divCancel();" class="btn btn-lg btn-danger pull-right"><i class="fa fa-times"></i>Cancelar</a>
                        <asp:LinkButton ID="btnInsertOk" CssClass="btn btn-success btn-lg pull-right" runat="server" OnClientClick="tryIngresarEmpresa(); return false;"><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
                    </div>
                </div>
                <!-- /BOX -->
            </div>
        </div>
        <!-- Div Update Empresa-->
        <div class="row divEditar" id="UpdateUserDiv">
            <div class="col-md-12">
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-user"></i>Editar Empresa</h4>
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
                                    Razon Social
                                </label>
                                <div class="col-md-3">
                                    <asp:HiddenField ID="hddID" runat="server" />
                                    <asp:TextBox type="text" ID="txtUpdateRazonSocial" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">
                                    Rut
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateRut" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">
                                    Alias
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateAlias" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">
                                    Descripcion
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateDesc" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group hidden">
                                <label class="col-md-2 control-label">
                                    Direccion
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateDireccion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">
                                    Fono
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateFono" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group hidden">
                                <label class="col-md-2 control-label">
                                    Correo electronico
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateMail" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                                <label class="col-md-2 control-label">
                                    Observacion
                                </label>
                                <div class="col-md-3">
                                    <asp:TextBox type="text" ID="txtUpdateObservacion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="toolbox bottom center clearfix">
                        <a id="btnCancel" href="#" onclick="divCancel();" class="btn btn-lg btn-danger pull-right"><i class="fa fa-times" style='margin-left: 7px;'></i>Cancelar</a>
                        <asp:LinkButton ID="btnUpdateOk" CssClass="btn btn-success btn-lg pull-right" runat="server" OnClick="btnUpdateOk_Click"><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <!-- Div Delete Empresa-->
        <div class="row divDelete" id="DeleteUserDiv">
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
                            <h4><i class="fa fa-times"></i>Eliminar Empresa!</h4>
                            <p>Esta Seguro que desea eliminar el Empresa</p>
                            <p>
                                <a class="btn btn-danger" href="#" onclick="divCancel();">Cancelar</a>
                                <asp:LinkButton ID="btnDeleteOk" CssClass="btn btn-success" runat="server" OnClick="btnDeleteOk_Click"><i class="fa fa-check"></i>Eliminar</asp:LinkButton>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Div Contactos -->
        <div class="row divContatos" id="ContactosDiv">
            <asp:HiddenField ID="hddIdEmpresa" runat="server" />
            <div class="col-md-12">
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-user"></i>Contactos Empresa</h4>
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
                        <div id="divEliminarContacto" class="col-md-12">
                            <div class="box">
                                <div class="box-title">
                                    <h4><i class="fa fa-exclamation"></i>Alerts</h4>
                                    <div class="tools">
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="alert alert-block alert-danger fade in">
                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                        <h4><i class="fa fa-times"></i>Eliminar Contacto!</h4>
                                        <p>Esta Seguro que desea eliminar el Contacto <label id="nombreContacto"></label></p>
                                        <p>
                                            <a class="btn btn-danger" href="#" onclick="divCancel();">Cancelar</a>
                                            <asp:LinkButton ID="eliminarContacto" CssClass="btn btn-success" runat="server" OnClick="eliminarContacto_Click"><i class="fa fa-check"></i>Eliminar</asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal" role="form" action="#">
                            <asp:HiddenField ID="idContactoEditar" runat="server" />
                            <div class="row">
                                <div class="col-md-6">
                                    <table id="datatablecontactos" cellpadding="0" border="0" class="datatable table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="">Nombre</th>
                                                <th class="">Email</th>
                                                <th class="">Area</th>
                                                <th class=""></th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodyTableContactos">
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <a id="nuevoContacto" onclick="limpiarContacto();$('#txtContacto').fadeIn();return false;"
                                                class="btn btn-sm btn-success pull-right"><i class="fa fa-plus"></i><i class="fa fa-user"></i>Nuevo contacto</a>
                                        </div>
                                    </div>
                                    <div id="txtContacto">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Nombre
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                                <span class="requiredText" id="errorContacto_nombre">Debes ingresar un nombre</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Área
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoArea" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Dirección
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoDireccion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Correo electronico
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoEmail" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                                <span class="requiredText" id="errorContacto_email">Debes ingresar un correo electrónico</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Teléfono
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoFono" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Celular
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoCelular" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Ciudad
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoCiudad" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Observacion
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtUpdateContactoObservacion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="toolbox bottom center clearfix">
                        <a id="btnCancelContacto" href="#" onclick="limpiarContacto();$('#ContactosDiv').fadeOut();" class="btn btn-lg btn-danger pull-right" style='margin-left: 7px;'><i class="fa fa-times"></i>Cancelar</a>
                        <asp:LinkButton ID="agregarContacto" CssClass="btn btn-success btn-lg pull-right" runat="server" OnClientClick="crearEditarContacto(); return false;"><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

        <!-- Div Obras -->
        <div class="row divObras" id="ObrasDiv">
            <asp:HiddenField ID="idEmpresaObra" runat="server" />
            <div class="col-md-12">
                <div class="box border blue">
                    <div class="box-title">
                        <h4><i class="fa fa-user"></i>Obras Empresa</h4>
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
                        <div id="divEliminarObra" class="col-md-12">
                            <div class="box">
                                <div class="box-title">
                                    <h4><i class="fa fa-exclamation"></i>Alerts</h4>
                                    <div class="tools">
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="alert alert-block alert-danger fade in">
                                        <asp:HiddenField ID="idEmpresaEliminar" runat="server" />
                                        <h4><i class="fa fa-times"></i>Eliminar Obra!</h4>
                                        <p>Esta Seguro que desea eliminar la obra <label id="nombreObra"></label></p>
                                        <p>
                                            <a class="btn btn-danger" href="#" onclick="divCancelObra();">Cancelar</a>
                                            <asp:LinkButton ID="eliminarObra" CssClass="btn btn-success" runat="server" OnClick="eliminarObra_Click"><i class="fa fa-check"></i>Eliminar</asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal" role="form" action="#">
                            <asp:HiddenField ID="idObraEditar" runat="server" />
                            <div class="row">
                                <div class="col-md-3">
                                    <table id="datatableObras" cellpadding="0" border="0" class="datatable table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="">Nombre</th>
                                                <th class=""></th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodyTableObras">
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <a id="nuevaObra" onclick="limpiarObra();$('#divEliminarObra').fadeOut();$('#txtObra').fadeIn();return false;"
                                                class="btn btn-sm btn-success pull-right"><i class="fa fa-plus"></i> <i class="fa fa-cogs"> </i>Nueva obra</a>
                                        </div>
                                    </div>
                                    <div id="txtObra">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Nombre
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtNombreObra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                                <span class="requiredText" id="errorObra_nombre">Debes ingresar un nombre</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Ciudad
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtCiudadObra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Dirección
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtDireccionObra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">
                                                Observación
                                            </label>
                                            <div class="col-md-7">
                                                <asp:TextBox type="text" ID="txtObservacionObra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="toolbox bottom center clearfix">
                        <a id="btnCancelObra" href="#" onclick="limpiarContacto();$('#ObrasDiv').fadeOut();" class="btn btn-lg btn-danger pull-right" style='margin-left: 7px;'><i class="fa fa-times"></i>Cancelar</a>
                        <asp:LinkButton ID="agregarObra" CssClass="btn btn-success btn-lg pull-right" runat="server" OnClientClick=" return crearEditarObra(); return false;"><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
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
                        <h4><i class="fa fa-users"></i>Empresas</h4>
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
                        <table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="">Razon Social</th>
                                    <th class="">Rut</th>
                                    <th class="">Alias</th>
                                    <th class="">Descripcion</th>
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
    </div>
    <script src="../Resources/testingJS.js"></script>
    <script type="text/javascript">
        $(document).ready(
            $("#InsertUserDiv").fadeOut(),
            $("#UpdateUserDiv").fadeOut(),
            $("#DeleteUserDiv").fadeOut(),
            $("#ContactosDiv").fadeOut(),
            $("#txtContacto").fadeOut(),
            $(".requiredText").fadeOut(),
            $("#divEliminarContacto").fadeOut(),
            $("#ObrasDiv").fadeOut(),
            $("#txtObra").fadeOut()
        );

        function goTop() {
            $("html, body").animate({ scrollTop: 0 }, 300);
        }

        function divInsert() {
            $("#<%= txtNewRazonSocial.ClientID %>").val("");
            $("#<%= txtNewRut.ClientID %>").val("");
            $("#<%= txtNewAlias.ClientID %>").val("");
            $("#<%= txtNewObservacion.ClientID %>").val("");
            $("#InsertUserDiv").fadeIn();
            $("#UpdateUserDiv").fadeOut();
            $("#DeleteUserDiv").fadeOut();
            $("#ContactosDiv").fadeOut();
            $("#txtContacto").fadeOut();
            $(".requiredText").fadeOut();
            $("#ObrasDiv").fadeOut();
            goTop();
        }
        function divCancel() {
            $("#InsertUserDiv").fadeOut();
            $("#UpdateUserDiv").fadeOut();
            $("#DeleteUserDiv").fadeOut();
            $("#ContactosDiv").fadeOut();
            $("#txtContacto").fadeOut();
            $("#txtObra").fadeOut();
            limpiarContacto();
            $(".requiredText").fadeOut();
            $("#divEliminarContacto").fadeOut();
            $("#ObrasDiv").fadeOut();
            goTop();
        }
        function updateUser(e) {
            $("#InsertUserDiv").fadeOut();
            $("#UpdateUserDiv").fadeIn();
            $("#DeleteUserDiv").fadeOut();
            $("#ContactosDiv").fadeOut();
            $("#txtContacto").fadeOut();
            $("#txtUpdateRut").text();
            $(".requiredText").fadeOut();
            $("#ObrasDiv").fadeOut();
            $("#txtObra").fadeOut();
            var id = $(e).attr("key");
            var obs = $(e).attr("obs");
            $("#<%=hddID.ClientID %>").val(id);
            var rs = $(e).parent().parent().children('td').eq(0).text();
            var rut = $(e).parent().parent().children('td').eq(1).text();
            var alias = $(e).parent().parent().children('td').eq(2).text();
            var descrip = $(e).parent().parent().children('td').eq(3).text();
            $("#<%=txtUpdateRazonSocial.ClientID %>").val(rs);
            $("#<%=txtUpdateRut.ClientID %>").val(rut);
            $("#<%=txtUpdateAlias.ClientID %>").val(alias);
            $("#<%=txtUpdateDesc.ClientID %>").val(descrip);
            goTop();
            return false;
        }
        function deleteUser(e) {
            $("#InsertUserDiv").fadeOut();
            $("#UpdateUserDiv").fadeOut();
            $("#DeleteUserDiv").fadeIn();
            $("#ContactosDiv").fadeOut();
            $("#txtContacto").fadeOut();
            $(".requiredText").fadeOut();
            $("#ObrasDiv").fadeOut();
            $("#txtObra").fadeOut();
            var id = $(e).attr("key");
            $("#<%=hddKey.ClientID %>").val(id);
            goTop();
            return false;
        }
        function contactos(e) {
            $("#InsertUserDiv").fadeOut();
            $("#UpdateUserDiv").fadeOut();
            $("#DeleteUserDiv").fadeOut();
            $("#ContactosDiv").fadeIn();
            $("#txtContacto").fadeOut();
            $(".requiredText").fadeOut();
            $("#divEliminarContacto").fadeOut();
            $("#txtObra").fadeOut();
            $("#ObrasDiv").fadeOut();
            var id = $(e).attr("key");
            var contactos = $(e).attr("contactos");
            var contactosArr = contactos.split(";");
            var bodyTable = "";
            for (var i = 0; i < contactosArr.length; i++) {
                var detallesContacto = contactosArr[i].split(",");
                if (detallesContacto[1] != null) {
                    var tr = crearFilaTablaContacto(detallesContacto[0],
                                                detallesContacto[1],
                                                detallesContacto[2],
                                                detallesContacto[3],
                                                detallesContacto[4],
                                                detallesContacto[5],
                                                detallesContacto[6],
                                                detallesContacto[7],
                                                detallesContacto[8], i)
                    bodyTable += tr;
                }
            }
            if (contactosArr[0].length > 0) {
                $("#bodyTableContactos").html(bodyTable);
            } else {
                $("#bodyTableContactos").html("");
            };
            $("#<%=hddIdEmpresa.ClientID %>").val(id);
            goTop();
            return false;
        }

        function crearFilaTablaContacto(a0, a1, a2, a3, a4, a5, a6, a7, a8, esimo) {
            var tr = "<tr class='gradeX' value='" + esimo + "'>";
            tr += "<td>" + a2 + "</td>";
            tr += "<td>" + a3 + "</td>";
            tr += "<td>" + a1 + "</td>";
            tr += "<td>"
            var btns = "<a onclick='return updateContacto(event.currentTarget);' id='editarContacto" + esimo +
                       "' class='btn btn-info btn-sm tip-left' data-toggle='tooltip' data-original-title='Editar contacto'" +
                       " ic='" + a0 + "' ac='" + a1 + "' nc='" + a2 + "' ec='" + a3 + "' tc='" + a4 + "' cc='" + a5 +
                       "' dc='" + a6 + "' oc='" + a7 + "' cic='" + a8 + "'><i class='fa fa-pencil'></i></a>" +
                       "<a onclick='return tryEliminarContacto(event.currentTarget);' id='eliminarContacto" + esimo +
                       "' ic='" + a0 + "' nc='" + a2 + "' class='btn btn-danger btn-sm tip-left tip-left' data-toggle='tooltip' " +
                       "data-original-title='Eliminar contacto' style='margin-left: 7px;'><i class='fa fa-times'></i></a>";
            tr += btns;
            tr += "</td>"
            tr += "</tr>";
            return tr;
        }
        /*Copia la informacion de una tupla de la tabla a los textbox correspondientes, con la informacion de cada botón.*/
        function updateContacto(e) {
            $("#<%=idContactoEditar.ClientID %>").val($(e).attr("ic"));
            $("#<%=txtUpdateContactoNombre.ClientID %>").val($(e).attr("nc"));
            $("#<%=txtUpdateContactoArea.ClientID %>").val($(e).attr("ac"));
            $("#<%=txtUpdateContactoDireccion.ClientID %>").val($(e).attr("dc"));
            $("#<%=txtUpdateContactoEmail.ClientID %>").val($(e).attr("ec"));
            $("#<%=txtUpdateContactoFono.ClientID %>").val($(e).attr("tc"));
            $("#<%=txtUpdateContactoCelular.ClientID %>").val($(e).attr("cc"));
            $("#<%=txtUpdateContactoCiudad.ClientID %>").val($(e).attr("cic"));
            $("#<%=txtUpdateContactoObservacion.ClientID %>").val($(e).attr("oc"));
            $("#txtContacto").fadeIn();
            $(".requiredText").fadeOut();
            goTop();
        }
        function limpiarContacto() {
            $("#<%=idContactoEditar.ClientID %>").val("");
            $("#<%=txtUpdateContactoNombre.ClientID %>").val("");
            $("#<%=txtUpdateContactoArea.ClientID %>").val("");
            $("#<%=txtUpdateContactoDireccion.ClientID %>").val("");
            $("#<%=txtUpdateContactoEmail.ClientID %>").val("");
            $("#<%=txtUpdateContactoFono.ClientID %>").val("");
            $("#<%=txtUpdateContactoCelular.ClientID %>").val("");
            $("#<%=txtUpdateContactoCiudad.ClientID %>").val("");
            $("#<%=txtUpdateContactoObservacion.ClientID %>").val("");
            $("#txtContacto").fadeOut();
            $(".requiredText").fadeOut();
            goTop();
        }
        function tryIngresarEmpresa() {
            $(".requiredText").fadeOut();
            var ingresoValido = datosEmpresaValidos()

            if (ingresoValido === true) {
                var data = new FormData();

                data.append('razonSocial', $("#<%= txtNewRazonSocial.ClientID %>").val());
                data.append('rut', $("#<%= txtNewRut.ClientID %>").val());
                data.append('alias', $("#<%= txtNewAlias.ClientID %>").val());
                data.append('observacion', $("#<%= txtNewObservacion.ClientID %>").val());

                $.ajax({
                    type: "POST",
                    url: "../service/WSEmpresa.asmx/insertarEmpresa",
                    contentType: false,
                    processData: false,
                    data: data,
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
                                    //alert("SUCCESS: " + msg);
                                    //reloadPage();
                                    return false;
                                    break;
                                }

                            default:
                                {
                                    return false;
                                    break;
                                }
                        }
                    }
                }
                    ).done(function (msg) {
                        alert("Empresa agregada");
                        reloadPage();
                    });
            }
            else {
                return false;
            }

            function datosEmpresaValidos() {
                if ($("#<%= txtNewRazonSocial.ClientID %>").val().length > 255) {
                    $("#errorInsertEmpresa_rznSocial").show();
                    return false;
                }
                else if ($("#<%= txtNewRazonSocial.ClientID %>").val().length < 1) {
                    $("#errorInsertEmpresa_rznSocial").show();
                    return false;
                }
                return true;
            }
        }
        function crearEditarContacto() {
            $(".requiredText").fadeOut();
            var validarContacto = camposValidosContacto();
            $("#<%= respuestaAjax.ClientID %>").val("no");
            if ($("#<%=idContactoEditar.ClientID %>").val().length > 0) {
                //Se edita
                if (validarContacto) {
                    var data = new FormData();
                    data.append('id', $("#<%= idContactoEditar.ClientID %>").val());
                    data.append('area', $("#<%= txtUpdateContactoArea.ClientID %>").val());
                    data.append('nombre', $("#<%= txtUpdateContactoNombre.ClientID %>").val());
                    data.append('email', $("#<%= txtUpdateContactoEmail.ClientID %>").val());
                    data.append('fono', $("#<%= txtUpdateContactoFono.ClientID %>").val());
                    data.append('celular', $("#<%= txtUpdateContactoCelular.ClientID %>").val());
                    data.append('direccion', $("#<%= txtUpdateContactoDireccion.ClientID %>").val());
                    data.append('observacion', $("#<%= txtUpdateContactoObservacion.ClientID %>").val());
                    data.append('ciudad', $("#<%= txtUpdateContactoCiudad.ClientID %>").val());
                    data.append('empresa_id', $("#<%= hddIdEmpresa.ClientID %>").val());

                    $.ajax({
                        type: "POST",
                        url: "../service/WSContacto.asmx/modificarContacto",
                        contentType: false,
                        processData: false,
                        data: data,
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
                                        respuesta = true;

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
                            alert("Contacto guardado");
                            reloadPage();
                        }
                    });
                }
            }
            else {
                //Se crea
                var validarContacto = camposValidosContacto();
                if (validarContacto) {
                    var data = new FormData();
                    data.append('id', "0");
                    data.append('area', $("#<%= txtUpdateContactoArea.ClientID %>").val());
                    data.append('nombre', $("#<%= txtUpdateContactoNombre.ClientID %>").val());
                    data.append('email', $("#<%= txtUpdateContactoEmail.ClientID %>").val());
                    data.append('fono', $("#<%= txtUpdateContactoFono.ClientID %>").val());
                    data.append('celular', $("#<%= txtUpdateContactoCelular.ClientID %>").val());
                    data.append('direccion', $("#<%= txtUpdateContactoDireccion.ClientID %>").val());
                    data.append('observacion', $("#<%= txtUpdateContactoObservacion.ClientID %>").val());
                    data.append('ciudad', $("#<%= txtUpdateContactoCiudad.ClientID %>").val());
                    data.append('empresa_id', $("#<%= hddIdEmpresa.ClientID %>").val());

                    $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSContacto.asmx/ingresarContacto",
                        contentType: false,
                        processData: false,
                        data: data,
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
                            return false
                        }
                    }).done(function (msg) {
                        if ($("#<%= respuestaAjax.ClientID %>").val() == "si") {
                            alert("Contacto guardado");
                            reloadPage();
                        }
                    });
                }
            }
        }

        function camposValidosContacto() {
            var cantErrores = 0;
            if ($("#<%= txtUpdateContactoNombre.ClientID %>").val().length > 255) {
                $("#errorContacto_nombre").show();
                cantErrores += 1;
            }
            else if ($("#<%= txtUpdateContactoNombre.ClientID %>").val().length < 1) {
                $("#errorContacto_nombre").show();
                cantErrores += 1;
            }
            if ($("#<%= txtUpdateContactoEmail.ClientID %>").val().length > 255) {
                $("#errorContacto_email").show();
                cantErrores += 1;
            }
            else if ($("#<%= txtUpdateContactoEmail.ClientID %>").val().length < 1) {
                $("#errorContacto_email").show();
                cantErrores += 1;
            }
            //if (cantErrores > 0) { return fasle; } else { return true; }
            return !(cantErrores > 0);
        }

        function tryEliminarContacto(e) {
            //Se muestra el mensaje de eliminación
            $("#divEliminarContacto").fadeIn();
            goTop();
            $("#<%=idContactoEditar.ClientID %>").val($(e).attr("ic"));
            $("#nombreContacto").text($(e).attr("nc"));
        }
        
        function eliminarContacto() {
            var data = new FormData();
            data.append('id', $("#<%= idContactoEditar.ClientID %>").val());

            $.ajax(
            {
                type: "POST",
                url: "../service/WSContacto.asmx/eliminarContacto",
                contentType: false,
                processData: false,
                data: data,
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
                    return false
                }
            }).done(function (msg) {
                if ($("#<%= respuestaAjax.ClientID %>").val() == "si") {
                    alert("Contacto eliminador");
                    reloadPage();
                }
            });
        }
        // Obras

        function obras(e) {
            $("#InsertUserDiv").fadeOut();
            $("#UpdateUserDiv").fadeOut();
            $("#DeleteUserDiv").fadeOut();
            $("#ContactosDiv").fadeOut();
            $("#txtContacto").fadeOut();
            $("#txtObra").fadeOut();
            $(".requiredText").fadeOut();
            $("#divEliminarContacto").fadeOut();
            $("#divEliminarObra").fadeOut();
            $("#ObrasDiv").fadeIn();
            var id = $(e).attr("key");
            var obras = $(e).attr("obras");
            var obrasArr = obras.split(";");
            var bodyTable = "";
            for (var i = 0; i < obrasArr.length; i++) {
                var detallesObra = obrasArr[i].split(",");
                if (detallesObra[1] != null) {
                    var tr = crearFilaTablaObra(detallesObra[0],
                                                detallesObra[1],
                                                detallesObra[2],
                                                detallesObra[3],
                                                detallesObra[4], i)
                    bodyTable += tr;
                }
            }
            if (obrasArr[0].length > 0) {
                $("#bodyTableObras").html(bodyTable);
            } else {
                $("#bodyTableObras").html("");
            };
            $("#<%=idEmpresaObra.ClientID %>").val(id);
            goTop();
            return false;
        }

        function crearFilaTablaObra(a0, a1, a2, a3, a4, esimo) {
            var tr = "<tr class='gradeX' value='" + esimo + "'>";
            tr += "<td>" + a1 + "</td>";
            tr += "<td>"
            var btns = "<a onclick='updateObra(event.currentTarget);' id='editarObra" + esimo +
                       "' class='btn btn-info btn-sm tip-left' data-toggle='tooltip' data-original-title='Editar obra'" +
                       " io='" + a0 + "' no='" + a1 + "' co='" + a2 + "' do='" + a3 + "' oo='" + a4 +
                       "'><i class='fa fa-pencil'></i></a>" +
                       "<a onclick='return tryEliminarObra(event.currentTarget);' id='eliminarObra" + esimo +
                       "' io='" + a0 + "' no='" + a1 + "' class='btn btn-danger btn-sm tip-left tip-left' data-toggle='tooltip' " +
                       "data-original-title='Eliminar obra' style='margin-left: 7px;'><i class='fa fa-times'></i></a>";
            tr += btns;
            tr += "</td>"
            tr += "</tr>";
            return tr;
        }

        function limpiarObra() {
            $("#<%=idObraEditar.ClientID %>").val("");
            $("#<%=txtNombreObra.ClientID %>").val("");
            $("#<%=txtCiudadObra.ClientID %>").val("");
            $("#<%=txtDireccionObra.ClientID %>").val("");
            $("#<%=txtObservacionObra.ClientID %>").val("");
            $("#txtObra").fadeOut(function () {
                $('#txtObra').fadeIn();
            });
            $(".requiredText").fadeOut();
            goTop();
        }

        function updateObra(e) {
            $("#<%=idObraEditar.ClientID %>").val($(e).attr("io"));
            $("#<%=txtNombreObra.ClientID %>").val($(e).attr("no"));
            $("#<%=txtCiudadObra.ClientID %>").val($(e).attr("co"));
            $("#<%=txtObservacionObra.ClientID %>").val($(e).attr("oo"));
            $("#<%=txtDireccionObra.ClientID %>").val($(e).attr("do"));
            $("#txtObra").fadeIn();
            $("#divEliminarObra").fadeOut();
            $(".requiredText").fadeOut();
            goTop();
        }

        function divCancelObra() {
            $("#divEliminarObra").fadeOut();
            goTop();
            $("#<%=idObraEditar.ClientID %>").val("");
            $("#nombreObra").text("");
        }

        function tryEliminarObra(e) {
            //Se muestra el mensaje de eliminación
            $("#divEliminarObra").fadeIn();
            $("#txtObra").fadeOut();
            goTop();
            $("#<%=idObraEditar.ClientID %>").val($(e).attr("io"));
            $("#nombreObra").text($(e).attr("no"));
        }

        function crearEditarObra() {
            $(".requiredText").fadeOut();
            $("#<%= respuestaAjax.ClientID %>").val("no");
            if ($("#<%=idObraEditar.ClientID %>").val().length > 0) {
                //Se edita
                var validarObra = camposValidosObra();
                if (validarObra) {
                    var data = new FormData();

                    data.append('id', $("#<%= idObraEditar.ClientID %>").val());
                    data.append('nombre', $("#<%= txtNombreObra.ClientID %>").val());
                    data.append('ciudad', $("#<%= txtCiudadObra.ClientID %>").val());
                    data.append('direccion', $("#<%= txtDireccionObra.ClientID %>").val());
                    data.append('observacion', $("#<%= txtObservacionObra.ClientID %>").val());
                    data.append('empresa_id', $("#<%= idEmpresaObra.ClientID %>").val());

                    $.ajax({
                        type: "POST",
                        url: "../service/WSObra.asmx/modificarObra",
                        contentType: false,
                        processData: false,
                        data: data,
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
                                        respuesta = true;

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
                            alert("Obra guardada");
                            reloadPage();
                        }
                    });
                }
            }
            else {
                //Se crea
                var validarObra = camposValidosObra();
                if (validarObra) {
                    var data = new FormData();

                    data.append('nombre', $("#<%= txtNombreObra.ClientID %>").val());
                    data.append('ciudad', $("#<%= txtCiudadObra.ClientID %>").val());
                    data.append('direccion', $("#<%= txtDireccionObra.ClientID %>").val());
                    data.append('observacion', $("#<%= txtObservacionObra.ClientID %>").val());
                    data.append('empresa_id', $("#<%= idEmpresaObra.ClientID %>").val());

                    $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSObra.asmx/ingresarObra",
                        contentType: false,
                        processData: false,
                        data: data,
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
                            return false
                        }
                    }).done(function (msg) {
                        if ($("#<%= respuestaAjax.ClientID %>").val() == "si") {
                            alert("Obra guardada");
                            reloadPage();
                        }
                    });
                }
            }
        }

        function camposValidosObra() {
            return true;
        }

        function reloadPage() {
            var btn = $("#<%= postBack.ClientID %>");
                btn.click();
            }
        function mensaje(msg) { alert(msg); }
    </script>
</asp:Content>