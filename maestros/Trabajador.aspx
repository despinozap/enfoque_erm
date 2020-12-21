<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Trabajador.aspx.cs" Inherits="maestros_Trabajador" %>

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
    <script src="../Theme/js/datatables/media/js/jquery.dataTables.min.js"></script>
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
					<h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i> Trabajadores</h3>
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
					<h4><i class="fa fa-user"></i>Trabajador Nuevo</h4>
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
							    Numero Identificación
						    </label>
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewRut" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
                        </div>
                        <div class="form-group"> 
						    <label class="col-md-2 control-label">
							    Nombre
						    </label>
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>					
						    <label class="col-md-2 control-label">
							    Apellido
						    </label>                            
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewApellido" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
                        </div>
                        <div class="form-group">
						    <label class="col-md-2 control-label">
							    Cargo
						    </label> 
						    <div class="col-md-3">	
                                <asp:TextBox type="text" ID="txtNewRol" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 									 
						    </div> 
						    <label class="col-md-2 control-label">
							    Estado
						    </label> 
						    <div class="col-md-3">		
                                <asp:DropDownList ID="ddlNewEstado" runat="server">
                                    <asp:ListItem Text="Activo" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Bloqueado" Value="0"></asp:ListItem>
                                </asp:DropDownList>									 										 
						    </div> 
					    </div>
					    <div class="form-group hidden">
						    <label class="col-md-2 control-label">
							    Pass
						    </label> 
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewPass" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
						    <label class="col-md-2 control-label">
							    Usuario
						    </label> 
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewUsuario" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
					    </div>
					    <div class="form-group">
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
							    <asp:TextBox type="text" ID="txtNewObservacion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
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
				<h4><i class="fa fa-user"></i>Editar Trabajador</h4>
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
							Numero Identificación
						</label>
						<div class="col-md-3">											 
							<asp:TextBox type="text" ID="txtUpdateRut" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>										 
						</div>
                    </div>
                    <div class="form-group"> 
						<label class="col-md-2 control-label">
							Nombre
						</label>
						<div class="col-md-3">											 
							<asp:TextBox type="text" ID="txtUpdateNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						</div>					
						<label class="col-md-2 control-label">
							Apellido
						</label>                            
						<div class="col-md-3">											 
							<asp:TextBox type="text" ID="txtUpdateApellido" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						</div>
					</div>
                    <div class="form-group">
						<label class="col-md-2 control-label">
							Cargo
						</label> 
						<div class="col-md-3">											 
							<asp:TextBox type="text" ID="txtUpdateRol" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						</div>
					</div>
					<div class="form-group hidden">
						<label class="col-md-2 control-label">
							Tipo
						</label> 
						<div class="col-md-3">	
                            <asp:DropDownList ID="ddlUpdateRol" runat="server">	</asp:DropDownList>								 									 
						</div> 
						<label class="col-md-2 control-label hidden">
							Estado
						</label> 
						<div class="col-md-3 hidden">		
                            <asp:DropDownList ID="ddlUpdateEstado" runat="server">
                                <asp:ListItem Text="Activo" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Bloqueado" Value="0"></asp:ListItem>
                            </asp:DropDownList>									 										 
						</div> 
					</div>
					<div class="form-group hidden">
						<label class="col-md-2 control-label">
							Pass
						</label> 
						<div class="col-md-3">											 
							<asp:TextBox type="text" ID="txtUpdatePass" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						</div>
						<label class="col-md-2 control-label">
							Usuario
						</label> 
						<div class="col-md-3">											 
							<asp:TextBox type="text" ID="txtUpdateUsuario" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">
							Correo electronico
						</label> 
						<div class="col-md-3">											 
                            <asp:textbox type="text" id="txtUpdateMail" class="form-control" runat="server" readonly="false"></asp:textbox>										 
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
                        <asp:HiddenField id="hddRut" runat="server"/>
						<h4><i class="fa fa-times"></i> Eliminar Trabajador!</h4>
							<p>Esta Seguro que desea eliminar el Trabajador</p>
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
					<h4><i class="fa fa-users"></i>Trabajadores</h4>
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
                                <th class="">Rut</th>
	                            <th class="">Nombre</th>
	                            <th class="">Apellido</th>            
                                <th class="">Mail</th>
                                <th class="">Cargo</th>
                                <th class="">Estado</th>
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
        $("#<%=hddRut.ClientID %>").val(id);
        var index = ($(e).parent().parent().attr("value"));
        var rut = $(e).parent().parent().children('td').eq(0).text();
        var nombre = $(e).parent().parent().children('td').eq(1).text();
        var apellido = $(e).parent().parent().children('td').eq(2).text();
        var mail = $(e).parent().parent().children('td').eq(3).text();
        var rol = $(e).parent().parent().children('td').eq(4).text();
        var estado = $(e).parent().parent().children('td').eq(5).text();
        var usuario = $(e).attr("usuario");
        var tipo = $(e).attr("rol");
        $("#<%=txtUpdateRut.ClientID %>").val(rut);
        $("#<%=txtUpdateNombre.ClientID %>").val(nombre);
        $("#<%=txtUpdateApellido.ClientID %>").val(apellido);
        $("#<%=txtUpdateMail.ClientID %>").val(mail);
        $("#<%=txtUpdateRol.ClientID %>").val(rol);
        $("#<%=txtUpdateUsuario.ClientID %>").val(usuario);
        $("#<%=txtUpdateObservacion.ClientID %>").val(obs);
        if (estado == 'Activo') {
            $('input[name=ddlUpdateEstado][value=Activo]').prop('checked', true);
        } else {
            $('input[name=ddlUpdateEstado][value=Bloqueado]').prop('checked', true);
        }
        $('input[name=ddlUpdateRol][value=' + tipo + ']').prop('checked', true);
        return false;
    }
    function deleteUser(e) {
        $("#InsertUserDiv").fadeOut();
        $("#UpdateUserDiv").fadeOut();
        $("#DeleteUserDiv").fadeIn();
        var rut = $(e).attr("key");
        $("#<%=hddRut.ClientID %>").val(rut);
        return false;
    }
</script>
</asp:Content>

