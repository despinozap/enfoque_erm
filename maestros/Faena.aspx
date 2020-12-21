<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Faena.aspx.cs" Inherits="maestros_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <!-- DATA TABLES -->
	<link rel="stylesheet" type="text/css" href="../Theme/js/datatables/media/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" type="text/css" href="../Theme/js/datatables/media/assets/css/datatables.min.css" />
	<link rel="stylesheet" type="text/css" href="../Theme/js/datatables/extras/TableTools/media/css/TableTools.min.css" />
    <!-- DATA TABLES -->
	<script type="text/javascript" src="../Theme/js/datatables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../Theme/js/datatables/media/assets/js/datatables.min.js"></script>
	<script type="text/javascript" src="../Theme/js/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
	<script type="text/javascript" src="../Theme/js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"></script>
    <script type="text/javascript" src="../Theme/js/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../Resources/tablas/JSTablas.js" type="text/javascript"></script>
    <!--<script src="../Resources/usuario/JSusuario.js" type="text/javascript"></script>-->
    <script type="text/javascript" >
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
				<div class="clearfix"  style="margin: 20px">
					<h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i> Faenas</h3>
                    <a id="btnNuevo" href="#" onclick="divInsert();" class="btn btn-lg btn-success pull-right"><i class="fa fa-plus"></i> Nuevo</a>
                </div>     
			</div>
		</div>
	</div>
	<!-- /PAGE HEADER -->
    <!--Div Nuevo -->
    <div class="row divInsertar" id="InsertUserDiv">
        <div class="col-md-12">
            <!-- BOX -->
			<div class="box border blue">
				<div class="box-title">
					<h4><i class="fa fa-user"></i>Faena Nuevo</h4>
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
							    Nombre
						    </label>
						    <div class="col-md-3">
                                <asp:TextBox class="form-control" runat="server" ID="txtNewNombre"></asp:TextBox>											 
							    </div>
						    <label class="col-md-2 control-label">
							    Cliente
						    </label>
						    <div class="col-md-3">	
                                <asp:DropDownList ID="ddlCliente" runat="server"></asp:DropDownList>										 
							    <asp:TextBox type="text" ID="txtNewCliente" class="form-control hidden" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
                        </div>
                        <div class="form-group"> 
						    <label class="col-md-2 control-label">
							    Empresa
						    </label>
						    <div class="col-md-3">
                                <asp:DropDownList ID="ddlEmpresa" runat="server"></asp:DropDownList>											 
							    <asp:TextBox type="text" ID="txtNewEmpresa" class="form-control hidden" runat="server" ReadOnly="false"></asp:TextBox>										 
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
							    <asp:TextBox type="text" ID="txtNewRazonSocial" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
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
                    <a id="btnCancel2" href="#" onclick="divCancel();" class="btn btn-lg btn-danger pull-right"><i class="fa fa-times"></i> Cancelar</a>
                    <asp:LinkButton id="btnInsertOk" CssClass="btn btn-success btn-lg pull-right" runat="server" OnClick="btnInsertOk_Click"><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
                </div>
			</div>
			<!-- /BOX -->
        </div>
    </div>
    <!-- Div Update -->
    <div class="row divEditar" id="UpdateUserDiv">
	<div class="col-md-12">
		<div class="box border blue">
			<div class="box-title">
				<h4><i class="fa fa-user"></i>Editar Faena</h4>
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
							    Nombre
						    </label>
						    <div class="col-md-3">
                                <asp:HiddenField ID="hddID" runat="server" />										 
							    <asp:TextBox type="text" ID="txtUpdateNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
						    <label class="col-md-2 control-label">
							    Cliente
						    </label>
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtUpdateCliente" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
                        </div>
                        <div class="form-group"> 
						    <label class="col-md-2 control-label">
							    Empresa
						    </label>
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtUpdateEmpresa" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
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
							    Forma de pago
						    </label> 
						    <div class="col-md-3">											 
							    <asp:DropDownList ID="ddlUpdateFormaPago" runat="server">
                                    <asp:ListItem Text="Contado" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Credito" Value="1"></asp:ListItem>
                                </asp:DropDownList>
						    </div>
						    <label class="col-md-2 control-label">
							    Razon social
						    </label> 
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtUpdateRazonSocial" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
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
                <a id="btnCancel" href="#" onclick="divCancel();" class="btn btn-lg btn-danger pull-right"><i class="fa fa-times"></i> Cancelar</a>
                <asp:LinkButton id="btnUpdateOk" CssClass="btn btn-success btn-lg pull-right" runat="server" OnClick="btnUpdateOk_Click"><i class="fa fa-check"></i>Aceptar</asp:LinkButton>
            </div>
		</div>
	</div>
</div>
    <!-- Div Delete -->
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
                        <asp:HiddenField id="hddKey" runat="server"/>
						<h4><i class="fa fa-times"></i> Eliminar Faena!</h4>
							<p>Esta Seguro que desea eliminar el Faena</p>
							<p>
								<a class="btn btn-danger" href="#" onclick="divCancel();">Cancelar</a>
                                <asp:LinkButton id="btnDeleteOk" CssClass="btn btn-success" runat="server" OnClick="btnDeleteOk_Click"><i class="fa fa-check"></i>Eliminar</asp:LinkButton>
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
					<h4><i class="fa fa-users"></i>Faenas</h4>
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
<script type="text/javascript">
    $(document).ready(
        $("#InsertUserDiv").fadeOut(),
        $("#UpdateUserDiv").fadeOut(),
        $("#DeleteUserDiv").fadeOut()
    );

    function divInsert() {
        $("#InsertUserDiv").fadeIn();
        $("#UpdateUserDiv").fadeOut();
        $("#DeleteUserDiv").fadeOut();
    }
    function divCancel() {
        $("#InsertUserDiv").fadeOut();
        $("#UpdateUserDiv").fadeOut();
        $("#DeleteUserDiv").fadeOut();
    }
    function updateUser(e) {
        $("#InsertUserDiv").fadeOut();
        $("#UpdateUserDiv").fadeIn();
        $("#DeleteUserDiv").fadeOut();
        $("#txtUpdateRut").text();
        var id = $(e).attr("key");
        var obs = $(e).attr("obs");
        $("#<%=hddID.ClientID %>").val(id);
        var nombre = $(e).parent().parent().children('td').eq(0).text();
        var cliente = $(e).parent().parent().children('td').eq(1).text();
        var empresa = $(e).parent().parent().children('td').eq(2).text();
        var descrip = $(e).parent().parent().children('td').eq(3).text();
        $("#<%=txtUpdateNombre.ClientID %>").val(nombre);
        $("#<%=txtUpdateCliente.ClientID %>").val(cliente);
        $("#<%=txtUpdateEmpresa.ClientID %>").val(empresa);
        $("#<%=txtUpdateDesc.ClientID %>").val(descrip);
        return false;
    }
    function deleteUser(e) {
        $("#InsertUserDiv").fadeOut();
        $("#UpdateUserDiv").fadeOut();
        $("#DeleteUserDiv").fadeIn();
        var id = $(e).attr("key");
        $("#<%=hddKey.ClientID %>").val(id);
        return false;
    }
</script>
</asp:Content>

