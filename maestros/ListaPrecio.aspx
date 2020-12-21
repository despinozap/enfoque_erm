<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="ListaPrecio.aspx.cs" Inherits="maestros_ListaPrecio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
					<h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i> Lista de Precio</h3>
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
					<h4><i class="fa fa-user"></i>Lista Nueva</h4>
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
							    nombre
						    </label>
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>					
						    <label class="col-md-2 control-label">
							    apellido
						    </label>                            
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewApellido" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
                        </div>
                        <div class="form-group">
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
					    <div class="form-group">
						    <label class="col-md-2 control-label">
							    forma de pago
						    </label> 
						    <div class="col-md-3">											 
							    <asp:DropDownList ID="ddlFormaPago" runat="server">
                                    <asp:ListItem Text="Contado" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Credito" Value="1"></asp:ListItem>
                                </asp:DropDownList>
						    </div>
						    <label class="col-md-2 control-label">
							    razon social
						    </label> 
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewRazonSocial" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
					    </div>
					    <div class="form-group">
						    <label class="col-md-2 control-label">
							    correo electronico
						    </label> 
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtNewMail" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
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
				<h4><i class="fa fa-user"></i>Editar Lista</h4>
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
                                <asp:HiddenField ID="hddID" runat="server" />										 
							    <asp:TextBox type="text" ID="txtUpdateSap" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
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
							    nombre
						    </label>
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtUpdateNombre" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>					
						    <label class="col-md-2 control-label">
							    apellido
						    </label>                            
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtUpdateApellido" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
                        </div>
                        <div class="form-group">
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
					    <div class="form-group">
						    <label class="col-md-2 control-label">
							    forma de pago
						    </label> 
						    <div class="col-md-3">											 
							    <asp:DropDownList ID="ddlUpdateFormaPago" runat="server">
                                    <asp:ListItem Text="Contado" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Credito" Value="1"></asp:ListItem>
                                </asp:DropDownList>
						    </div>
						    <label class="col-md-2 control-label">
							    razon social
						    </label> 
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtUpdateRazonSocial" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
						    </div>
					    </div>
					    <div class="form-group">
						    <label class="col-md-2 control-label">
							    correo electronico
						    </label> 
						    <div class="col-md-3">											 
							    <asp:TextBox type="text" ID="txtUpdateMail" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>										 
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
						<h4><i class="fa fa-times"></i> Eliminar Lista!</h4>
							<p>Esta Seguro que desea eliminar la Lista</p>
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
					<h4><i class="fa fa-users"></i>Lista de Precios</h4>
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
                                <th class="">nombre</th>
                                <th class="">descripcion</th>
	                            <th class="">fecha</th>
                                <th class=""></th>
							</tr>
						</thead>
						<tbody id="BodyTable" runat="server">
						</tbody>
						<tfoot>
							<tr>
								<th class="">nombre</th>
                                <th class="">descripcion</th>
	                            <th class="">fecha</th>
                                <th class=""></th>
							</tr>
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
        var id = $(e).attr("id");
        $("#<%=hddID.ClientID %>").val(id);
        /*
        var sap = $(e).parent().parent().children('td').eq(0).text();
        var rut = $(e).parent().parent().children('td').eq(1).text();
        var nombre = $(e).parent().parent().children('td').eq(2).text();
        var apellido = $(e).parent().parent().children('td').eq(3).text();
        var direccion = $(e).parent().parent().children('td').eq(4).text();
        var fono = $(e).parent().parent().children('td').eq(5).text();
        var razonsocial = $(e).parent().parent().children('td').eq(7).text();
        formaPago = $(e).parent().parent().children('td').eq(6).text();
        $("#<%=txtUpdateSap.ClientID %>").val(sap);
        $("#<%=txtUpdateRut.ClientID %>").val(rut);
        $("#<%=txtUpdateNombre.ClientID %>").val(nombre);
        $("#<%=txtUpdateApellido.ClientID %>").val(apellido);
        $("#<%=txtUpdateMail.ClientID %>").val(mail);
        $("#<%=txtUpdateDireccion.ClientID %>").val(direccion);
        $("#<%=txtUpdateFono.ClientID %>").val(fono);
        $("#<%=txtUpdateRazonSocial.ClientID %>").val(razonsocial);

        if (formaPago == 'Contado') {
            $('input[name=ddlFormaPago][value=Contado]').prop('checked', true);
        } else {
            $('input[name=ddlFormaPago][value=Credito]').prop('checked', true);
        }
        */
        return false;
    }
    function deleteUser(e) {
        $("#InsertUserDiv").fadeOut();
        $("#UpdateUserDiv").fadeOut();
        $("#DeleteUserDiv").fadeIn();
        var id = $(e).attr("id");
        $("#<%=hddKey.ClientID %>").val(id);
        return false;
    }
</script>
</asp:Content>

