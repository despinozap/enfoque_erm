<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="OTs.aspx.cs" Inherits="Taller_OTs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- DateTimePicker CSS -->
    <link href="../Theme/js/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet">

	<!-- DATA TABLES -->
	<link rel="stylesheet" type="text/css" href="../Theme/js/datatables/css/jquery.dataTables.min.css" />

    <!-- BOOTSTRAP SWITCH -->
	<link rel="stylesheet" type="text/css" href="../Theme/js/bootstrap-switch/bootstrap-switch.min.css" />

    <!-- MAGIC SUGGEST -->
    <link href="../Theme/js/magic-suggest/magicsuggest-1.3.1-min.css" rel="stylesheet" type="text/css" />

    <style>
        .requiredText
        {
            color: red;
            display: none;
        }

        .infoTable
        {
            width: 90%;
            margin: auto;
        }

        .infoTitle
        {
            width: 20%;
            text-align: center;
            background-color: #808080;
            color: #FFFFFF;
        }

        .infoValue
        {
            width: 30%;
            text-align: left;
            padding-left: 30px;
        }

        .multiLineText
        {
            resize: none;
        }

    </style>
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
					    <h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i> Ordenes de trabajo (OT)</h3>
                    </div>     
			    </div>
		    </div>
	    </div>
        <!-- /PAGE HEADER -->
        <!-- Div Detail OT -->
        <div class="row" id="divDetailOT" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Detalle de OT #<label id="divDetailOT_lbTitulo"></label> (Estado: <label id="divDetailOT_lbEstado"></label>)</h4>
					    <div class="tools">
						    <a href="javascript:cancelDetailOT();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
                        <div id="divDetailOT_OT" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>OT</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha de registro
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_OT_lbFecha">
						                                </label>
                                                    </td>
													<td class="infoTitle">
                                                        <label>
                                                            Fecha de compromiso
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_OT_lbFechaCompromiso">
						                                </label>
                                                    </td>
                                                </tr>
												<tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha de cierre
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_OT_lbFechaCierre">
						                                </label>
                                                    </td>
													<td class="infoTitle">
                                                        <label>
                                                            Estado
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_OT_lbEstado">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_Ingreso" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Ingreso</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            ID
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Ingreso_lbId">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha de recepción
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Ingreso_lbFechaRecepcion">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_Empresa" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Empresa</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Nombre
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Empresa_lbNombre">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            RUT
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Empresa_lbRUT">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Forma de trabajar
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Empresa_lbFormaTrabajar">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Contacto
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Empresa_lbContacto">
						                                </label>
                                                    </td>
                                                </tr>
												<tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Teléfono
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Empresa_lbTelefono">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Email
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Empresa_lbEmail">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_Equipo" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Equipo</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            ID
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Equipo_lbId">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Nombre
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Equipo_lbNombre">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Modelo
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Equipo_lbModelo">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Nº Serie
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailOT_Equipo_lbNumeroSerie">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fotos
                                                        </label>
                                                    </td>
                                                    <td colspan="3" class="infoValue">
                                                        <table id="tbDetailOT_Equipo_Fotos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
										                    <thead>
											                    <tr>
												                    <th>Nombre</th>
												                    <th>Tamaño</th>
												                    <th>Tipo</th>          
												                    <th>Opciones</th>
											                    </tr>
										                    </thead>
										                    <tbody>
										                    </tbody>
										                    <tfoot>
										                    </tfoot>
									                    </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
                                    <div class="form-group"> 
                                        <div class="col-md-12">
									        
                                        </div>
								    </div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_Presupuestos" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Presupuestos</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailOT_Presupuestos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Descripci&oacute;n fallo</th>
														<th>Fecha compromiso</th>
														<th>Técnico</th>
														<th>Total</th>
														<th>Estado</th>
                                                        <th>Opciones</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
                                                    <tr>
                                                        <td colspan="4" style="text-align: center; background-color: #808080; color: #FFFFFF;">
                                                            Total presupuestos
                                                        </td>
                                                        <td style="text-align: right;">
                                                            <label id="divDetailOT_Presupuestos_lbTotal">$0</label>
                                                        </td>
                                                        <td colspan="2">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
												</tfoot>
											</table>
										</div>                                  
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<a id="divDetailOT_Presupuestos_btAddPresupuesto" class="btn btn-success pull-right" href="javascript:tbOT_addPresupuesto();"><i class="fa fa-plus"></i> Agregar presupuesto</a>
										</div>
									</div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_Repuestos" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Repuestos</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailOT_Repuestos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Sap</th>
														<th>Código</th>
														<th>Nombre</th>            
														<th>Cantidad</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
												</tfoot>
											</table>
										</div>                                  
									</div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_SolicitudesCompra" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Solicitudes de compra</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailOT_SolicitudesCompra" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Nº solicitud</th>
														<th>Observaciones</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
													<tr>
														<td>
                                                            &nbsp;
														</td>
														<td>
                                                            <div class="form-horizontal" role="form">
															    <div class="form-group">
								                                    <div class="col-md-12">										 
									                                    <asp:TextBox type="text" ID="txtDetailOT_SolicitudesCompra_NumeroSolicitudCompra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>					 
									                                    <span class="requiredText" id="divDetailOT_SolicitudesCompra_vfNumeroSolicitudCompra">Debes ingresar el n&uacute;mero de solicitud de compra</span>
								                                    </div>
                                                                </div>
                                                            </div>
														</td>
														<td>
                                                            <div class="form-horizontal" role="form">
                                                                <div class="form-group">
								                                    <div class="col-md-12">	
                                                                        <asp:TextBox type="text" ID="txtDetailOT_SolicitudesCompra_Observaciones" class="form-control multiLineText" runat="server" ReadOnly="false" Rows="3" TextMode="MultiLine"></asp:TextBox>										 				 
								                                    </div>
                                                                </div>
                                                            </div>
														</td>
														<td style="text-align: center;">
															<a class="btn btn-success" href="javascript:tryInsert_DetailOT_SolicitudCompra();"><i class="fa fa-plus"></i> Agregar</a>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>                                  
									</div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_OrdenesCompra" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Ordenes de compra</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailOT_OrdenesCompra" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Nº orden</th>
														<th>Observaciones</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
													<tr>
														<td>
                                                            &nbsp;
														</td>
														<td>
                                                            <div class="form-horizontal" role="form">
															    <div class="form-group">
								                                    <div class="col-md-12">										 
									                                    <asp:TextBox type="text" ID="txtDetailOT_OrdenesCompra_NumeroOrdenCompra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>					 
									                                    <span class="requiredText" id="divDetailOT_OrdenesCompra_vfNumeroOrdenCompra">Debes ingresar el n&uacute;mero de orden de compra</span>
								                                    </div>
                                                                </div>
                                                            </div>
														</td>
														<td>
                                                            <div class="form-horizontal" role="form">
                                                                <div class="form-group">
								                                    <div class="col-md-12">	
                                                                        <asp:TextBox type="text" ID="txtDetailOT_OrdenesCompra_Observaciones" class="form-control multiLineText" runat="server" ReadOnly="false" Rows="3" TextMode="MultiLine"></asp:TextBox>										 				 
								                                    </div>
                                                                </div>
                                                            </div>
														</td>
														<td style="text-align: center;">
															<a class="btn btn-success" href="javascript:tryInsert_DetailOT_OrdenCompra();"><i class="fa fa-plus"></i> Agregar</a>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>                                  
									</div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_Requisiciones" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Requisiciones</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailOT_Requisiciones" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Nº requisici&oacute;n</th>
														<th>Fecha</th>
														<th>Retirado por</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
												</tfoot>
											</table>
										</div>                                  
									</div>
                                    <div class="form-group">
										<div class="col-md-12">
											<a id="divDetailOT_Requisiciones_btAddRequisicion" class="btn btn-success pull-right" href="javascript:tbDetailOT_Requisiciones_addRequisicion();"><i class="fa fa-plus"></i> Agregar requisici&oacute;n</a>
										</div>
									</div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_InformesEntrega" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Informes de entrega</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailOT_InformesEntrega" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Nº informe</th>
														<th>Observaciones</th>
														<th>Opciones</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
													<tr>
														<td>
                                                            &nbsp;
														</td>
														<td>
                                                            <div class="form-horizontal" role="form">
															    <div class="form-group">
								                                    <div class="col-md-12">										 
									                                    <asp:TextBox type="text" ID="txtDetailOT_InformesEntrega_NumeroInformeEntrega" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>					 
									                                    <span class="requiredText" id="divDetailOT_InformesEntrega_vfNumeroInformeEntrega">Debes ingresar el n&uacute;mero de informe de entrega</span>
								                                    </div>
                                                                </div>
                                                            </div>
														</td>
														<td>
                                                            <div class="form-horizontal" role="form">
                                                                <div class="form-group">
								                                    <div class="col-md-12">	
                                                                        <asp:TextBox type="text" ID="txtDetailOT_InformesEntrega_Observaciones" class="form-control multiLineText" runat="server" ReadOnly="false" Rows="3" TextMode="MultiLine"></asp:TextBox>										 				 
								                                    </div>
                                                                </div>
                                                            </div>
														</td>
														<td style="text-align: center;">
															<a class="btn btn-success" href="javascript:tryInsert_DetailOT_InformeEntrega();"><i class="fa fa-plus"></i> Agregar</a>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>                                  
									</div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailOT_Cierre" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Cierre</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
                                    <div style="text-align: center;">
                                        <a class="btn btn-lg btn-block btn-inverse" href="javascript:tryCloseOT();"><i class="fa fa-lock"></i> Cerrar OT</a>
                                    </div>
		                        </div>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Div Update OT -->
        <div class="row" id="divUpdateOT" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Editar OT #<label id="divUpdateOT_lbTitulo"></label></h4>
					    <div class="tools">
						    <a href="javascript:cancelUpdateOT();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
						<div class="form-horizontal" role="form">
							<div class="form-group"> 
								<label class="col-md-2 control-label">
									Nº de solicitud de compra <span class="required">*</span>
								</label>
								<div class="col-md-4">											 
									<asp:TextBox type="text" ID="txtUpdateOT_NumeroSolicitudCompra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
									<span class="requiredText" id="divUpdateOT__vfNumeroSolicitudCompra">Debes ingresar el número de solicitud de compra</span>
								</div>
								<label class="col-md-2 control-label">
									Nº de orden de compra <span class="required">*</span>
								</label>
								<div class="col-md-4">											 
									<asp:TextBox type="text" ID="txtUpdateOT_NumeroOrdenCompra" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
									<span class="requiredText" id="divUpdateOT_vfNumeroOrdenCompra">Debes ingresar el número de orden de compra</span>
								</div>
							</div>
							<div class="form-group"> 
								<label class="col-md-2 control-label">
									Nº de requisición <span class="required">*</span>
								</label>
								<div class="col-md-4">											 
									<asp:TextBox type="text" ID="txtUpdateOT_NumeroRequisicion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
									<span class="requiredText" id="divUpdateOT_vfNumeroRequisicion">Debes ingresar el número de requisición</span>
								</div>
								<label class="col-md-2 control-label">
									Nº de informe entrega <span class="required">*</span>
								</label>
								<div class="col-md-4">											 
									<asp:TextBox type="text" ID="txtUpdateOT_NumeroInformeEntrega" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
									<span class="requiredText" id="divUpdateOT_vfNumeroInformeEntrega">Debes ingresar el número de informe entrega</span>
								</div>
							</div>
						</div>
                        <ul class="pager">
                            <li class="previous disabled"><a href="javascript:;">&larr; Anterior</a></li>
						    <li class="next"><a href="javascript:tryUpdateOT();">Siguiente &rarr;</a></li>
					    </ul>
					</div>
				</div>
			</div>                
		</div>
        <!-- Div Detail Presupuesto -->
        <div class="row" id="divDetailPresupuesto" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Detalle de Presupuesto #<label id="divDetailPresupuesto_lbTitulo"></label></h4>
					    <div class="tools">
						    <a href="javascript:cancelDetailOT_Presupuesto();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
                        <div id="divDetailPresupuesto_Presupuesto" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Presupuesto</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha registro
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbFecha">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Estado
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbEstado">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha compromiso
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbFechaCompromiso">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Valor técnico
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbValorTecnico">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha cierre
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbFechaCierre">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Valor repuestos
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbValorRepuestos">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Descripción del fallo
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbDescripcionFallo">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Valor neto
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbValorNeto">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Causa probable
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbCausaProbable">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            IVA
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbIva">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Técnico asignado
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbTecnicoAsignado">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Total
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbTotal">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Observaciones
                                                        </label>
                                                    </td>
                                                    <td colspan="3" class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbObservaciones">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailPresupuesto_Trabajador" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Trabajador</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            RUT
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Trabajador_lbRut">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Nombre
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Trabajador_lbNombre">
						                                </label>
                                                    </td>
                                                </tr>
												<tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Cargo
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Trabajador_lbCargo">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Email
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Trabajador_lbEmail">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Cantidad de horas
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Trabajador_lbCantidadHoras">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Valor HH
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Trabajador_lbValorHH">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailPresupuesto_Repuestos" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Repuestos</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailPresupuesto_Repuestos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Sap</th>
														<th>Código</th>
														<th>Nombre</th>            
														<th>Valor unitario</th>
														<th>Cantidad</th>
														<th>Total</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
                                                    <tr>
                                                        <td colspan="6" style="text-align: center; background-color: #808080; color: #FFFFFF;">
                                                            Total repuestos
                                                        </td>
                                                        <td style="text-align: right;">
                                                            <label id="divDetailPresupuesto_Repuestos_lbTotalRepuestos">
						                                    </label>
                                                        </td>
                                                    </tr>
												</tfoot>
											</table>
										</div>                                  
									</div>
		                        </div>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Div Update Presupuesto -->
        <div class="row" id="divUpdatePresupuesto" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Editar presupuesto #<label id="divUpdatePresupuesto_lbTitulo"></label></h4>
					    <div class="tools">
						    <a href="javascript:cancelUpdatePresupuesto();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
                        <div class="tabbable">
					        <ul class="nav nav-tabs">
						        <li class="active"><a href="#divUpdatePresupuesto_Antecedentes" data-toggle="tab" id="divUpdatePresupuesto_tabAntecedentes"><i class="fa fa-files-o"></i> Antecedentes</a></li>
                                <li><a href="#divUpdatePresupuesto_Tecnico" data-toggle="tab" id="divUpdatePresupuesto_tabTecnico"><i class="fa fa-user"></i> Técnico</a></li>
						        <li><a href="#divUpdatePresupuesto_Repuestos" data-toggle="tab" id="divUpdatePresupuesto_tabRepuestos"><i class="fa fa-cogs"></i> Repuestos</a></li>
                                <li><a href="#divUpdatePresupuesto_Confirmacion" data-toggle="tab" id="divUpdatePresupuesto_tabConfirmacion"><i class="fa fa-check"></i> Confirmación</a></li>
					        </ul>
					        <div class="tab-content">
                                <div class="tab-pane fade in active" id="divUpdatePresupuesto_Antecedentes">
							        <div class="panel panel-default">
									    <div class="panel-heading">
										    <h3 class="panel-title">Antecedentes</h3>
									    </div>
									    <div class="panel-body">
                                            <label id="lbUpdatePresupuesto_TallerPresupuestoID" style="display: none;">-1</label>
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Fecha de compromiso <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">	
                                                        <div class="input-group">
												            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											                <asp:TextBox type="text" ID="txtUpdatePresupuesto_Antecedentes_FechaCompromiso" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
											            </div>										 
                                                        <span class="requiredText" id="divUpdatePresupuesto_Antecedentes_vfFechaCompromiso">Debes ingresar la fecha de compromiso</span>						 
						                            </div>
                                                    <label class="col-md-2 control-label">
						                            </label>
						                            <div class="col-md-4">											 
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
						                            <label class="col-md-2 control-label">
							                            Descripción del fallo
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:TextBox type="text" ID="txtUpdatePresupuesto_Antecedentes_DescripcionFallo" class="form-control" runat="server" ReadOnly="false" Rows="4" TextMode="MultiLine"></asp:TextBox>							 
						                            </div>
                                                </div>
                                                <div class="form-group"> 
						                            <label class="col-md-2 control-label">
							                            Causa probable
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:TextBox type="text" ID="txtUpdatePresupuesto_Antecedentes_CausaProbable" class="form-control" runat="server" ReadOnly="false" Rows="4" TextMode="MultiLine"></asp:TextBox>							 
						                            </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous disabled"><a href="#">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divUpdatePresupuesto_goTabTecnico(1);">Siguiente &rarr;</a></li>
									</ul>
						        </div>
                                <div class="tab-pane fade" id="divUpdatePresupuesto_Tecnico">
							        <div class="panel panel-default">
									    <div class="panel-heading">
										    <h3 class="panel-title">Técnico asignado</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Técnico <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:DropDownList ID="ddlUpdatePresupuesto_Tecnico" CssClass="form-control" runat="server"></asp:DropDownList>										 
						                                <span class="requiredText" id="divUpdatePresupuesto_Tecnico_vfTecnico">Debes seleccionar el técnico</span>
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Cantidad de horas <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:TextBox type="number" ID="txtUpdatePresupuesto_Tecnico_CantidadHoras" min="1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divUpdatePresupuesto_Tecnico_vfCantidadHoras">Debes ingresar la cantidad de horas asignadas</span>
                                                    </div>
								                    <label class="col-md-2 control-label">
							                            Valor HH <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:TextBox type="number" ID="txtUpdatePresupuesto_Tecnico_ValorHH" min="1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divUpdatePresupuesto_Tecnico_vfValorHH">Debes ingresar el valor hora del técnico asignado</span>
                                                    </div>
                                                </div>
                                                <label id="lbUpdatePresupuesto_Tecnico_ValorNeto" style="display: none;">0</label>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous"><a href="javascript:divUpdatePresupuesto_goTabAntecedentes(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divUpdatePresupuesto_goTabRepuestos(1);">Siguiente &rarr;</a></li>
									</ul>
						        </div>
                                <div class="tab-pane fade" id="divUpdatePresupuesto_Repuestos">
							        <div class="panel panel-default" id="divUpdatePresupuesto_RepuestosSelect" style="display: none;">
									    <div class="panel-heading">
										    <h3 class="panel-title">Seleccionar repuesto</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Repuesto (sap) <span class="required">*</span>
						                            </label>
						                            <div class="col-md-6">											 
                                                        <input type="text" id="ddlUpdatePresupuesto_Repuesto" class="form-control" />									 
						                                <span class="requiredText" id="divUpdatePresupuesto_Repuestos_vfRepuesto">Debes seleccionar el repuesto</span>
                                                    </div>
                                                    <label class="col-md-2 control-label">
							                            Cantidad <span class="required">*</span>
						                            </label>
						                            <div class="col-md-2">											 
                                                        <asp:TextBox type="number" ID="txtUpdatePresupuesto_Repuestos_Cantidad" min="1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divUpdatePresupuesto_Repuestos_vfCantidad">Debes ingresar la cantidad</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-10 col-md-offset-2">
                                                        <a class="btn btn-danger pull-right" href="javascript:updatePresupuesto_RepuestoSelect_Cancel();"><i class="fa fa-times"></i> Cancelar</a>
                                                        <a class="btn btn-success pull-right" href="javascript:updatePresupuesto_RepuestoSelect_Success();"><i class="fa fa-plus"></i> Aceptar</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <div class="panel panel-default" id="divUpdatePresupuesto_RepuestosList">
									    <div class="panel-heading">
										    <h3 class="panel-title">Lista de repuestos incluídos</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbUpdatePresupuesto_Repuestos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th width="5%">ID</th>
                                                                    <th width="10%">Sap</th>
	                                                                <th width="10%">Código</th>
	                                                                <th width="25%">Nombre</th>            
                                                                    <th width="20%">Valor unitario</th>
                                                                    <th width="10%">Cantidad</th>
                                                                    <th width="10%">Valor total</th>
                                                                    <th width="10%">Opciones</th>
							                                    </tr>
						                                    </thead>
						                                    <tbody>
                                                                <tr>
                                                                    <td colspan="8" style="text-align:center;">
                                                                        <label>No hay elementos cargados en la lista</label>
                                                                    </td>
                                                                </tr>
						                                    </tbody>
						                                    <tfoot>
                                                                <tr>
                                                                    <td colspan="6" style="text-align: right;">
                                                                        <label>Valor neto repuestos</label>
                                                                    </td>
                                                                    <td style="text-align:right;">
                                                                        <label id="lbUpdatePresupuesto_Repuestos_ValorNeto">0</label>
                                                                    </td>
                                                                </tr>
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                                <a class="btn btn-success pull-right" href="javascript:showUpdatePresupuesto_RepuestoAdd();"><i class="fa fa-plus"></i> Agregar</a>
                                            </div>
                                        </div>
								    </div>
						            <ul class="pager">
                                        <li class="previous"><a href="javascript:divUpdatePresupuesto_goTabTecnico(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divUpdatePresupuesto_goTabConfirmacion(1);">Siguiente &rarr;</a></li>
									</ul>
                                </div>
                                <div class="tab-pane fade" id="divUpdatePresupuesto_Confirmacion">
							        <div class="panel panel-default">
									    <div class="panel-heading">
										    <h3 class="panel-title">Confirmación</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbUpdatePresupuesto_Confirmacion" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th colspan="2">Resumen del presupuesto</th>
							                                    </tr>
						                                    </thead>
						                                    <tbody>
																<tr>
																	<td style="text-align: right;">
                                                                        <label>Valor neto técnico</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbUpdatePresupuesto_Confirmacion_ValorNetoRepuestos">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>Valor neto repuestos</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbUpdatePresupuesto_Confirmacion_ValorNetoTecnico">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>Subtotal</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbUpdatePresupuesto_Cofirmacion_Subtotal">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>IVA</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbUpdatePresupuesto_Confirmacion_IVA">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>Total</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbUpdatePresupuesto_Confirmacion_Total">0</label>
																	</td>
																</tr>
						                                    </tbody>
						                                    <tfoot>
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous"><a href="javascript:divUpdatePresupuesto_goTabRepuestos(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:tryUpdatePresupuesto();">Siguiente &rarr;</a></li>
									</ul>
						        </div>
					        </div>
					    </div>
                    </div>                
			    </div>
			    <!-- /BOX -->
            </div>
        </div>
        <!-- Div Insert Presupuesto -->
        <div class="row" id="divInsertPresupuesto" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Nuevo presupuesto (<label id="divInsertPresupuesto_lbTitulo"></label>)</h4>
					    <div class="tools">
						    <a href="javascript:cancelInsertPresupuesto();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
                        <div class="tabbable">
					        <ul class="nav nav-tabs">
						        <li class="active"><a href="#divInsertPresupuesto_Antecedentes" data-toggle="tab" id="divInsertPresupuesto_tabAntecedentes"><i class="fa fa-files-o"></i> Antecedentes</a></li>
                                <li><a href="#divInsertPresupuesto_Tecnico" data-toggle="tab" id="divInsertPresupuesto_tabTecnico"><i class="fa fa-user"></i> Técnico</a></li>
						        <li><a href="#divInsertPresupuesto_Repuestos" data-toggle="tab" id="divInsertPresupuesto_tabRepuestos"><i class="fa fa-cogs"></i> Repuestos</a></li>
                                <li><a href="#divInsertPresupuesto_Confirmacion" data-toggle="tab" id="divInsertPresupuesto_tabConfirmacion"><i class="fa fa-check"></i> Confirmación</a></li>
					        </ul>
					        <div class="tab-content">
                                <div class="tab-pane fade in active" id="divInsertPresupuesto_Antecedentes">
							        <div class="panel panel-default">
									    <div class="panel-heading">
										    <h3 class="panel-title">Antecedentes</h3>
									    </div>
									    <div class="panel-body">
                                            <label id="lbInsertPresupuesto_TallerOTID" style="display: none;">-1</label>
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Fecha de compromiso <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">	
                                                        <div class="input-group">
												            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											                <asp:TextBox type="text" ID="txtInsertPresupuesto_Antecedentes_FechaCompromiso" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
											            </div>										 
                                                        <span class="requiredText" id="divInsertIngreso_Antecedentes_vfFechaCompromiso">Debes ingresar la fecha de compromiso</span>						 
						                            </div>
                                                    <label class="col-md-2 control-label">
						                            </label>
						                            <div class="col-md-4">											 
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
						                            <label class="col-md-2 control-label">
							                            Descripción del fallo
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:TextBox type="text" ID="txtInsertPresupuesto_Antecedentes_DescripcionFallo" class="form-control" runat="server" ReadOnly="false" Rows="4" TextMode="MultiLine"></asp:TextBox>							 
						                            </div>
                                                </div>
                                                <div class="form-group"> 
						                            <label class="col-md-2 control-label">
							                            Causa probable
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:TextBox type="text" ID="txtInsertPresupuesto_Antecedentes_CausaProbable" class="form-control" runat="server" ReadOnly="false" Rows="4" TextMode="MultiLine"></asp:TextBox>							 
						                            </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous disabled"><a href="#">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divInsertPresupuesto_goTabTecnico(1);">Siguiente &rarr;</a></li>
									</ul>
						        </div>
                                <div class="tab-pane fade" id="divInsertPresupuesto_Tecnico">
							        <div class="panel panel-default">
									    <div class="panel-heading">
										    <h3 class="panel-title">Técnico asignado</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Técnico <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:DropDownList ID="ddlInsertPresupuesto_Tecnico" CssClass="form-control" runat="server"></asp:DropDownList>										 
						                                <span class="requiredText" id="divInsertPresupuesto_Tecnico_vfTecnico">Debes seleccionar el técnico</span>
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Cantidad de horas <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:TextBox type="number" ID="txtInsertPresupuesto_Tecnico_CantidadHoras" min="1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divInsertPresupuesto_Tecnico_vfCantidadHoras">Debes ingresar la cantidad de horas asignadas</span>
                                                    </div>
								                    <label class="col-md-2 control-label">
							                            Valor HH <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:TextBox type="number" ID="txtInsertPresupuesto_Tecnico_ValorHH" min="1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divInsertPresupuesto_Tecnico_vfValorHH">Debes ingresar el valor hora del técnico asignado</span>
                                                    </div>
                                                </div>
                                                <label id="lbInsertPresupuesto_Tecnico_ValorNeto" style="display: none;">0</label>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous"><a href="javascript:divInsertPresupuesto_goTabAntecedentes(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divInsertPresupuesto_goTabRepuestos(1);">Siguiente &rarr;</a></li>
									</ul>
						        </div>
                                <div class="tab-pane fade" id="divInsertPresupuesto_Repuestos">
							        <div class="panel panel-default" id="divInsertPresupuesto_RepuestosSelect" style="display: none;">
									    <div class="panel-heading">
										    <h3 class="panel-title">Seleccionar repuesto</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Repuesto (sap) <span class="required">*</span>
						                            </label>
						                            <div class="col-md-6">											 
                                                        <input type="text" id="ddlInsertPresupuesto_Repuesto" class="form-control" />									 
						                                <span class="requiredText" id="divInsertPresupuesto_Repuestos_vfRepuesto">Debes seleccionar el repuesto</span>
                                                    </div>
                                                    <label class="col-md-2 control-label">
							                            Cantidad <span class="required">*</span>
						                            </label>
						                            <div class="col-md-2">											 
                                                        <asp:TextBox type="number" ID="txtInsertPresupuesto_Repuestos_Cantidad" min="1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divInsertPresupuesto_Repuestos_vfCantidad">Debes ingresar la cantidad</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-10 col-md-offset-2">
                                                        <a class="btn btn-danger pull-right" href="javascript:insertPresupuesto_RepuestoSelect_Cancel();"><i class="fa fa-times"></i> Cancelar</a>
                                                        <a class="btn btn-success pull-right" href="javascript:insertPresupuesto_RepuestoSelect_Success();"><i class="fa fa-plus"></i> Aceptar</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <div class="panel panel-default" id="divInsertPresupuesto_RepuestosList">
									    <div class="panel-heading">
										    <h3 class="panel-title">Lista de repuestos incluídos</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbInsertPresupuesto_Repuestos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th width="5%">ID</th>
                                                                    <th width="10%">Sap</th>
                                                                    <th width="10%">Código</th>
	                                                                <th width="25%">Nombre</th>            
                                                                    <th width="20%">Valor unitario</th>
                                                                    <th width="10%">Cantidad</th>
                                                                    <th width="10%">Valor total</th>
                                                                    <th width="10%">Opciones</th>
							                                    </tr>
						                                    </thead>
						                                    <tbody>
                                                                <tr>
                                                                    <td colspan="8" style="text-align:center;">
                                                                        <label>No hay elementos cargados en la lista</label>
                                                                    </td>
                                                                </tr>
						                                    </tbody>
						                                    <tfoot>
                                                                <tr>
                                                                    <td colspan="6" style="text-align: right;">
                                                                        <label>Valor neto repuestos</label>
                                                                    </td>
                                                                    <td style="text-align:right;">
                                                                        <label id="lbInsertPresupuesto_Repuestos_ValorNeto">0</label>
                                                                    </td>
                                                                </tr>
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                                <a class="btn btn-success pull-right" href="javascript:showInsertPresupuesto_RepuestoAdd();"><i class="fa fa-plus"></i> Agregar</a>
                                            </div>
                                        </div>
								    </div>
						            <ul class="pager">
                                        <li class="previous"><a href="javascript:divInsertPresupuesto_goTabTecnico(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divInsertPresupuesto_goTabConfirmacion(1);">Siguiente &rarr;</a></li>
									</ul>
                                </div>
                                <div class="tab-pane fade" id="divInsertPresupuesto_Confirmacion">
							        <div class="panel panel-default">
									    <div class="panel-heading">
										    <h3 class="panel-title">Confirmación</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbInsertPresupuesto_Confirmacion" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th colspan="2">Resumen del presupuesto</th>
							                                    </tr>
						                                    </thead>
						                                    <tbody>
																<tr>
																	<td style="text-align: right;">
                                                                        <label>Valor neto técnico</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbInsertPresupuesto_Confirmacion_ValorNetoRepuestos">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>Valor neto repuestos</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbInsertPresupuesto_Confirmacion_ValorNetoTecnico">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>Subtotal</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbInsertPresupuesto_Cofirmacion_Subtotal">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>IVA</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbInsertPresupuesto_Confirmacion_IVA">0</label>
																	</td>
																</tr>
                                                                <tr>
																	<td style="text-align: right;">
                                                                        <label>Total</label>
																	</td>
																	<td style="text-align: right;">
                                                                        <label id="lbInsertPresupuesto_Confirmacion_Total">0</label>
																	</td>
																</tr>
						                                    </tbody>
						                                    <tfoot>
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous"><a href="javascript:divInsertPresupuesto_goTabRepuestos(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:tryInsertPresupuesto();">Siguiente &rarr;</a></li>
									</ul>
						        </div>
					        </div>
					    </div>
                    </div>                
			    </div>
			    <!-- /BOX -->
            </div>
        </div>
        <!-- Div Detail Requisicion -->
        <div class="row" id="divDetailRequisicion" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Detalle de requisici&oacute;n #<label id="divDetailRequisicion_lbTitulo"></label></h4>
					    <div class="tools">
						    <a href="javascript:cancelDetailOT_Requisicion();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
                        <div id="divDetailRequisicion_Requisicion" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Requisici&oacute;n</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Nº requisición
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailRequisicion_Requisicion_lbNumeroRequisicion">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha requisición
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailRequisicion_Requisicion_lbFecha">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Retirado por
                                                        </label>
                                                    </td>
                                                    <td colspan="3" class="infoValue">
                                                        <label id="divDetailRequisicion_Requisicion_lbRetiradoPor">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
		                        </div>
	                        </div>
                        </div>
						<div id="divDetailRequisicion_Trabajador" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Retirado por</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
			                        <div class="form-group">
                                        <table class="infoTable table table-bordered">
                                            <thead>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            RUT
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailRequisicion_Trabajador_lbRut">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Nombre
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailRequisicion_Trabajador_lbNombre">
						                                </label>
                                                    </td>
                                                </tr>
												<tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Cargo
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailRequisicion_Trabajador_lbCargo">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Email
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailRequisicion_Trabajador_lbEmail">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
			                        </div>
		                        </div>
	                        </div>
                        </div>
                        <div id="divDetailRequisicion_Repuestos" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Repuestos</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
									<div class="form-group"> 
										<div class="col-md-12">
											<table id="tbDetailRequisicion_Repuestos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>ID</th>
                                                        <th>Sap</th>
														<th>Código</th>
														<th>Nombre</th>            
														<th>Cantidad</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
												<tfoot>
												</tfoot>
											</table>
										</div>                                  
									</div>
		                        </div>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Div Insert Requisicion -->
        <div class="row" id="divInsertRequisicion" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Nueva requisici&oacute;n (OT #<label id="divInsertRequisicion_lbTitulo"></label>)</h4>
					    <div class="tools">
						    <a href="javascript:cancelInsertRequisicion();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
						<div class="form-horizontal" role="form">
							<div class="form-group">
                                <label class="col-md-2 control-label">
									Nº requisici&oacute;n <span class="required">*</span>
								</label>
								<div class="col-md-4">											 
									<asp:TextBox type="text" ID="txtInsertRequisicion_NumeroRequisicion" min="1" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>					 
									<span class="requiredText" id="divInsertRequisicion_vfNumeroRequisicion">Debes ingresar el n&uacute;mero de requisici&oacute;n</span>
								</div>
								<label class="col-md-2 control-label">
									Retirado por <span class="required">*</span>
								</label>
								<div class="col-md-4">											 
									<asp:DropDownList ID="ddlInsertRequisicion_RetiradoPor" CssClass="form-control" runat="server"></asp:DropDownList>										 
									<span class="requiredText" id="divInsertRequisicion_vfRetiradoPor">Debes seleccionar la persona que hace el retiro</span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<table id="tbInsertRequisicion_Repuestos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
										<thead>
											<tr>
                                                <th style="display: none;">cantidadPorRequisar</th>
												<th width="5%">ID</th>
												<th width="20%">Sap</th>
												<th width="20%">Código</th>
												<th width="35%">Nombre</th>            
												<th width="10%">Cantidad</th>
												<th width="10%">Seleccionar</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td colspan="7" style="text-align:center;">
													<label>No hay elementos cargados en la lista</label>
												</td>
											</tr>
										</tbody>
										<tfoot>
										</tfoot>
									</table>
                                    <span class="requiredText" id="divInsertRequisicion_vfRepuestos">Debes seleccionar los repuestos requisados</span>
								</div>
							</div>
						</div>
                        <ul class="pager">
                            <li class="previous disabled"><a href="javascript:;">&larr; Anterior</a></li>
						    <li class="next"><a href="javascript:tryInsertRequisicion();">Siguiente &rarr;</a></li>
					    </ul>
					</div>
				</div>
			</div>                
		</div>
        <!-- Data List OT -->
        <div class="row" id="divListOT">
            <!-- DATA TABLES -->
		    <div class="col-md-12">            
			    <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-users"></i>Ordenes de trabajo (OT)</h4>
                        <div class="make-switch switch-small" data-on="success" data-off="danger" style="margin-left: 10px;">
							<input type="checkbox" id="chbOT_Status" checked>
						</div>
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
					    <table id="dtOT" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						    <thead>
							    <tr>
                                    <th class="">ID OT</th>
                                    <th class="">ID Equipo</th>
                                    <th class="">Empresa</th>
                                    <th class="">Fecha creación</th> 
	                                <th class="">Fecha compromiso</th>  
                                    <th class="">Estado</th>        
                                    <th class="">Opciones</th>
							    </tr>
						    </thead>
						    <tbody runat="server">
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

    <!-- DateTimePicker JavaScript -->
    <script src="../Theme/js/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="../Theme/js/bootstrap-datetimepicker/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>

    <!-- DATA TABLES -->
	<script type="text/javascript" src="../Theme/js/datatables/js/jquery.dataTables.min.js"></script>

    <!-- BOOTSTRAP SWITCH -->
	<script type="text/javascript" src="../Theme/js/bootstrap-switch/bootstrap-switch.min.js"></script>

    <!-- MAGIC SUGGEST -->
    <script src="../Theme/js/magic-suggest/magicsuggest-1.3.1-min.js" type="text/javascript"></script>


    <script type="text/javascript">

        $(document).ready(
            function ()
            {
                $('#chbOT_Status').change(
                    function()
                    {
                        loadOT_loadDTOT();
                    }
                );

                $('.collapseBoxButton').click(
                    function (e)
                    {
                        e.preventDefault();

                        var box = $($($(this).parent()).parent()).parent();
                        var boxBody = $($(box).find('.box-body')).get(0);

                        if ($(boxBody).is(':visible'))
                        {
                            collapseBox(box, true);
                        }
                        else
                        {
                            collapseBox(box, false);
                        }
                    }
                );

                formatTable();

                //Insert presupuesto
                {
                    $("#<%= txtInsertPresupuesto_Antecedentes_FechaCompromiso.ClientID %>").datetimepicker({
                        rtl: true,
                        format: "yyyy-mm-dd hh:ii",
                        language: "es",
                        startDate: new Date(),
                        autoclose: true,
                        showMeridian: true,
                        pickerPosition: "top-center",
                        pick12HourFormat: false
                    });

                }

                //Update presupuesto
                {
                    $("#<%= txtUpdatePresupuesto_Antecedentes_FechaCompromiso.ClientID %>").datetimepicker({
                        rtl: true,
                        format: "yyyy-mm-dd hh:ii",
                        language: "es",
                        startDate: new Date(),
                        autoclose: true,
                        showMeridian: true,
                        pickerPosition: "top-center",
                        pick12HourFormat: false
                    });
                }

                loadOT_loadDTOT();
            }
        );



        function collapseBox(box, collapse)
        {
            var boxTitle = $($(box).find('.box-title')).get(0);
            var boxBody = $($(box).find('.box-body')).get(0);
            var collapseIcon = $($(boxTitle).find('a > i')).get(0);

            $(collapseIcon).attr('class', '');

            if (collapse === true)
            {
                $(collapseIcon).addClass('fa fa-chevron-down');

                $(boxBody).slideUp(500);
            }
            else
            {
                $(collapseIcon).addClass('fa fa-chevron-up');

                $(boxBody).slideDown(500);
            }
        }

        function formatTable()
        {
            dtOT = $('#dtOT').DataTable({
                "createdRow": function (row, data, index)
                {
                    $(row).find('td').attr('align', 'center');

                    $(row).find('td > .btn-success').click(
                        function ()
                        {
                            tbOT_detailItem(data[0]);
                        }
                    );

                    $(row).find('td > .btn-warning').click(
                        function ()
                        {
                            tbOT_editItem(data[0]);
                        }
                    );

                    $(row).find('td > .btn-danger').click(
                        function ()
                        {
                            tbOT_removeItem(row, data[0]);
                        }
                    );
                }
            });

            setInterval(blinkAlert, 2000);
        }

        function unformatPeso(val)
        {
            var strValue = val.toString();

            while (strValue.indexOf('$') >= 0)
            {
                strValue = strValue.replace('$', '');
            }

            while (strValue.indexOf('.') >= 0)
            {
                strValue = strValue.replace('.', '');
            }

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

                if ((counter === 2) && (i < strValue.length - 1))
                {
                    pesoValue = '.' + pesoValue;
                    counter = 0;
                }
                else
                {
                    counter++;
                }
            }

            return '$' + pesoValue;
        }

        function validateNumber(val)
        {
            if (val === null)
            {
                return false;
            }
            else
            {
                var strValue = val.toString();
                var re = new RegExp("^([0-9]+)$");

                return re.test(strValue);
            }
        }

        function test()
        {
            alert("test");
        }


        function blinkAlert()
        {
            $('.tdAlert').animate({ backgroundColor: '#FF0000' }, 'slow').animate({ backgroundColor: '#F2F2F2' });
        }


        /*
        *
        *   L I S T  O T
        *
        */

        function loadOT_addRow
        (
            tallerot_id,
            equipo_id,
            empresa,
            fecha,
            fechaCompromiso,
            estado,
            optionDetail,
            optionRemove
        )
        {
            var options = '';

            if (optionDetail === true)
            {
                var buttonIcon = document.createElement('i');
                buttonIcon.className = 'fa fa-search';
                var detailButton = document.createElement('a');
                detailButton.className = 'btn btn-success';
                detailButton.style = 'margin-right: 2px;';
                detailButton.title = 'Ver detalle';
                $(detailButton).append($(buttonIcon));

                options += detailButton.outerHTML;
            }

            if (optionRemove === true)
            {
                var buttonIcon = document.createElement('i');
                buttonIcon.className = 'fa fa-trash-o';
                var removeButton = document.createElement('a');
                removeButton.className = 'btn btn-danger';
                removeButton.title = 'Eliminar';
                $(removeButton).append($(buttonIcon));

                options += removeButton.outerHTML;
            }

            dtOT.row.add(
                            [
                                tallerot_id,
                                equipo_id,
                                empresa,
                                fecha,
                                fechaCompromiso,
                                estado,
                                options
                            ]
            ).draw(false);

            $('#dtOT > tbody > tr').each(
                function()
                {
                    var columns = $(this).find('td');
                    if($(columns[5]).text() === 'Pendiente cierre')
                    {
                        $(columns[5]).removeAttr('class');
                        $(columns[5]).addClass('tdAlert');
                    }
                }
            );
        }

        function loadOT_loadDTOT_Cerrada()
        {
            $.post(
                '../service/WSTaller.asmx/getHeaderListTallerOT_Cerrada_JSON',
                {
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                break;
                            }

                        case 0:
                            {
                                //FAIL
                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                dtOT.clear().draw(false);

                                for (var i = 0; i < data.length; i++)
                                {
                                    var ot = data[i];

                                    loadOT_addRow(
                                        ot.tallerot_id,
                                        ot.equipo_id,
                                        ot.empresa,
                                        ot.fecha,
                                        ot.fechaCompromiso,
                                        ot.tallerot_estadoNombre,
                                        true,
                                        false
                                    );
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR
                }
            );
        }

        function loadOT_loadDTOT_Abierta()
        {
            $.post(
                '../service/WSTaller.asmx/getHeaderListTallerOT_Abierta_JSON',
                {
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                break;
                            }

                        case 0:
                            {
                                //FAIL
                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                dtOT.clear().draw(false);

                                for (var i = 0; i < data.length; i++)
                                {
                                    var ot = data[i];

                                    loadOT_addRow(
                                        ot.tallerot_id,
                                        ot.equipo_id,
                                        ot.empresa,
                                        ot.fecha,
                                        ot.fechaCompromiso,
                                        ot.tallerot_estadoNombre,
                                        true,
                                        true
                                    );
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR
                }
            );
        }

        function loadOT_loadDTOT()
        {
            if ($('#chbOT_Status').is(':checked'))
            {
                loadOT_loadDTOT_Abierta();
            }
            else
            {
                loadOT_loadDTOT_Cerrada();
            }
        }


        /*
        *
        *   I N S E R T  I N F O R M E  E N T R E G A
        *
        */

        function detailOT_loadDTInformeEntrega(id)
        {
            $.post(
                '../service/WSTaller.asmx/getHeaderListInformeEntrega_JSON',
                {
                    tallerot_id: $('#divDetailOT_lbTitulo').text()
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de informes de entrega',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
		                            {
		                                icon: 'fa fa-warning',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de informes de entrega',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                $('#tbDetailOT_InformesEntrega > tbody > tr').remove();

                                if (data.length > 0)
                                {
                                    for (var i = 0; i < data.length; i++)
                                    {
                                        var tallerinformeentrega = data[i];
                                        var newRow = '<tr>'
                                                   + '  <td style="text-align: center;">' + tallerinformeentrega.id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerinformeentrega.numeroInformeEntrega + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerinformeentrega.observaciones + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-danger" href="javascript:tbDetailOT_InformesEntrega_removeItem(' + tallerinformeentrega.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                   + '  </td>'
                                                   + '</tr>'

                                        $('#tbDetailOT_InformesEntrega > tbody').append(newRow);
                                    }
                                }
                                else
                                {
                                    var emptyRow = '<tr>'
                                                 + '    <td colspan="4" style="text-align:center;">'
                                                 + '        <label>No hay elementos cargados en la lista</label>'
                                                 + '    </td>'
                                                 + '</tr>';

                                    $('#tbDetailOT_InformesEntrega > tbody').append(emptyRow);
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de informes de entrega',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }

        function tryInsert_DetailOT_InformeEntrega()
        {
            validForm = validateForm_DetailOT_InsertInformeEntrega();

            if (validForm === true)
            {
                var data = new FormData();

                data.append('tallerOTId', $('#divDetailOT_lbTitulo').text());
                data.append('numeroInformeEntrega', $('#<%= txtDetailOT_InformesEntrega_NumeroInformeEntrega.ClientID %>').val());
                data.append('observaciones', $('#<%= txtDetailOT_InformesEntrega_Observaciones.ClientID %>').val());

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/insertInformeEntrega_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                clearForm_DetailOT_InsertInformeEntrega();

		                                                detailOT_loadDTInformeEntrega();
		                                            }
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
        }

        function clearForm_DetailOT_InsertInformeEntrega()
        {
            $('#<%= txtDetailOT_InformesEntrega_NumeroInformeEntrega.ClientID %>').val('');
            $('#<%= txtDetailOT_InformesEntrega_Observaciones.ClientID %>').val('');
        }

        function validateForm_DetailOT_InsertInformeEntrega()
        {
            $('.requiredText').hide();

            var numeroInformeEntrega = $('#<%= txtDetailOT_InformesEntrega_NumeroInformeEntrega.ClientID %>').val();

            var valid = true;

            if (numeroInformeEntrega.length < 1)
            {
                $('#divDetailOT_InformesEntrega_vfNumeroInformeEntrega').show();

                valid = false;
            }

            return valid;
        }


        /*
        *
        *   R E M O V E  I N F O R M E  E N T R E G A
        *
        */

        function tbDetailOT_InformesEntrega_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR INFORME DE ENTREGA',
                    content: '¿Realmente deseas eliminar el informe de entrega #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        removeInformeEntrega(id);
                    }
                }
            );
        }

        function removeInformeEntrega(id)
        {
            var data = new FormData();
            data.append('tallerinformeentregaId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removeInformeEntrega_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                detailOT_loadDTInformeEntrega();
		                                            }
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


        /*
        *
        *   D E T A I L  R E Q U I S I C I O N
        *
        */

        function tbDetailOT_Requisiciones_detailItem(id)
        {
            $.post(
                '../service/WSTaller.asmx/getInfoTallerRequisicion_JSON',
                {
                    tallerrequisicion_id: id
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                break;
                            }

                        case 0:
                            {
                                //FAIL
                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                //TallerRequisicion
                                {
                                    var tbTallerRequisicion = data['TallerRequisicion'];

                                    $('#divDetailRequisicion_lbTitulo').text(tbTallerRequisicion['tallerrequisicion_id']);
                                    $('#divDetailRequisicion_Requisicion_lbNumeroRequisicion').text(tbTallerRequisicion['tallerrequisicion_numeroRequisicion']);
                                    $('#divDetailRequisicion_Requisicion_lbFecha').text(tbTallerRequisicion['tallerrequisicion_fecha']);
                                    $('#divDetailRequisicion_Requisicion_lbRetiradoPor').text(tbTallerRequisicion['trabajador_nombre']);

                                    $('#divDetailRequisicion_Trabajador_lbRut').text(tbTallerRequisicion['trabajador_rut']);
                                    $('#divDetailRequisicion_Trabajador_lbNombre').text(tbTallerRequisicion['trabajador_nombre']);
                                    $('#divDetailRequisicion_Trabajador_lbCargo').text(tbTallerRequisicion['trabajador_cargo']);
                                    $('#divDetailRequisicion_Trabajador_lbEmail').text(tbTallerRequisicion['trabajador_email']);

                                }

                                //Repuestos
                                {
                                    $('#tbDetailRequisicion_Repuestos > tbody > tr').remove();

                                    var tbTallerRepuesto = data['TallerRepuesto'];

                                    for (var i = 0; i < tbTallerRepuesto.length; i++)
                                    {
                                        var tallerrepuesto = tbTallerRepuesto[i];
                                        var newRow = '<tr title="' + tallerrepuesto.repuesto_nombre + ': ' + tallerrepuesto.repuesto_descripcion + '">'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_sap + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_codigo + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_nombre + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.tallerrequisicion_repuesto_cantidad + '</td>'
                                                   + '</tr>'

                                        $('#tbDetailRequisicion_Repuestos > tbody').append(newRow);
                                    }
                                }

                                collapseBox($('#divDetailRequisicion_Requisicion'), false);
                                collapseBox($('#divDetailRequisicion_Trabajador'), true);
                                collapseBox($('#divDetailRequisicion_Repuestos'), false);

                                $("#divDetailOT").hide();
                                $("#divDetailRequisicion").show();

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    $.alert(
		                    {
		                        icon: 'fa fa-cogs',
		                        title: 'ERROR',
		                        content: 'Se ha producido un error al recuperar la información de la requisición',
		                        confirmButton: 'Cerrar'
		                    }
                    );
                }
            );
        }

        function cancelDetailOT_Requisicion()
        {
            $("#divDetailRequisicion").hide();
            $("#divDetailOT").show();
        }


        /*
        *
        *   I N S E R T  R E Q U I S I C I O N
        *
        */

        function tryInsertRequisicion()
        {
            validForm = validateForm_InsertRequisicion();

            if (validForm === true)
            {
                var stringListRepuestoId = '';
                var stringListRepuestoCantidad = '';

                var rowsRepuesto = $('#tbInsertRequisicion_Repuestos > tbody > tr');

                var countRowChecked = 0;
                for (var i = 0; i < rowsRepuesto.length; i++) 
                {
                    var colsRepuesto = $(rowsRepuesto[i]).find('td');
                    var checkBox = $($(colsRepuesto[6]).find('input:checkbox')).get(0);

                    if ($(checkBox).is(':checked'))
                    {
                        var repuesto_id = $(colsRepuesto[1]).text();
                        var repuesto_cantidad = $($($(colsRepuesto[5]).find('input')).get(0)).val();

                        if (countRowChecked > 0)
                        {
                            stringListRepuestoId += ',';
                            stringListRepuestoCantidad += ',';
                        }

                        stringListRepuestoId += repuesto_id;
                        stringListRepuestoCantidad += repuesto_cantidad;

                        countRowChecked++;
                    }
                }


                var data = new FormData();

                data.append('tallerOTId', $('#divDetailOT_lbTitulo').text());
                data.append('numeroRequisicion', $('#<%= txtInsertRequisicion_NumeroRequisicion.ClientID %>').val());
                data.append('retiradoPor', $('#<%= ddlInsertRequisicion_RetiradoPor.ClientID %>').val());
                data.append('stringListRepuestoId', stringListRepuestoId);
                data.append('stringListRepuestoCantidad', stringListRepuestoCantidad);

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/insertRequisicion_JSON",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (response)
                        {
                            var responseText = $(response).text();
                            var responseJson = $.parseJSON(responseText);

                            var statusCode = responseJson['statusCode'];

                            switch (statusCode) {
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function () 
		                                            {
		                                                clearForm_InsertRequisicion();
		                                                $("#divInsertRequisicion").hide();

		                                                tbOT_detailItem($('#divDetailOT_lbTitulo').text());
		                                            }
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
        }

        function validateForm_InsertRequisicion()
        {
            $('.requiredText').hide();

            var numeroRequisicion = $('#<%= txtInsertRequisicion_NumeroRequisicion.ClientID %>').val();
            var retiradoPor = $('#<%= ddlInsertRequisicion_RetiradoPor.ClientID %>').val();

            var valid = true;

            if (numeroRequisicion.length < 1)
            {
                $('#divInsertRequisicion_vfNumeroRequisicion').show();

                valid = false;
            }

            if (retiradoPor.length < 1)
            {
                $('#divInsertRequisicion_vfRetiradoPor').show();

                valid = false;
            }

            var countRowChecked = 0;
            $('#tbInsertRequisicion_Repuestos > tbody > tr').each(
                function()
                {
                    var columns = $(this).find('td');
                    var cantidadPorRequisar = $(columns[0]).text();
                    var inputCantidad = $($(columns[5]).find('input')).get(0);
                    var checkBox = $($(columns[6]).find('input:checkbox')).get(0);

                    if($(checkBox).is(':checked'))
                    {
                        var requiredText = $($(columns[5]).find('.requiredText')).get(0);

                        var value = parseInt($(inputCantidad).val());

                        if (isNaN(value))
                        {
                            $(requiredText).text('La cantidad debe ser un número entero');
                            $(requiredText).show();

                            valid = false;
                        }
                        else if (value < 1)
                        {
                            $(requiredText).text('La cantidad debe ser mayor a 0');
                            $(requiredText).show();

                            valid = false;
                        }
                        else
                        {
                            var intCantidadPorRequisar = parseInt(cantidadPorRequisar);
                            if (isNaN(intCantidadPorRequisar))
                            {
                                $(requiredText).text('Error al recuperar la cantidad de repuestos no requisados');
                                $(requiredText).show();

                                valid = false;
                            }
                            else
                            {
                                if (value > intCantidadPorRequisar)
                                {
                                    $(requiredText).text('La cantidad puede ser máximo ' + intCantidadPorRequisar);
                                    $(requiredText).show();

                                    valid = false;
                                }
                                
                            }
                        }

                        countRowChecked++;
                    }
                }
            );

            if (countRowChecked < 1)
            {
                $('#divInsertRequisicion_vfRepuestos').show();

                valid = false;
            }

            return valid;
        }

        function clearForm_InsertRequisicion()
        {
            $("#<%= txtInsertRequisicion_NumeroRequisicion.ClientID %>").val('');
            $("#<%= ddlInsertRequisicion_RetiradoPor.ClientID %>").find('option').remove();
            $("#<%= ddlInsertRequisicion_RetiradoPor.ClientID %>").append('<option value="">Seleccione..</option>');
            $('#tbInsertRequisicion_Repuestos > tbody > tr').remove();
        }

        function insertRequisicion_loadDDLTecnico()
        {
            $("#<%= ddlInsertRequisicion_RetiradoPor.ClientID %>").find('option').remove();
            $("#<%= ddlInsertRequisicion_RetiradoPor.ClientID %>").append('<option value="">Seleccione..</option>');

            $.post(
                '../service/WSTaller.asmx/getHeaderListTrabajador_JSON',
                {
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de técnicos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
		                            {
		                                icon: 'fa fa-warning',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de técnicos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                for (var i = 0; i < data.length; i++)
                                {
                                    $("#<%= ddlInsertRequisicion_RetiradoPor.ClientID %>").append('<option value="' + data[i].id + '">' + data[i].nombre + '</option>');
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de técnicos',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }

        function divInsertRequisicion_prepareForm(id)
        {
            clearForm_InsertRequisicion();
            $('#divInsertRequisicion_lbTitulo').text(id);

            insertRequisicion_loadDDLTecnico();

            $.post(
                '../service/WSTaller.asmx/getHeaderListTallerOT_Repuesto_PorRequisar_JSON',
                {
                    tallerot_id: id
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                break;
                            }

                        case 0:
                            {
                                //FAIL
                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                $('#tbInsertRequisicion_Repuestos > tbody > tr').remove();
                                var count = 0;

                                for (var i = 0; i < data.length; i++) 
                                {
                                    var tallerrepuesto = data[i];

                                    var cantidadPorRequisar = tallerrepuesto.cantidadTotal - tallerrepuesto.cantidadRequisada;
                                    if (cantidadPorRequisar > 0)
                                    {
                                        var newRow = '<tr title="' + tallerrepuesto.repuesto_nombre + ': ' + tallerrepuesto.repuesto_descripcion + '">'
                                                    + '  <td style="text-align: center; display:none;">' + cantidadPorRequisar + '</td>'
                                                    + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_id + '</td>'
                                                    + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_sap + '</td>'
                                                    + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_codigo + '</td>'
                                                    + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_nombre + '</td>'
                                                    + '  <td style="text-align:right;"><input type="number" min="1" max="' + tallerrepuesto.cantidadPorRequisar + '" class="form-control textNumber" value="" disabled/><span class="requiredText" style="display: none;"></span></td>'
                                                    + '  <td align="center">'
                                                    + '      <input type="checkbox" />'
                                                    + '  </td>'
                                                    + '</tr>'

                                        $('#tbInsertRequisicion_Repuestos > tbody').append(newRow);
                                        count++;
                                    }
                                }

                                if (count > 0)
                                {
                                    $('#tbInsertRequisicion_Repuestos > tbody > tr').each(
                                        function()
                                        {
                                            var columns = $(this).find('td');
                                            var cantidadPorRequisar = $(columns[0]).text();
                                            var inputCantidad = $($(columns[5]).find('input')).get(0);
                                            var checkBox = $($(columns[6]).find('input:checkbox')).get(0);

                                            $(inputCantidad).change(
                                                function()
                                                {
                                                    var value = parseInt($(this).val());

                                                    if(isNaN(value))
                                                    {
                                                        $(this).val('1');
                                                    }
                                                    else if(value < 1)
                                                    {
                                                        $(this).val('1');
                                                    }
                                                    else
                                                    {
                                                        var intCantidadPorRequisar = parseInt(cantidadPorRequisar);
                                                        if(isNaN(intCantidadPorRequisar) === false)
                                                        {
                                                            if(value > intCantidadPorRequisar)
                                                            {
                                                                if (intCantidadPorRequisar === 1)
                                                                {
                                                                    var msg = 'Sólo queda 1 unidad del repuesto por requisar';
                                                                }
                                                                else if (intCantidadPorRequisar > 1)
                                                                {
                                                                    var msg = 'Sólo quedan ' + intCantidadPorRequisar + ' unidades del repuesto por requisar';
                                                                }
                                                                else
                                                                {
                                                                    var msg = 'Error';
                                                                }

                                                                $.alert(
		                                                                {
		                                                                    icon: 'fa fa-warning',
		                                                                    title: 'REPUESTO',
		                                                                    content: msg,
		                                                                    confirmButton: 'Cerrar'
		                                                                }
                                                                );

                                                                $(this).val(intCantidadPorRequisar);
                                                            }
                                                        }
                                                    }
                                                }
                                            );

                                            $(checkBox).change(
                                                function()
                                                {
                                                    if ($(this).is(':checked'))
                                                    {
                                                        $(inputCantidad).val('1');
                                                        $(inputCantidad).removeAttr('disabled');
                                                    }
                                                    else
                                                    {
                                                        $(inputCantidad).val('');
                                                        $(inputCantidad).attr('disabled', '');
                                                    }
                                                }
                                            );
                                        }
                                    );

                                    $('#divInsertRequisicion').show();
                                    $('#divDetailOT').hide();
                                }
                                else
                                {
                                    $.alert(
		                                {
		                                    icon: 'fa fa-warning',
		                                    title: 'ALERTA',
		                                    content: 'Todos los repuestos del presupuesto ya han sido requisados',
		                                    confirmButton: 'Cerrar'
		                                }
                                    );
                                }
                                

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    $.alert(
		                    {
		                        icon: 'fa fa-cogs',
		                        title: 'ERROR',
		                        content: 'Se ha producido un error al recuperar la información de la OT',
		                        confirmButton: 'Cerrar'
		                    }
                    );
                }
            );
        }

        function tbDetailOT_Requisiciones_addRequisicion()
        {
            var tallerot_id = $('#divDetailOT_lbTitulo').text();

            divInsertRequisicion_prepareForm(tallerot_id);
        }

        function cancelInsertRequisicion()
        {
            $('#divDetailOT').show();
            $('#divInsertRequisicion').hide();
        }


        /*
        *
        *   R E M O V E  R E Q U I S I C I O N
        *
        */

        function tbDetailOT_Requisiciones_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR REQUISICIÓN',
                    content: '¿Realmente deseas eliminar la requisición #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        removeRequisicion(id);
                    }
                }
            );
        }

        function removeRequisicion(id)
        {
            var data = new FormData();
            data.append('tallerrequisicionId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removeRequisicion_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                tbOT_detailItem($('#divDetailOT_lbTitulo').text());
		                                            }
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
        

        /*
        *
        *   I N S E R T  O R D E N  C O M P R A
        *
        */

        function detailOT_loadDTOrdenCompra(id)
        {
            $.post(
                '../service/WSTaller.asmx/getHeaderListOrdenCompra_JSON',
                {
                    tallerot_id: $('#divDetailOT_lbTitulo').text()
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de ordenes de compra',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
		                            {
		                                icon: 'fa fa-warning',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de ordenes de compra',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                $('#tbDetailOT_OrdenesCompra > tbody > tr').remove();

                                if (data.length > 0) {
                                    for (var i = 0; i < data.length; i++) {
                                        var tallerordencompra = data[i];
                                        var newRow = '<tr>'
                                                   + '  <td style="text-align: center;">' + tallerordencompra.id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerordencompra.numeroOrdenCompra + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerordencompra.observaciones + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-danger" href="javascript:tbDetailOT_OrdenesCompra_removeItem(' + tallerordencompra.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                   + '  </td>'
                                                   + '</tr>'

                                        $('#tbDetailOT_OrdenesCompra > tbody').append(newRow);
                                    }
                                }
                                else {
                                    var emptyRow = '<tr>'
                                                 + '    <td colspan="4" style="text-align:center;">'
                                                 + '        <label>No hay elementos cargados en la lista</label>'
                                                 + '    </td>'
                                                 + '</tr>';

                                    $('#tbDetailOT_OrdenesCompra > tbody').append(emptyRow);
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de ordenes de compra',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }

        function tryInsert_DetailOT_OrdenCompra()
        {
            validForm = validateForm_DetailOT_InsertOrdenCompra();

            if (validForm === true)
            {
                var data = new FormData();

                data.append('tallerOTId', $('#divDetailOT_lbTitulo').text());
                data.append('numeroOrdenCompra', $('#<%= txtDetailOT_OrdenesCompra_NumeroOrdenCompra.ClientID %>').val());
                data.append('observaciones', $('#<%= txtDetailOT_OrdenesCompra_Observaciones.ClientID %>').val());

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/insertOrdenCompra_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                clearForm_DetailOT_InsertOrdenCompra();

		                                                detailOT_loadDTOrdenCompra();
		                                            }
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
        }

        function clearForm_DetailOT_InsertOrdenCompra()
        {
            $('#<%= txtDetailOT_OrdenesCompra_NumeroOrdenCompra.ClientID %>').val('');
            $('#<%= txtDetailOT_OrdenesCompra_Observaciones.ClientID %>').val('');
        }

        function validateForm_DetailOT_InsertOrdenCompra()
        {
            $('.requiredText').hide();

            var numeroOrdenCompra = $('#<%= txtDetailOT_OrdenesCompra_NumeroOrdenCompra.ClientID %>').val();

            var valid = true;

            if (numeroOrdenCompra.length < 1)
            {
                $('#divDetailOT_OrdenesCompra_vfNumeroOrdenCompra').show();

                valid = false;
            }

            return valid;
        }


        /*
        *
        *   R E M O V E  O R D E N  C O M P R A
        *
        */

        function tbDetailOT_OrdenesCompra_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR ORDEN DE COMPRA',
                    content: '¿Realmente deseas eliminar la orden de compra #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        removeOrdenCompra(id);
                    }
                }
            );
        }

        function removeOrdenCompra(id)
        {
            var data = new FormData();
            data.append('tallerordencompraId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removeOrdenCompra_JSON",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (response) {
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                detailOT_loadDTOrdenCompra();
		                                            }
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


        /*
        *
        *   I N S E R T  S O L I C I T U D  C O M P R A
        *
        */

        function detailOT_loadDTSolicitudCompra(id)
        {
            $.post(
                '../service/WSTaller.asmx/getHeaderListSolicitudCompra_JSON',
                {
                    tallerot_id: $('#divDetailOT_lbTitulo').text()
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de solicitudes de compra',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
		                            {
		                                icon: 'fa fa-warning',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de solicitudes de compra',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                $('#tbDetailOT_SolicitudesCompra > tbody > tr').remove();

                                if (data.length > 0)
                                {
                                    for (var i = 0; i < data.length; i++)
                                    {
                                        var tallersolicitudcompra = data[i];
                                        var newRow = '<tr>'
                                                   + '  <td style="text-align: center;">' + tallersolicitudcompra.id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallersolicitudcompra.numeroSolicitudCompra + '</td>'
                                                   + '  <td style="text-align: center;">' + tallersolicitudcompra.observaciones + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-danger" href="javascript:tbDetailOT_SolicitudesCompra_removeItem(' + tallersolicitudcompra.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                   + '  </td>'
                                                   + '</tr>'

                                        $('#tbDetailOT_SolicitudesCompra > tbody').append(newRow);
                                    }
                                }
                                else
                                {
                                    var emptyRow = '<tr>'
                                                 + '    <td colspan="4" style="text-align:center;">'
                                                 + '        <label>No hay elementos cargados en la lista</label>'
                                                 + '    </td>'
                                                 + '</tr>';

                                    $('#tbDetailOT_SolicitudesCompra > tbody').append(emptyRow);
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de solicitudes de compra',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }

        function tryInsert_DetailOT_SolicitudCompra()
        {
            validForm = validateForm_DetailOT_InsertSolicitudCompra();

            if (validForm === true)
            {
                var data = new FormData();

                data.append('tallerOTId', $('#divDetailOT_lbTitulo').text());
                data.append('numeroSolicitudCompra', $('#<%= txtDetailOT_SolicitudesCompra_NumeroSolicitudCompra.ClientID %>').val());
                data.append('observaciones', $('#<%= txtDetailOT_SolicitudesCompra_Observaciones.ClientID %>').val());

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/insertSolicitudCompra_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                clearForm_DetailOT_InsertSolicitudCompra();

		                                                detailOT_loadDTSolicitudCompra();
		                                            }
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
        }

        function clearForm_DetailOT_InsertSolicitudCompra()
        {
            $('#<%= txtDetailOT_SolicitudesCompra_NumeroSolicitudCompra.ClientID %>').val('');
            $('#<%= txtDetailOT_SolicitudesCompra_Observaciones.ClientID %>').val('');
        }

        function validateForm_DetailOT_InsertSolicitudCompra()
        {
            $('.requiredText').hide();

            var numeroSolicitudCompra = $('#<%= txtDetailOT_SolicitudesCompra_NumeroSolicitudCompra.ClientID %>').val();

            var valid = true;

            if (numeroSolicitudCompra.length < 1)
            {
                $('#divDetailOT_SolicitudesCompra_vfNumeroSolicitudCompra').show();

                valid = false;
            }

            return valid;
        }


        /*
        *
        *   R E M O V E  S O L I C I T U D  C O M P R A
        *
        */

        function tbDetailOT_SolicitudesCompra_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR SOLICITUD DE COMPRA',
                    content: '¿Realmente deseas eliminar la solicitud de compra #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        removeSolicitudCompra(id);
                    }
                }
            );
        }

        function removeSolicitudCompra(id)
        {
            var data = new FormData();
            data.append('tallersolicitudcompraId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removeSolicitudCompra_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                detailOT_loadDTSolicitudCompra();
		                                            }
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


        /*
        *
        *   D E T A I L  P R E S U P U E S T O
        *
        */

        function tbDetailOT_Presupuestos_detailItem(id)
        {
            $.post(
                '../service/WSTaller.asmx/getInfoTallerPresupuesto_JSON',
                {
                    tallerpresupuesto_id: id
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                break;
                            }

                        case 0:
                            {
                                //FAIL
                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                //TallerPresupuesto
                                {
                                    var tbTallerPresupuesto = data['TallerPresupuesto'];
                                    var valorRepuestos = 0;
                                    if (tbTallerPresupuesto['tallerpresupuesto_valorRepuestos'] !== null)
                                    {
                                        valorRepuestos = tbTallerPresupuesto['tallerpresupuesto_valorRepuestos'];
                                    }

                                    $('#divDetailPresupuesto_lbTitulo').text(tbTallerPresupuesto['tallerpresupuesto_id']);
                                    $('#divDetailPresupuesto_Presupuesto_lbFecha').text(tbTallerPresupuesto['tallerpresupuesto_fecha']);
                                    $('#divDetailPresupuesto_Presupuesto_lbFechaCompromiso').text(tbTallerPresupuesto['tallerpresupuesto_fechaCompromiso']);
                                    $('#divDetailPresupuesto_Presupuesto_lbFechaCierre').text(tbTallerPresupuesto['tallerpresupuesto_fechaCierre']);
                                    $('#divDetailPresupuesto_Presupuesto_lbDescripcionFallo').text(tbTallerPresupuesto['tallerpresupuesto_descripcionFallo']);
                                    $('#divDetailPresupuesto_Presupuesto_lbCausaProbable').text(tbTallerPresupuesto['tallerpresupuesto_causaProbable']);
                                    $('#divDetailPresupuesto_Presupuesto_lbCantidadHoras').text(tbTallerPresupuesto['tallerpresupuesto_cantidadHoras']);
                                    $('#divDetailPresupuesto_Presupuesto_lbValorHH').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_valorHH']));
                                    $('#divDetailPresupuesto_Presupuesto_lbTecnicoAsignado').text(tbTallerPresupuesto['trabajador_nombre']);
                                    $('#divDetailPresupuesto_Presupuesto_lbValorTecnico').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_valorTecnico']));
                                    $('#divDetailPresupuesto_Presupuesto_lbValorRepuestos').text(formatPeso(valorRepuestos));
                                    $('#divDetailPresupuesto_Presupuesto_lbValorNeto').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_neto']));
                                    $('#divDetailPresupuesto_Presupuesto_lbIva').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_iva']));
                                    $('#divDetailPresupuesto_Presupuesto_lbTotal').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_total']));
                                    $('#divDetailPresupuesto_Presupuesto_lbEstado').text(tbTallerPresupuesto['tallerpresupuesto_estadoNombre']);
                                    $('#divDetailPresupuesto_Presupuesto_lbObservaciones').text(tbTallerPresupuesto['tallerpresupuesto_observaciones']);

                                    $('#divDetailPresupuesto_Trabajador_lbRut').text(tbTallerPresupuesto['trabajador_rut']);
                                    $('#divDetailPresupuesto_Trabajador_lbNombre').text(tbTallerPresupuesto['trabajador_nombre']);
                                    $('#divDetailPresupuesto_Trabajador_lbCargo').text(tbTallerPresupuesto['trabajador_cargo']);
                                    $('#divDetailPresupuesto_Trabajador_lbEmail').text(tbTallerPresupuesto['trabajador_email']);
                                    $('#divDetailPresupuesto_Trabajador_lbCantidadHoras').text(tbTallerPresupuesto['tallerpresupuesto_cantidadHoras']);
                                    $('#divDetailPresupuesto_Trabajador_lbValorHH').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_valorHH']));

                                }

                                //Repuestos
                                {
                                    $('#tbDetailPresupuesto_Repuestos > tbody > tr').remove();

                                    var tbTallerRepuesto = data['TallerRepuesto'];

                                    for (var i = 0; i < tbTallerRepuesto.length; i++)
                                    {
                                        var tallerrepuesto = tbTallerRepuesto[i];
                                        var newRow = '<tr title="' + tallerrepuesto.repuesto_nombre + ': ' + tallerrepuesto.repuesto_descripcion + '">'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_sap + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_codigo + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_nombre + '</td>'
                                                   + '  <td style="text-align: right;">' + formatPeso(tallerrepuesto.tallerpresupuesto_repuesto_valorUnitario) + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.tallerpresupuesto_repuesto_cantidad + '</td>'
                                                   + '  <td style="text-align: right;">' + formatPeso(tallerrepuesto.tallerpresupuesto_repuesto_total) + '</td>'
                                                   + '</tr>'

                                        $('#tbDetailPresupuesto_Repuestos > tbody').append(newRow);
                                    }

                                    $('#divDetailPresupuesto_Repuestos_lbTotalRepuestos').text(formatPeso(valorRepuestos));
                                }

                                collapseBox($('#divDetailPresupuesto_Presupuesto'), false);
                                collapseBox($('#divDetailPresupuesto_Trabajador'), true);
                                collapseBox($('#divDetailPresupuesto_Repuestos'), false);

                                $("#divDetailOT").hide();
                                $("#divDetailPresupuesto").show();

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    $.alert(
		                    {
		                        icon: 'fa fa-cogs',
		                        title: 'ERROR',
		                        content: 'Se ha producido un error al recuperar la información del presupuesto',
		                        confirmButton: 'Cerrar'
		                    }
                    );
                }
            );
        }

        function cancelDetailOT_Presupuesto()
        {
            $("#divDetailPresupuesto").hide();
            $("#divDetailOT").show();
        }


        /*
        *
        *   E D I T  P R E S U P U E S T O
        *
        */

        function tryUpdatePresupuesto()
        {
            validForm = validateForm_UpdatePresupuesto();

            if (validForm === true)
            {
                var stringListRepuestoId = "";
                var stringListRepuestoCantidad = "";
                var stringListRepuestoValorUnitario = "";

                var rowsRepuesto = $('#tbUpdatePresupuesto_Repuestos > tbody > tr');

                for (var i = 0; i < rowsRepuesto.length; i++)
                {
                    var colsRepuesto = $(rowsRepuesto[i]).find('td');
                    if (colsRepuesto.length > 2)
                    {
                        var repuesto_id = $(colsRepuesto[0]).text();
                        var repuesto_valorUnitario = $($($(colsRepuesto[4]).find('.textNumber')).get(0)).val();
                        var repuesto_cantidad = $(colsRepuesto[5]).text();

                        stringListRepuestoId += repuesto_id;
                        stringListRepuestoValorUnitario += repuesto_valorUnitario;
                        stringListRepuestoCantidad += repuesto_cantidad;

                        if (i < rowsRepuesto.length - 1)
                        {
                            stringListRepuestoId += ',';
                            stringListRepuestoCantidad += ',';
                            stringListRepuestoValorUnitario += ',';
                        }
                    }
                }


                var data = new FormData();

                data.append('tallerpresupuestoId', $('#lbUpdatePresupuesto_TallerPresupuestoID').text());
                data.append('fechaCompromiso', $("#<%= txtUpdatePresupuesto_Antecedentes_FechaCompromiso.ClientID %>").val());
                data.append('descripcionFallo', $("#<%= txtUpdatePresupuesto_Antecedentes_DescripcionFallo.ClientID %>").val());
                data.append('causaProbable', $("#<%= txtUpdatePresupuesto_Antecedentes_CausaProbable.ClientID %>").val());
                data.append('tecnicoAsignado', $("#<%= ddlUpdatePresupuesto_Tecnico.ClientID %>").val());
                data.append('cantidadHoras', $("#<%= txtUpdatePresupuesto_Tecnico_CantidadHoras.ClientID %>").val());
                data.append('valorHH', $("#<%= txtUpdatePresupuesto_Tecnico_ValorHH.ClientID %>").val());
                data.append('stringListRepuestoId', stringListRepuestoId);
                data.append('stringListRepuestoCantidad', stringListRepuestoCantidad);
                data.append('stringListRepuestoValorUnitario', stringListRepuestoValorUnitario);

                var rowsResumen = $('#tbUpdatePresupuesto_Confirmacion > tbody > tr');

                data.append('neto', unformatPeso($($($($(rowsResumen).get(2)).find('td')).get(1)).text()));
                data.append('iva', unformatPeso($($($($(rowsResumen).get(3)).find('td')).get(1)).text()));
                data.append('total', unformatPeso($($($($(rowsResumen).get(4)).find('td')).get(1)).text()));

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/updatePresupuesto_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function()
		                                            {
		                                                clearForm_UpdatePresupuesto();
		                                                $("#divUpdatePresupuesto").hide();
		                                                tbOT_detailItem($('#divDetailOT_lbTitulo').text());
		                                            }
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
        }

        function clearForm_UpdatePresupuesto()
        {
            $('#divUpdatePresupuesto_lbTitulo').text('-1');

            clearForm_UpdatePresupuesto_Antecedentes();
            clearForm_UpdatePresupuesto_Tecnico();
            clearForm_UpdatePresupuesto_Repuestos();
            clearForm_UpdatePresupuesto_Confirmacion();
        }

        function validateForm_UpdatePresupuesto()
        {
            if (validateForm_UpdatePresupuesto_Antecedentes() === false)
            {
                divUpdatePresupuesto_goTabAntecedentes(0);

                return false;
            }
            else if (validateForm_UpdatePresupuesto_Tecnico() === false)
            {
                divUpdatePresupuesto_goTabTecnico(0);

                return false;
            }
            else if (validateForm_UpdatePresupuesto_Repuestos() === false)
            {
                divUpdatePresupuesto_goTabRepuestos(0);

                return false;
            }

            return true;
        }

        function clearForm_UpdatePresupuesto_Confirmacion()
        {
            var rows = $('#tbUpdateresupuesto_Confirmacion > tbody > tr');

            $($($($(rows).get(0)).find('td')).get(1)).text("$0");
            $($($($(rows).get(1)).find('td')).get(1)).text("$0");
            $($($($(rows).get(2)).find('td')).get(1)).text("$0");
            $($($($(rows).get(3)).find('td')).get(1)).text("$0");
            $($($($(rows).get(4)).find('td')).get(1)).text("$0");
        }

        function clearForm_UpdatePresupuesto_Repuestos()
        {
            $('.requiredText').hide();

            $('#tbUpdatePresupuesto_Repuestos > tbody > tr').remove();

            var emptyRow = '<tr>'
                         + '    <td colspan="8" style="text-align:center;">'
                         + '        <label>No hay elementos cargados en la lista</label>'
                         + '    </td>'
                         + '</tr>';

            $('#tbUpdatePresupuesto_Repuestos > tbody').append(emptyRow);

            updatePresupuesto_Repuestos_calculateNeto();
        }

        function isEmpty_tbUpdatePresupuesto_Repuestos()
        {
            var rowsRepuesto = $('#tbIUpdatePresupuesto_Repuestos > tbody > tr');
            if (rowsRepuesto.length > 1)
            {
                return false;
            }
            else if (rowsRepuesto.length === 1)
            {
                var colsRepuesto = $(rowsRepuesto[0]).find('td');
                if (colsRepuesto.length > 1)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }

        function validateForm_UpdatePresupuesto_Repuestos()
        {
            $('.requiredText').hide();

            var isEmpty_Repuestos = isEmpty_tbUpdatePresupuesto_Repuestos();

            var valid = true;

            if (isEmpty_Repuestos)
            {
                //valid = false;
            }

            $('#tbUpdatePresupuesto_Repuestos > tbody > tr > td > .textNumber').each(
                function ()
                {
                    var msg = "";

                    if ($(this).val().length < 1)
                    {
                        msg = 'Debes ingresar el valor unitario del repuesto';
                    }
                    else if (isNaN($(this).val()))
                    {
                        msg = 'El valor unitario debe ser numérico';
                    }
                    else
                    {
                        var valorUnitario = parseInt($(this).val());

                        if (isNaN(valorUnitario))
                        {
                            msg = 'Debes ingresar un valor unitario válido';
                        }
                        else if (valorUnitario < 1)
                        {
                            msg = 'El valor unitario debe ser mayor que 0';
                        }
                        else
                        {
                            $(this).val(valorUnitario);
                        }
                    }

                    if (msg.length > 0)
                    {
                        var requiredText = $($(this).parent().find('.requiredText')).get(0);
                        $(requiredText).text(msg);
                        $(requiredText).show();

                        valid = false;
                    }
                }
            );

            return valid;
        }

        function clearForm_UpdatePresupuesto_Tecnico()
        {
            $('.requiredText').hide();

            $('#<%= ddlUpdatePresupuesto_Tecnico.ClientID %>').val("");
            $('#<%= txtUpdatePresupuesto_Tecnico_CantidadHoras.ClientID %>').val("");
            $('#<%= txtUpdatePresupuesto_Tecnico_ValorHH.ClientID %>').val("");
            $('#lbUpdatePresupuesto_Tecnico_ValorNeto').val("0");
        }

        function validateForm_UpdatePresupuesto_Tecnico()
        {
            $('.requiredText').hide();

            var tecnico = $('#<%= ddlUpdatePresupuesto_Tecnico.ClientID %>').val();
            var cantidadHoras = $('#<%= txtUpdatePresupuesto_Tecnico_CantidadHoras.ClientID %>').val();
            var valorHH = $('#<%= txtUpdatePresupuesto_Tecnico_ValorHH.ClientID %>').val();

            var valid = true;

            if (tecnico.length < 1)
            {
                $('#divUpdatePresupuesto_Tecnico_vfTecnico').show();

                valid = false;
            }

            if (cantidadHoras.length < 1)
            {
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').text('Debes ingresar la cantidad de horas asignadas');
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }
            else if (validateNumber(cantidadHoras) === false)
            {
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').text('La cantidad debe ser un número entero');
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }
            else if (isNaN(cantidadHoras))
            {
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').text('La cantidad de horas debe ser numérica');
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }
            else if (parseInt(cantidadHoras) < 1)
            {
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').text('La cantidad de horas debe ser mayor a 0');
                $('#divUpdatePresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }

            if (valorHH.length < 1)
            {
                $('#divUpdatePresupuesto_Tecnico_vfValorHH').text('Debes ingresar el valor hora del técnico asignado');
                $('#divUpdatePresupuesto_Tecnico_vfValorHH').show();

                valid = false;
            }
            else if (isNaN(valorHH))
            {
                $('#divUpdatePresupuesto_Tecnico_vfValorHH').text('El valor hora debe ser numérico');
                $('#divUpdatePresupuesto_Tecnico_vfValorHH').show();

                valid = false;
            }
            else if (parseInt(valorHH) < 1)
            {
                $('#divUpdatePresupuesto_Tecnico_vfValorHH').text('El valor hora debe ser mayor a 0');
                $('#divUpdatePresupuesto_Tecnico_vfValorHH').show();

                valid = false;
            }

            if (valid === true)
            {
                updatePresupuesto_Tecnico_calculateNeto();
            }

            return valid;
        }

        function clearForm_UpdatePresupuesto_Antecedentes()
        {
            $('.requiredText').hide();

            $('#lbUpdatePresupuesto_TallerPresupuestoID').text("-1");
            $('#<%= txtUpdatePresupuesto_Antecedentes_DescripcionFallo.ClientID %>').val("");
            $('#<%= txtUpdatePresupuesto_Antecedentes_CausaProbable.ClientID %>').val("");
        }

        function validateForm_UpdatePresupuesto_Antecedentes()
        {
            $('.requiredText').hide();

            var fechaCompromiso = $('#<%= txtUpdatePresupuesto_Antecedentes_FechaCompromiso.ClientID %>').val();
            //var descripcionFallo = $('#<%= txtUpdatePresupuesto_Antecedentes_DescripcionFallo.ClientID %>').val();
            //var causaProbable = $('#<%= txtUpdatePresupuesto_Antecedentes_CausaProbable.ClientID %>').val();

            var valid = true;

            if (fechaCompromiso.length < 1)
            {
                $('#divUpdatePresupuesto_Antecedentes_vfFechaCompromiso').show();

                valid = false;
            }

            return valid;
        }

        function clearForm_UpdatePresupuesto_RepuestoSelect()
        {
            $('.requiredText').hide();

            $('#ddlUpdatePresupuesto_Repuesto').val('');
            $('#<%= txtUpdatePresupuesto_Repuestos_Cantidad.ClientID %>').val("");
        }

        function tbUpdatePresupuesto_Repuestos_isEmpty()
        {
            var rowCount = $('#tbUpdatePresupuesto_Repuestos > tbody > tr').length;
            if (rowCount === 0)
            {
                return true;
            }
            else if (rowCount === 1)
            {
                var firstRow = $('#tbUpdatePresupuesto_Repuestos > tbody > tr')[0];
                var countColumn = $(firstRow).find("td").length;
                if (countColumn === 1)
                {
                    return true;
                }
            }
            else {
                return false;
            }
        }

        function tbUpdatePresupuesto_Repuestos_getIndexItemInTable(id)
        {
            var rows = $('#tbUpdatePresupuesto_Repuestos > tbody > tr');

            for (var i = 0; i < rows.length; i++)
            {
                var columns = $(rows[i]).find('td');

                if ($(columns[0]).html() === id.toString())
                {
                    return i;
                }
            }

            return -1;
        }

        function updatePresupuesto_Repuestos_calculateNeto()
        {
            var netoRepuestos = 0;
            var rows = $('#tbUpdatePresupuesto_Repuestos > tbody > tr');
            for (var i = 0; i < rows.length; i++)
            {
                var columns = $(rows[i]).find('td');
                if (columns.length > 2)
                {
                    var totalNeto = parseInt(unformatPeso($(columns[6]).text()));
                    if (isNaN(totalNeto) === false)
                    {
                        netoRepuestos = netoRepuestos + totalNeto;
                    }
                    else
                    {
                        netoRepuestos = "Error de cálculo";

                        break;
                    }
                }
            }

            if (isNaN(netoRepuestos))
            {
                $('#lbUpdatePresupuesto_Repuestos_ValorNeto').text(netoRepuestos);
            }
            else
            {
                $('#lbUpdatePresupuesto_Repuestos_ValorNeto').text(formatPeso(netoRepuestos));
            }
            
            updatePresupuesto_Confirmacion_calculateResumen();
        }

        function tbUpdatePresupuesto_Repuestos_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR REPUESTO',
                    content: '¿Realmente deseas eliminar el repuesto #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        updatePresupuesto_removeRepuesto(id);
                    }
                }
            );
        }

        function updatePresupuesto_removeRepuesto(id)
        {
            $('#tbUpdatePresupuesto_Repuestos > tbody > tr').each(
                function () {
                    var columns = $(this).find('td');

                    if ($(columns[0]).html() === id.toString())
                    {
                        $(this).remove();

                        if ($('#tbUpdatePresupuesto_Repuestos > tbody > tr').length < 1)
                        {
                            var emptyRow = '<tr>'
                                            + '    <td colspan="8" style="text-align:center;">'
                                            + '        <label>No hay elementos cargados en la lista</label>'
                                            + '    </td>'
                                            + '</tr>';

                            $('#tbUpdatePresupuesto_Repuestos > tbody').append(emptyRow);
                        }

                        updatePresupuesto_Repuestos_calculateNeto();
                    }
                }
            );
        }

        function updatePresupuesto_Confirmacion_calculateResumen()
        {
            var textValorNetoTecnico = unformatPeso($('#lbUpdatePresupuesto_Tecnico_ValorNeto').text());
            var textValorNetoRepuestos = unformatPeso($('#lbUpdatePresupuesto_Repuestos_ValorNeto').text());

            valorNetoTecnico = parseInt(textValorNetoTecnico);
            valorNetoRepuestos = parseInt(textValorNetoRepuestos);

            if ((isNaN(valorNetoTecnico) === false) && (isNaN(valorNetoRepuestos) === false))
            {
                var subtotal = valorNetoTecnico + valorNetoRepuestos;
                var iva = subtotal * 0.19;
                var total = subtotal + iva;

                iva = iva.toFixed(0);
                total = total.toFixed(0);

                //Format peso
                {
                    valorNetoTecnico = formatPeso(valorNetoTecnico);
                    valorNetoRepuestos = formatPeso(valorNetoRepuestos);
                    subtotal = formatPeso(subtotal);
                    iva = formatPeso(iva);
                    total = formatPeso(total);
                }
            }
            else
            {
                if (isNaN(valorNetoTecnico))
                {
                    valorNetoTecnico = "Error de cálculo";
                }

                if (isNaN(valorNetoRepuestos))
                {
                    valorNetoRepuestos = "Error de cálculo";
                }

                var subtotal = "Error de cálculo";
                var iva = "Error de cálculo";
                var total = "Error de cálculo";
            }

            var rows = $('#tbUpdatePresupuesto_Confirmacion > tbody > tr');

            $($($($(rows).get(0)).find('td')).get(1)).text(valorNetoTecnico);
            $($($($(rows).get(1)).find('td')).get(1)).text(valorNetoRepuestos);
            $($($($(rows).get(2)).find('td')).get(1)).text(subtotal);
            $($($($(rows).get(3)).find('td')).get(1)).text(iva);
            $($($($(rows).get(4)).find('td')).get(1)).text(total);
        }

        function updatePresupuesto_RepuestoSelect_Success()
        {
            //ADD REPUESTO
            var validForm = validateForm_UpdatePresupuesto_RepuestoSelect();

            if (validForm === true)
            {
                var id = $('#ddlUpdatePresupuesto_Repuesto').val();
                var cantidad = $("#<%= txtUpdatePresupuesto_Repuestos_Cantidad.ClientID %>").val();

                $.post(
                    '../service/WSTaller.asmx/getInfoRepuesto_JSON',
                    {
                        id: id
                    }
                )
                .done(
                    function (response)
                    {
                        var responseText = $(response).text();
                        var responseJson = $.parseJSON(responseText);

                        var statusCode = responseJson['statusCode'];

                        switch (statusCode)
                        {
                            case -1:
                                {
                                    //EXCEPTION

                                    $.alert(
		                                    {
		                                        icon: 'fa fa-cogs',
		                                        title: 'ERROR',
		                                        content: 'Se ha producido un error al recuperar la información del repuesto',
		                                        confirmButton: 'Cerrar'
		                                    }
                                    );

                                    break;
                                }

                            case 0:
                                {
                                    //FAIL

                                    $.alert(
		                                    {
		                                        icon: 'fa fa-warning',
		                                        title: 'ERROR',
		                                        content: 'Se ha producido un error al recuperar la información del repuesto',
		                                        confirmButton: 'Cerrar'
		                                    }
                                    );

                                    break;
                                }

                            case 1:
                                {
                                    //SUCCESS
                                    var data = responseJson['data'];

                                    if (data.length > 0)
                                    {
                                        if (tbUpdatePresupuesto_Repuestos_isEmpty())
                                        {
                                            $('#tbUpdatePresupuesto_Repuestos > tbody > tr').remove();
                                        }

                                        var repuesto = data[0];

                                        var index = tbUpdatePresupuesto_Repuestos_getIndexItemInTable(repuesto.id);
                                        if (index < 0)
                                        {
                                            var row = ' <tr title="' + repuesto.nombre + ': ' + repuesto.descripcion + '">'
                                                    + '     <td style="text-align: center;">' + repuesto.id + '</td>'
                                                    + '     <td style="text-align: center;">' + repuesto.sap + '</td>'
                                                    + '     <td style="text-align: center;">' + repuesto.cod + '</td>'
                                                    + '     <td style="text-align: center;">' + repuesto.nombre + '</td>'
                                                    + '     <td style="text-align:right;"><div class="input-group"><span class="input-group-addon"><i class="fa fa-usd"></i></span><input type="text" class="form-control textNumber" value="' + repuesto.valorUnitario + '"/></div><span class="requiredText" style="display: none;"></span></td>'
                                                    + '     <td style="text-align: center;">' + cantidad + '</td>'
                                                    + '     <td style="text-align:right;">' + formatPeso(parseInt(repuesto.valorUnitario) * (parseInt(cantidad))) + '</td>'
                                                    + '     <td align="center">'
                                                    + '         <a class="btn btn-danger" href="javascript:tbUpdatePresupuesto_Repuestos_removeItem(' + repuesto.id + ');">Eliminar</a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                            $('#tbUpdatePresupuesto_Repuestos > tbody').append(row);

                                            $('#tbUpdatePresupuesto_Repuestos > tbody > tr > td > div > .textNumber').change(
                                                function ()
                                                {
                                                    var columns = $($($($(this).parent()).parent()).parent()).find('td');

                                                    var cantidad = parseInt($(columns[5]).text());
                                                    var textValorUnitario = $(this).val();

                                                    if (textValorUnitario.length < 1)
                                                    {
                                                        var total = "Error de cálculo";
                                                    }
                                                    else if (isNaN(textValorUnitario))
                                                    {
                                                        var total = "Error de cálculo";
                                                    }
                                                    else
                                                    {
                                                        var valorUnitario = parseInt(textValorUnitario);

                                                        if (isNaN(valorUnitario))
                                                        {
                                                            var total = "Error de cálculo";
                                                        }
                                                        else if (valorUnitario < 1)
                                                        {
                                                            var total = "Error de cálculo";
                                                        }
                                                        else
                                                        {
                                                            var total = valorUnitario * cantidad;
                                                        }
                                                    }

                                                    $(columns[5]).text(cantidad);
                                                    if (isNaN(total))
                                                    {
                                                        $(columns[6]).text(total);
                                                    }
                                                    else
                                                    {
                                                        $(columns[6]).text(formatPeso(total));
                                                    }

                                                    updatePresupuesto_Repuestos_calculateNeto();
                                                }
                                            );
                                        }
                                        else
                                        {
                                            //alert("El repuesto seleccionado ya está en la lista (index:" + index + ")");
                                            var columns = $($('#tbUpdatePresupuesto_Repuestos > tbody > tr').get(index)).find('td');

                                            var previousCantidad = parseInt($(columns[5]).text());
                                            cantidad = parseInt(cantidad) + previousCantidad;
                                            var textValorUnitario = $($($(columns[4]).find('.textNumber')).get(0)).val();

                                            if (textValorUnitario.length < 1)
                                            {
                                                var total = "Error de cálculo";
                                            }
                                            else if (isNaN(textValorUnitario))
                                            {
                                                var total = "Error de cálculo";
                                            }
                                            else
                                            {
                                                var valorUnitario = parseInt(textValorUnitario);

                                                if (isNaN(valorUnitario))
                                                {
                                                    var total = "Error de cálculo";
                                                }
                                                else if (valorUnitario < 1)
                                                {
                                                    var total = "Error de cálculo";
                                                }
                                                else
                                                {
                                                    var total = valorUnitario * cantidad;
                                                }
                                            }

                                            $(columns[5]).text(cantidad);
                                            if (isNaN(total))
                                            {
                                                $(columns[6]).text(total);
                                            }
                                            else
                                            {
                                                $(columns[6]).text(formatPeso(total));
                                            }
                                           
                                        }

                                        updatePresupuesto_Repuestos_calculateNeto();

                                        clearForm_UpdatePresupuesto_RepuestoSelect();

                                        $("#divUpdatePresupuesto_RepuestosSelect").hide();
                                        $("#divUpdatePresupuesto_RepuestosList").show();
                                    }
                                    else
                                    {
                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'ERROR',
		                                            content: 'No se ha encontrado un repuesto con el código sap ingresado',
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );
                                    }

                                    break;
                                }

                            default:
                                {

                                    break;
                                }
                        }
                    }
                )
                .fail(
                    function (response)
                    {
                        $.alert(
		                        {
		                            icon: 'fa fa-cogs',
		                            title: 'ERROR',
		                            content: 'Se ha producido un error al recuperar la información del repuesto',
		                            confirmButton: 'Cerrar'
		                        }
                        );
                    }
                );
            }
            else
            {
                //alert("Invalid form");
            }
        }

        function validateForm_UpdatePresupuesto_RepuestoSelect()
        {
            $('.requiredText').hide();

            var repuesto = $('#ddlUpdatePresupuesto_Repuesto').val();
            var cantidad = $('#<%= txtUpdatePresupuesto_Repuestos_Cantidad.ClientID %>').val();

            var valid = true;

            if (repuesto.length < 1)
            {
                $('#divUpdatePresupuesto_Repuestos_vfRepuesto').show();

                valid = false;
            }

            if (cantidad.length < 1)
            {
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').text('Debes ingresar la cantidad');
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }
            else if (validateNumber(cantidad) === false)
            {
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').text('La cantidad debe ser un número entero');
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }
            else if (isNaN(cantidad))
            {
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').text('La cantidad debe ser numérica');
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }
            else if (parseInt(cantidad) < 1)
            {
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').text('La cantidad debe ser mayor a 0');
                $('#divUpdatePresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }

            return valid;
        }

        function updatePresupuesto_RepuestoSelect_Cancel()
        {
            clearForm_UpdatePresupuesto_RepuestoSelect();

            $("#divUpdatePresupuesto_RepuestosSelect").hide();
            $("#divUpdatePresupuesto_RepuestosList").show();
        }

        function showUpdatePresupuesto_RepuestoAdd()
        {
            $('.requiredText').hide();

            $("#divUpdatePresupuesto_RepuestosList").hide();
            $("#divUpdatePresupuesto_RepuestosSelect").show();
        }

        /*
        function updatePresupuesto_loadDDLRepuesto()
        {
            ddlUpdatePresupuesto_Repuesto.setData([]);

            $.post(
                '../service/WSTaller.asmx/getHeaderListRepuesto_JSON',
                {
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de repuestos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
                                   {
                                       icon: 'fa fa-warning',
                                       title: 'ERROR',
                                       content: 'Se ha producido un error al recuperar la lista de repuestos',
                                       confirmButton: 'Cerrar'
                                   }
                               );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                ddlUpdatePresupuesto_Repuesto.setData(data);

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de repuestos',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }
        */

        function updatePresupuesto_Tecnico_calculateNeto()
        {
            var cantidadHoras = $('#<%= txtUpdatePresupuesto_Tecnico_CantidadHoras.ClientID %>').val();
            var valorHH = $('#<%= txtUpdatePresupuesto_Tecnico_ValorHH.ClientID %>').val();

            cantidadHoras = parseInt(cantidadHoras);
            valorHH = parseInt(valorHH);

            if ((isNaN(cantidadHoras) == false) && (isNaN(valorHH) === false)) {
                var netoTecnico = cantidadHoras * valorHH;
            }
            else {
                var netoTecnico = "Error de cálculo";
            }

            $('#lbUpdatePresupuesto_Tecnico_ValorNeto').text(netoTecnico);

            updatePresupuesto_Confirmacion_calculateResumen();
        }

        function updatePresupuesto_loadDDLTecnico(id)
        {
            $("#<%= ddlUpdatePresupuesto_Tecnico.ClientID %>").find('option').remove();
            $("#<%= ddlUpdatePresupuesto_Tecnico.ClientID %>").append('<option value="">Seleccione..</option>');

            $.post(
                '../service/WSTaller.asmx/getHeaderListTrabajador_JSON',
                {
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de técnicos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
		                            {
		                                icon: 'fa fa-warning',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de técnicos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                for (var i = 0; i < data.length; i++)
                                {
                                    if (data[i].id === id)
                                    {
                                        $("#<%= ddlUpdatePresupuesto_Tecnico.ClientID %>").append('<option value="' + data[i].id + '" selected>' + data[i].nombre + '</option>');
                                    }
                                    else
                                    {
                                        $("#<%= ddlUpdatePresupuesto_Tecnico.ClientID %>").append('<option value="' + data[i].id + '">' + data[i].nombre + '</option>');
                                    }
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de técnicos',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }

        function showUpdatePresupuesto(id)
        {
            updatePresupuesto_prepareForm(id);
        }

        function updatePresupuesto_prepareForm(id)
        {
            clearForm_UpdatePresupuesto();
            $('#lbUpdatePresupuesto_TallerPresupuestoID').text(id);
            //updatePresupuesto_loadDDLRepuesto();
            divUpdatePresupuesto_goTabAntecedentes(0);

            $.post(
                '../service/WSTaller.asmx/getInfoTallerPresupuesto_JSON',
                {
                    tallerpresupuesto_id: id
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode) {
                        case -1:
                            {
                                //EXCEPTION

                                break;
                            }

                        case 0:
                            {
                                //FAIL
                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                //TallerPresupuesto
                                {
                                    var tbTallerPresupuesto = data['TallerPresupuesto'];
                                    var valorRepuestos = 0;
                                    if (tbTallerPresupuesto['tallerpresupuesto_valorRepuestos'] !== null)
                                    {
                                        valorRepuestos = tbTallerPresupuesto['tallerpresupuesto_valorRepuestos'];
                                    }

                                    $('#divUpdatePresupuesto_lbTitulo').text(tbTallerPresupuesto['tallerpresupuesto_id']);
                                    $('#<%= txtUpdatePresupuesto_Antecedentes_FechaCompromiso.ClientID %>').val(tbTallerPresupuesto['tallerpresupuesto_fechaCompromiso']);
                                    $('#<%= txtUpdatePresupuesto_Antecedentes_DescripcionFallo.ClientID %>').val(tbTallerPresupuesto['tallerpresupuesto_descripcionFallo']);
                                    $('#<%= txtUpdatePresupuesto_Antecedentes_CausaProbable.ClientID %>').val(tbTallerPresupuesto['tallerpresupuesto_causaProbable']);
                                    updatePresupuesto_loadDDLTecnico(tbTallerPresupuesto['trabajador_id']);
                                    $('#<%= txtUpdatePresupuesto_Tecnico_CantidadHoras.ClientID %>').val(tbTallerPresupuesto['tallerpresupuesto_cantidadHoras']);
                                    $('#<%= txtUpdatePresupuesto_Tecnico_ValorHH.ClientID %>').val(tbTallerPresupuesto['tallerpresupuesto_valorHH']);
                                    
                                    $('#lbUpdatePresupuesto_Tecnico_ValorNeto').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_valorTecnico']));
                                    $('#lbUpdatePresupuesto_Repuestos_ValorNeto').text(formatPeso(valorRepuestos));
                                    $('#lbUpdatePresupuesto_Confirmacion_ValorNetoTecnico').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_valorTecnico']));
                                    $('#lbUpdatePresupuesto_Confirmacion_ValorNetoRepuestos').text(formatPeso(valorRepuestos));
                                    $('#lbUpdatePresupuesto_Cofirmacion_Subtotal').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_neto']));
                                    $('#lbUpdatePresupuesto_Confirmacion_IVA').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_iva']));
                                    $('#lbUpdatePresupuesto_Confirmacion_Total').text(formatPeso(tbTallerPresupuesto['tallerpresupuesto_total']));
                                }

                                //Repuestos
                                {
                                    $('#tbUpdatePresupuesto_Repuestos > tbody > tr').remove();

                                    var tbTallerRepuesto = data['TallerRepuesto'];
                                    for (var i = 0; i < tbTallerRepuesto.length; i++) 
                                    {
                                        var tallerrepuesto = tbTallerRepuesto[i];
                                        var newRow = '<tr title="' + tallerrepuesto.repuesto_nombre + ': ' + tallerrepuesto.repuesto_descripcion + '">'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_sap + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_codigo + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_nombre + '</td>'
                                                   + '  <td style="text-align:right;"><div class="input-group"><span class="input-group-addon"><i class="fa fa-usd"></i></span><input type="number" min="1" class="form-control textNumber" value="' + tallerrepuesto.tallerpresupuesto_repuesto_valorUnitario + '"/></div><span class="requiredText" style="display: none;"></span></td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.tallerpresupuesto_repuesto_cantidad + '</td>'
                                                   + '  <td style="text-align: right;">' + formatPeso(tallerrepuesto.tallerpresupuesto_repuesto_total) + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-danger" href="javascript:tbUpdatePresupuesto_Repuestos_removeItem(' + tallerrepuesto.repuesto_id + ');">Eliminar</a>'
                                                   + '  </td>'
                                                   + '</tr>'

                                        $('#tbUpdatePresupuesto_Repuestos > tbody').append(newRow);
                                    }

                                    $('#tbUpdatePresupuesto_Repuestos > tbody > tr > td > div > .textNumber').change(
                                        function ()
                                        {
                                            var columns = $($($($(this).parent()).parent()).parent()).find('td');

                                            var cantidad = parseInt($(columns[5]).text());
                                            var textValorUnitario = $(this).val();

                                            if (textValorUnitario.length < 1)
                                            {
                                                var total = "Error de cálculo";
                                            }
                                            else if (isNaN(textValorUnitario))
                                            {
                                                var total = "Error de cálculo";
                                            }
                                            else
                                            {
                                                var valorUnitario = parseInt(textValorUnitario);

                                                if (isNaN(valorUnitario))
                                                {
                                                    var total = "Error de cálculo";
                                                }
                                                else if (valorUnitario < 1)
                                                {
                                                    var total = "Error de cálculo";
                                                }
                                                else
                                                {
                                                    var total = valorUnitario * cantidad;
                                                }
                                            }

                                            $(columns[5]).text(cantidad);
                                            if (isNaN(total))
                                            {
                                                $(columns[6]).text(total);
                                            }
                                            else
                                            {
                                                $(columns[6]).text(formatPeso(total));
                                            }

                                            updatePresupuesto_Repuestos_calculateNeto();
                                        }
                                    );
                                }

                                $("#divDetailOT").hide();
                                $("#divUpdatePresupuesto").show();

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response) {
                    $.alert(
		                    {
		                        icon: 'fa fa-cogs',
		                        title: 'ERROR',
		                        content: 'Se ha producido un error al recuperar la información del presupuesto',
		                        confirmButton: 'Cerrar'
		                    }
                    );
                }
            );
        }

        function divUpdatePresupuesto_goTabAntecedentes(direction)
        {
            $("#divUpdatePresupuesto_tabAntecedentes").click();
        }

        function divUpdatePresupuesto_goTabTecnico(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_UpdatePresupuesto_Antecedentes();

                if (validForm === true)
                {
                    $("#divUpdatePresupuesto_tabTecnico").click();
                }
                else {
                    $.alert(
                            {
                                icon: 'fa fa-warning',
                                title: 'ATENCIÓN',
                                content: 'Para continuar debes completar los datos del formulario',
                                confirmButton: 'Cerrar'
                            }
                    );
                }
            }
            else
            {
                $("#divUpdatePresupuesto_tabTecnico").click();
            }
        }

        function divUpdatePresupuesto_goTabRepuestos(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_UpdatePresupuesto_Tecnico();

                if (validForm === true)
                {
                    $("#divUpdatePresupuesto_tabRepuestos").click();
                }
                else
                {
                    $.alert(
                            {
                                icon: 'fa fa-warning',
                                title: 'ATENCIÓN',
                                content: 'Para continuar debes completar los datos del formulario',
                                confirmButton: 'Cerrar'
                            }
                    );
                }
            }
            else
            {
                $("#divUpdatePresupuesto_tabRepuestos").click();
            }
        }

        function divUpdatePresupuesto_goTabConfirmacion(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_UpdatePresupuesto_Repuestos();

                if (validForm === true)
                {
                    $("#divUpdatePresupuesto_tabConfirmacion").click();
                }
                else
                {
                    $.alert(
                            {
                                icon: 'fa fa-warning',
                                title: 'ATENCIÓN',
                                content: 'Para continuar debes completar los datos del formulario',
                                confirmButton: 'Cerrar'
                            }
                    );
                }
            }
            else
            {
                $("#divUpdatePresupuesto_tabConfirmacion").click();
            }
        }

        function tbDetailOT_Presupuestos_editItem(id)
        {
            $('#divUpdatePresupuesto_lbTitulo').text(id);

            showUpdatePresupuesto(id);
        }

        function cancelUpdatePresupuesto()
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'EDITAR PRESUPUESTO',
                    content: 'Se perder&aacute;n todos los datos no guardados. ¿Desea continuar?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        $("#divUpdatePresupuesto").hide();
                        $("#divDetailOT").show();
                    }
                }
            );
        }


        /*
        *
        *   R E M O V E  P R E S U P U E S T O
        *
        */

        function tbDetailOT_Presupuestos_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR PRESUPUESTO',
                    content: '¿Realmente deseas eliminar el presupuesto #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        var countPresupuestos = $('#tbDetailOT_Presupuestos > tbody > tr').length;
                        if (countPresupuestos === 1)
                        {
                            $.confirm(
                                {
                                    icon: 'fa fa-question',
                                    title: 'ELIMINAR OT',
                                    content: 'Este es el último presupuesto de la OT. Si lo elimina, se eliminará tambien la OT. ¿Desea continuar?',
                                    confirmButton: 'Aceptar',
                                    cancelButton: 'Cancelar',
                                    confirm: function ()
                                    {
                                        removePresupuesto(id);
                                    }
                                }
                            );
                        }
                        else
                        {
                            removePresupuesto(id);
                        }
                    }
                }
            );
        }

        function removePresupuesto(id)
        {
            var data = new FormData();
            data.append('tallerpresupuestoId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removePresupuesto_JSON",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (response) {
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                tbOT_detailItem($('#divDetailOT_lbTitulo').text());
		                                            }
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


        /*
        *
        *   C L O S E  P R E S U P U E S T O
        *
        */

        function tbDetailOT_Presupuestos_closeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'CERRAR PRESUPUESTO',
                    content: '¿Realmente deseas cerrar el presupuesto (Reparación) #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        closePresupuesto(id);
                    }
                }
            );
        }

        function closePresupuesto(id)
        {
            var data = new FormData();
            data.append('tallerpresupuestoId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/registerFinReparacionPresupuesto_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                tbOT_detailItem($('#divDetailOT_lbTitulo').text());
		                                            }
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


        /*
        *
        *   D E T A I L  O T
        *
        */

        function tbOT_detailItem(id)
        {
            $.post(
                '../service/WSTaller.asmx/getInfoTallerOT_JSON',
                {
                    tallerot_id: id
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                break;
                            }

                        case 0:
                            {
                                //FAIL
                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                var estadoId = -1;

                                //TallerOT
                                {
                                    var tbTallerOT = data['TallerOT'];

                                    estadoId = parseInt(tbTallerOT['tallerot_estadoId']);

                                    $('#divDetailOT_lbTitulo').text(tbTallerOT['id']);
                                    $('#divDetailOT_lbEstado').text(tbTallerOT['tallerot_estadoNombre']);
                                    $('#divDetailOT_OT_lbFecha').text(tbTallerOT['tallerot_fecha']);
                                    $('#divDetailOT_OT_lbFechaCompromiso').text(tbTallerOT['tallerot_fechaCompromiso']);
                                    $('#divDetailOT_OT_lbFechaCierre').text(tbTallerOT['tallerot_fechaCierre']);
                                    $('#divDetailOT_OT_lbEstado').text(tbTallerOT['tallerot_estadoNombre']);
                                    $('#divDetailOT_Ingreso_lbId').text(tbTallerOT['talleringreso_id']);
                                    $('#divDetailOT_Ingreso_lbFechaRecepcion').text(tbTallerOT['talleringreso_fechaRecepcion']);
                                    $('#divDetailOT_Empresa_lbNombre').text(tbTallerOT['empresa_nombre']);
                                    $('#divDetailOT_Empresa_lbRUT').text(tbTallerOT['empresa_rut']);
                                    $('#divDetailOT_Empresa_lbCiudad').text(tbTallerOT['empresa_ciudad']);
                                    $('#divDetailOT_Empresa_lbFormaTrabajar').text(tbTallerOT['empresa_formaTrabajar']);
                                    $('#divDetailOT_Empresa_lbContacto').text(tbTallerOT['contacto_nombre']);
                                    $('#divDetailOT_Empresa_lbTelefono').text(tbTallerOT['contacto_telefono']);
                                    $('#divDetailOT_Empresa_lbEmail').text(tbTallerOT['contacto_email']);
                                    $('#divDetailOT_Equipo_lbId').text(tbTallerOT['equipo_id']);
                                    $('#divDetailOT_Equipo_lbNombre').text(tbTallerOT['equipo_nombre']);
                                    $('#divDetailOT_Equipo_lbModelo').text(tbTallerOT['equipo_modelo']);
                                    $('#divDetailOT_Equipo_lbNumeroSerie').text(tbTallerOT['equipo_numeroSerie']);
                                }

                                //Foto
                                {
                                    $('#tbDetailOT_Equipo_Fotos > tbody > tr').remove();

                                    var tbFoto= data['Foto'];

                                    for (var i = 0; i < tbFoto.length; i++)
                                    {
                                        var foto = tbFoto[i];

                                        var newRow = '<tr>'
                                                   + '  <td style="text-align: center;">' + foto.archivo_nombre + '</td>'
                                                   + '  <td style="text-align: center;">' + foto.archivo_longitud + ' bytes</td>'
                                                   + '  <td style="text-align: center;">' + foto.archivo_tipoContenido + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-primary" href="javascript:downloadFile(' + foto.archivo_id + ');" title="Descargar"><i class="fa fa-download"></i></a>'
                                                   + '  </td>'
                                                   + '</tr>'

                                        $('#tbDetailOT_Equipo_Fotos > tbody').append(newRow);
                                    }
                                }

                                //Presupuestos
                                {
                                    $('#tbDetailOT_Presupuestos > tbody > tr').remove();

                                    var tbTallerPresupuesto = data['TallerPresupuesto'];

                                    var valorTotal = 0;
                                    for (var i = 0; i < tbTallerPresupuesto.length; i++)
                                    {
                                        var tallerpresupuesto = tbTallerPresupuesto[i];
                                        var valorRepuestos = 0;
                                        if(tallerpresupuesto.tallerpresupuesto_valorRepuestos !== null)
                                        {
                                            valorRepuestos = tallerpresupuesto.tallerpresupuesto_valorRepuestos;
                                        }

                                        var newRow = '<tr>'
                                                   + '  <td style="text-align: center;">' + tallerpresupuesto.tallerpresupuesto_id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerpresupuesto.tallerpresupuesto_descripcionFallo + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerpresupuesto.tallerpresupuesto_fechaCompromiso + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerpresupuesto.trabajador_nombre + '</td>'
                                                   + '  <td style="text-align: right;">' + formatPeso(tallerpresupuesto.tallerpresupuesto_total) + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerpresupuesto.tallerpresupuesto_estadoNombre + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-success" href="javascript:tbDetailOT_Presupuestos_detailItem(' + tallerpresupuesto.tallerpresupuesto_id + ');" title="Ver detalle"><i class="fa fa-search"></i></a>';
                                        if (tallerpresupuesto.tallerpresupuesto_estadoId === 1)
                                        {
                                            newRow += '      <a class="btn btn-warning" href="javascript:tbDetailOT_Presupuestos_editItem(' + tallerpresupuesto.tallerpresupuesto_id + ');" title="Editar"><i class="fa fa-pencil"></i></a>'
                                                    + '      <a class="btn btn-danger" href="javascript:tbDetailOT_Presupuestos_removeItem(' + tallerpresupuesto.tallerpresupuesto_id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>';
                                        }
                                        else if (tallerpresupuesto.tallerpresupuesto_estadoId === 3)
                                        {
                                            newRow += '      <a class="btn btn-inverse" href="javascript:tbDetailOT_Presupuestos_closeItem(' + tallerpresupuesto.tallerpresupuesto_id + ');" title="Cerrar presupuesto"><i class="fa fa-lock"></i></a>';
                                        }
                                                   
                                        newRow += '  </td>'
                                                + '</tr>'

                                        $('#tbDetailOT_Presupuestos > tbody').append(newRow);

                                        valorTotal += tallerpresupuesto.tallerpresupuesto_total;
                                    }

                                    $('#divDetailOT_Presupuestos_lbTotal').text(formatPeso(valorTotal));
                                }

                                //Repuestos
                                {
                                    $('#tbDetailOT_Repuestos > tbody > tr').remove();

                                    var tbTallerRepuesto = data['TallerRepuesto'];

                                    if (tbTallerRepuesto.length > 0)
                                    {
                                        for (var i = 0; i < tbTallerRepuesto.length; i++)
                                        {
                                            var tallerrepuesto = tbTallerRepuesto[i];

                                            var newRow = '<tr title="' + tallerrepuesto.repuesto_nombre + ': ' + tallerrepuesto.repuesto_descripcion + '">'
                                                       + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_id + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_sap + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_codigo + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_nombre + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerrepuesto.cantidadTotal + '</td>'
                                                       + '</tr>'

                                            $('#tbDetailOT_Repuestos > tbody').append(newRow);
                                        }
                                    }
                                    else
                                    {
                                        var emptyRow = '<tr>'
                                                     + '    <td colspan="5" style="text-align:center;">'
                                                     + '        <label>No hay elementos cargados en la lista</label>'
                                                     + '    </td>'
                                                     + '</tr>';

                                        $('#tbDetailOT_Repuestos > tbody').append(emptyRow);
                                    }
                                }

                                //SolicidudesCompra
                                {
                                    $('#tbDetailOT_SolicitudesCompra > tbody > tr').remove();

                                    var tbTallerSolicitudCompra = data['TallerSolicitudCompra'];
                                    if (tbTallerSolicitudCompra.length > 0)
                                    {
                                        for (var i = 0; i < tbTallerSolicitudCompra.length; i++)
                                        {
                                            var tallersolicitudcompra = tbTallerSolicitudCompra[i];
                                            var newRow = '<tr>'
                                                       + '  <td style="text-align: center;">' + tallersolicitudcompra.tallersolicitudcompra_id + '</td>'
                                                       + '  <td style="text-align: center;">' + tallersolicitudcompra.tallersolicitudcompra_numeroSolicitudCompra + '</td>'
                                                       + '  <td style="text-align: center;">' + tallersolicitudcompra.tallersolicitudcompra_observaciones + '</td>'
                                                       + '  <td align="center">';
                                            if (estadoId < 5)
                                            {
                                                newRow += '      <a class="btn btn-danger" href="javascript:tbDetailOT_SolicitudesCompra_removeItem(' + tallersolicitudcompra.tallersolicitudcompra_id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                            }

                                            newRow += '     </td>'
                                                    + '</tr>'

                                            $('#tbDetailOT_SolicitudesCompra > tbody').append(newRow);
                                        }
                                    }
                                    else
                                    {
                                        var emptyRow = '<tr>'
                                                     + '    <td colspan="4" style="text-align:center;">'
                                                     + '        <label>No hay elementos cargados en la lista</label>'
                                                     + '    </td>'
                                                     + '</tr>';

                                        $('#tbDetailOT_SolicitudesCompra > tbody').append(emptyRow);
                                    }
                                }

                                //OrdenesCompra
                                {
                                    $('#tbDetailOT_OrdenesCompra > tbody > tr').remove();

                                    var tbTallerOrdenCompra = data['TallerOrdenCompra'];
                                    if (tbTallerOrdenCompra.length > 0)
                                    {
                                        for (var i = 0; i < tbTallerOrdenCompra.length; i++)
                                        {
                                            var tallerordencompra = tbTallerOrdenCompra[i];
                                            var newRow = '<tr>'
                                                       + '  <td style="text-align: center;">' + tallerordencompra.tallerordencompra_id + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerordencompra.tallerordencompra_numeroOrdenCompra + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerordencompra.tallerordencompra_observaciones + '</td>'
                                                       + '  <td align="center">';
                                            if (estadoId < 5) {
                                                newRow += '      <a class="btn btn-danger" href="javascript:tbDetailOT_OrdenesCompra_removeItem(' + tallerordencompra.tallerordencompra_id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                            }

                                            newRow += '     </td>'
                                                    + '</tr>'

                                            $('#tbDetailOT_OrdenesCompra > tbody').append(newRow);
                                        }
                                    }
                                    else {
                                        var emptyRow = '<tr>'
                                                     + '    <td colspan="4" style="text-align:center;">'
                                                     + '        <label>No hay elementos cargados en la lista</label>'
                                                     + '    </td>'
                                                     + '</tr>';

                                        $('#tbDetailOT_OrdenesCompra > tbody').append(emptyRow);
                                    }
                                }

                                //Requisiciones
                                {
                                    $('#tbDetailOT_Requisiciones > tbody > tr').remove();

                                    var tbTallerRequisicion = data['TallerRequisicion'];

                                    if (tbTallerRequisicion.length > 0)
                                    {
                                        for (var i = 0; i < tbTallerRequisicion.length; i++)
                                        {
                                            var tallerrequisicion = tbTallerRequisicion[i];
                                            var newRow = '<tr>'
                                                       + '  <td style="text-align: center;">' + tallerrequisicion.tallerrequisicion_id + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerrequisicion.tallerrequisicion_numeroRequisicion + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerrequisicion.tallerrequisicion_fecha + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerrequisicion.trabajador_nombre + '</td>'
                                                       + '  <td align="center">'
                                                       + '      <a class="btn btn-success" href="javascript:tbDetailOT_Requisiciones_detailItem(' + tallerrequisicion.tallerrequisicion_id + ');" title="Ver detalle"><i class="fa fa-search"></i></a>';
                                            if (estadoId < 5)
                                            {
                                                newRow += '     <a class="btn btn-danger" href="javascript:tbDetailOT_Requisiciones_removeItem(' + tallerrequisicion.tallerrequisicion_id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>';
                                            }
                                            newRow += '     </td>'
                                                    + '</tr>';

                                            $('#tbDetailOT_Requisiciones > tbody').append(newRow);
                                        }
                                    }
                                    else
                                    {
                                        var emptyRow = '<tr>'
                                                     + '    <td colspan="5" style="text-align:center;">'
                                                     + '        <label>No hay elementos cargados en la lista</label>'
                                                     + '    </td>'
                                                     + '</tr>';

                                        $('#tbDetailOT_Requisiciones > tbody').append(emptyRow);
                                    }
                                }

                                //InformesEntrega
                                {
                                    $('#tbDetailOT_InformesEntrega > tbody > tr').remove();

                                    var tbTallerInformeEntrega = data['TallerInformeEntrega'];
                                    if (tbTallerInformeEntrega.length > 0)
                                    {
                                        for (var i = 0; i < tbTallerInformeEntrega.length; i++)
                                        {
                                            var tallerinformeentrega = tbTallerInformeEntrega[i];
                                            var newRow = '<tr>'
                                                       + '  <td style="text-align: center;">' + tallerinformeentrega.tallerinformeentrega_id + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerinformeentrega.tallerinformeentrega_numeroInformeEntrega + '</td>'
                                                       + '  <td style="text-align: center;">' + tallerinformeentrega.tallerinformeentrega_observaciones + '</td>'
                                                       + '  <td align="center">';
                                            if (estadoId < 5)
                                            {
                                                newRow += '      <a class="btn btn-danger" href="javascript:tbDetailOT_InformesEntrega_removeItem(' + tallerinformeentrega.tallerinformeentrega_id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                            }

                                            newRow += '     </td>'
                                                    + '</tr>'

                                            $('#tbDetailOT_InformesEntrega > tbody').append(newRow);
                                        }
                                    }
                                    else {
                                        var emptyRow = '<tr>'
                                                     + '    <td colspan="4" style="text-align:center;">'
                                                     + '        <label>No hay elementos cargados en la lista</label>'
                                                     + '    </td>'
                                                     + '</tr>';

                                        $('#tbDetailOT_InformesEntrega > tbody').append(emptyRow);
                                    }
                                }

                                collapseBox($('#divDetailOT_OT'), true);
                                collapseBox($('#divDetailOT_Ingreso'), true);
                                collapseBox($('#divDetailOT_Empresa'), true);
                                collapseBox($('#divDetailOT_Equipo'), true);
                                collapseBox($('#divDetailOT_Presupuestos'), false);
                                collapseBox($('#divDetailOT_Repuestos'), true);
                                collapseBox($('#divDetailOT_SolicitudesCompra'), true);
                                collapseBox($('#divDetailOT_OrdenesCompra'), true);
                                collapseBox($('#divDetailOT_Requisiciones'), true);
                                collapseBox($('#divDetailOT_InformesEntrega'), true);
                                collapseBox($('#divDetailOT_Cierre'), false);

                                if (estadoId === 5)
                                {
                                    $('#divDetailOT_Presupuestos_btAddPresupuesto').hide();
                                    $('#tbDetailOT_SolicitudesCompra > tfoot').hide();
                                    $('#tbDetailOT_OrdenesCompra > tfoot').hide();
                                    $('#divDetailOT_Requisiciones_btAddRequisicion').hide();
                                    $('#tbDetailOT_InformesEntrega > tfoot').hide();
                                }
                                else
                                {
                                    $('#divDetailOT_Presupuestos_btAddPresupuesto').show();
                                    $('#tbDetailOT_SolicitudesCompra > tfoot').show();
                                    $('#tbDetailOT_OrdenesCompra > tfoot').show();
                                    $('#divDetailOT_Requisiciones_btAddRequisicion').show();
                                    $('#tbDetailOT_InformesEntrega > tfoot').show();
                                }

                                if (estadoId === 4)
                                {
                                    $('#divDetailOT_Cierre').show();
                                }
                                else
                                {
                                    $('#divDetailOT_Cierre').hide();
                                }

                                $("#divListOT").hide();
                                $("#divDetailOT").show();

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response) {
                    $.alert(
		                    {
		                        icon: 'fa fa-cogs',
		                        title: 'ERROR',
		                        content: 'Se ha producido un error al recuperar la información de la OT',
		                        confirmButton: 'Cerrar'
		                    }
                    );
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

        function cancelDetailOT()
        {
            loadOT_loadDTOT();
            $("#divDetailOT").hide();
            $("#divListOT").show();
        }
       

        /*
        *
        *   R E M O V E  O T
        *
        */

        function tbOT_removeItem(row, id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR OT',
                    content: '¿Realmente deseas eliminar la OT #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        removeOT(row, id);
                    }
                }
            );
        }

        function removeOT(row, id)
        {
            var data = new FormData();
            data.append('tallerOTId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removeOT_JSON",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (response)
                        {
                            var responseText = $(response).text();
                            var responseJson = $.parseJSON(responseText);

                            var statusCode = responseJson['statusCode'];

                            switch (statusCode) {
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function()
		                                            {
		                                                dtOT.row(row).remove().draw(false);
		                                            }
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


        /*
        *
        *   C L O S E  O T
        *
        */

        function tryCloseOT()
        {
            var id = $('#divDetailOT_lbTitulo').text();
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'CERRAR OT',
                    content: '¿Realmente deseas cerrar la OT #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        closeOT(id);
                    }
                }
            );
        }

        function closeOT(id)
        {
            var data = new FormData();
            data.append('tallerotId', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/closeOT_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function ()
		                                            {
		                                                cancelDetailOT();
		                                            }
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


        /*
        *
        *   I N S E R T  P R E S U P U E S T O
        *
        */

        function tryInsertPresupuesto()
        {
            validForm = validateForm_InsertPresupuesto();

            if (validForm === true)
            {
                var stringListRepuestoId = "";
                var stringListRepuestoCantidad = "";
                var stringListRepuestoValorUnitario = "";

                var rowsRepuesto = $('#tbInsertPresupuesto_Repuestos > tbody > tr');

                for (var i = 0; i < rowsRepuesto.length; i++)
                {
                    var colsRepuesto = $(rowsRepuesto[i]).find('td');
                    if (colsRepuesto.length > 2)
                    {
                        var repuesto_id = $(colsRepuesto[0]).text();
                        var repuesto_valorUnitario = $($($(colsRepuesto[4]).find('.textNumber')).get(0)).val();
                        var repuesto_cantidad = $(colsRepuesto[5]).text();

                        stringListRepuestoId += repuesto_id;
                        stringListRepuestoValorUnitario += repuesto_valorUnitario;
                        stringListRepuestoCantidad += repuesto_cantidad;

                        if (i < rowsRepuesto.length - 1)
                        {
                            stringListRepuestoId += ',';
                            stringListRepuestoCantidad += ',';
                            stringListRepuestoValorUnitario += ',';
                        }
                    }
                }


                var data = new FormData();

                data.append('tallerOTId', $('#lbInsertPresupuesto_TallerOTID').text());
                data.append('fechaCompromiso', $("#<%= txtInsertPresupuesto_Antecedentes_FechaCompromiso.ClientID %>").val());
                data.append('descripcionFallo', $("#<%= txtInsertPresupuesto_Antecedentes_DescripcionFallo.ClientID %>").val());
                data.append('causaProbable', $("#<%= txtInsertPresupuesto_Antecedentes_CausaProbable.ClientID %>").val());
                data.append('tecnicoAsignado', $("#<%= ddlInsertPresupuesto_Tecnico.ClientID %>").val());
                data.append('cantidadHoras', $("#<%= txtInsertPresupuesto_Tecnico_CantidadHoras.ClientID %>").val());
                data.append('valorHH', $("#<%= txtInsertPresupuesto_Tecnico_ValorHH.ClientID %>").val());
                data.append('stringListRepuestoId', stringListRepuestoId);
                data.append('stringListRepuestoCantidad', stringListRepuestoCantidad);
                data.append('stringListRepuestoValorUnitario', stringListRepuestoValorUnitario);

                var rowsResumen = $('#tbInsertPresupuesto_Confirmacion > tbody > tr');

                data.append('neto', unformatPeso($($($($(rowsResumen).get(2)).find('td')).get(1)).text()));
                data.append('iva', unformatPeso($($($($(rowsResumen).get(3)).find('td')).get(1)).text()));
                data.append('total', unformatPeso($($($($(rowsResumen).get(4)).find('td')).get(1)).text()));

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/insertPresupuesto_JSON",
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
		                                            icon: 'fa fa-warning',
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
		                                            icon: 'fa fa-cogs',
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
		                                            confirmButton: 'Cerrar',
		                                            confirm: function()
		                                            {
		                                                clearForm_InsertPresupuesto();
		                                                $("#divInsertPresupuesto").hide();

		                                                tbOT_detailItem($('#divDetailOT_lbTitulo').text());
		                                            }
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
        }

        function clearForm_InsertPresupuesto()
        {
            clearForm_InsertPresupuesto_Antecedentes();
            clearForm_InsertPresupuesto_Tecnico();
            clearForm_InsertPresupuesto_Repuestos();
            clearForm_InsertPresupuesto_Confirmacion();
        }

        function validateForm_InsertPresupuesto()
        {

            if (validateForm_InsertPresupuesto_Antecedentes() === false)
            {
                divInsertPresupuesto_goTabAntecedentes(0);

                return false;
            }
            else if (validateForm_InsertPresupuesto_Tecnico() === false)
            {
                divInsertPresupuesto_goTabTecnico(0);

                return false;
            }
            else if (validateForm_InsertPresupuesto_Repuestos() === false)
            {
                divInsertPresupuesto_goTabRepuestos(0);

                return false;
            }

            return true;
        }

        function clearForm_InsertPresupuesto_Confirmacion()
        {
            var rows = $('#tbInsertPresupuesto_Confirmacion > tbody > tr');

            $($($($(rows).get(0)).find('td')).get(1)).text("$0");
            $($($($(rows).get(1)).find('td')).get(1)).text("$0");
            $($($($(rows).get(2)).find('td')).get(1)).text("$0");
            $($($($(rows).get(3)).find('td')).get(1)).text("$0");
            $($($($(rows).get(4)).find('td')).get(1)).text("$0");
        }

        function clearForm_InsertPresupuesto_Repuestos()
        {
            $('.requiredText').hide();

            $('#tbInsertPresupuesto_Repuestos > tbody > tr').remove();

            var emptyRow = '<tr>'
                         + '    <td colspan="8" style="text-align:center;">'
                         + '        <label>No hay elementos cargados en la lista</label>'
                         + '    </td>'
                         + '</tr>';

            $('#tbInsertPresupuesto_Repuestos > tbody').append(emptyRow);

            insertPresupuesto_Repuestos_calculateNeto();
        }

        function isEmpty_tbInsertPresupuesto_Repuestos()
        {
            var rowsRepuesto = $('#tbInsertPresupuesto_Repuestos > tbody > tr');
            if (rowsRepuesto.length > 1)
            {
                return false;
            }
            else if (rowsRepuesto.length === 1)
            {
                var colsRepuesto = $(rowsRepuesto[0]).find('td');
                if (colsRepuesto.length > 1)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            else
            {
                return true;
            }
        }

        function validateForm_InsertPresupuesto_Repuestos()
        {
            $('.requiredText').hide();

            var isEmpty_Repuestos = isEmpty_tbInsertPresupuesto_Repuestos();

            var valid = true;

            if (isEmpty_Repuestos)
            {
                //valid = false;
            }

            $('#tbInsertPresupuesto_Repuestos > tbody > tr > td > .textNumber').each(
                function ()
                {
                    var msg = "";

                    if ($(this).val().length < 1)
                    {
                        msg = 'Debes ingresar el valor unitario del repuesto';
                    }
                    else if (isNaN($(this).val()))
                    {
                        msg = 'El valor unitario debe ser numérico';
                    }
                    else
                    {
                        var valorUnitario = parseInt($(this).val());

                        if (isNaN(valorUnitario))
                        {
                            msg = 'Debes ingresar un valor unitario válido';
                        }
                        else if (valorUnitario < 1)
                        {
                            msg = 'El valor unitario debe ser mayor que 0';
                        }
                        else
                        {
                            $(this).val(valorUnitario);
                        }
                    }

                    if (msg.length > 0)
                    {
                        var requiredText = $($(this).parent().find('.requiredText')).get(0);
                        $(requiredText).text(msg);
                        $(requiredText).show();

                        valid = false;
                    }
                }
            );

            return valid;
        }

        function clearForm_InsertPresupuesto_Tecnico()
        {
            $('.requiredText').hide();

            $('#<%= ddlInsertPresupuesto_Tecnico.ClientID %>').val("");
            $('#<%= txtInsertPresupuesto_Tecnico_CantidadHoras.ClientID %>').val("");
            $('#<%= txtInsertPresupuesto_Tecnico_ValorHH.ClientID %>').val("");
            $('#lbInsertPresupuesto_Tecnico_ValorNeto').val("0");
        }

        function validateForm_InsertPresupuesto_Tecnico()
        {
            $('.requiredText').hide();

            var tecnico = $('#<%= ddlInsertPresupuesto_Tecnico.ClientID %>').val();
            var cantidadHoras = $('#<%= txtInsertPresupuesto_Tecnico_CantidadHoras.ClientID %>').val();
            var valorHH = $('#<%= txtInsertPresupuesto_Tecnico_ValorHH.ClientID %>').val();

            var valid = true;

            if (tecnico.length < 1)
            {
                $('#divInsertPresupuesto_Tecnico_vfTecnico').show();

                valid = false;
            }

            if (cantidadHoras.length < 1)
            {
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').text('Debes ingresar la cantidad de horas asignadas');
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }
            else if (validateNumber(cantidadHoras) === false)
            {
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').text('La cantidad debe ser un número entero');
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }
            else if (isNaN(cantidadHoras))
            {
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').text('La cantidad de horas debe ser numérica');
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }
            else if (parseInt(cantidadHoras) < 1)
            {
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').text('La cantidad de horas debe ser mayor a 0');
                $('#divInsertPresupuesto_Tecnico_vfCantidadHoras').show();

                valid = false;
            }

            if (valorHH.length < 1)
            {
                $('#divInsertPresupuesto_Tecnico_vfValorHH').text('Debes ingresar el valor hora del técnico asignado');
                $('#divInsertPresupuesto_Tecnico_vfValorHH').show();

                valid = false;
            }
            else if (validateNumber(valorHH) === false)
            {
                $('#divInsertPresupuesto_Tecnico_vfValorHH').text('El valor debe ser un número entero');
                $('#divInsertPresupuesto_Tecnico_vfValorHH').show();

                valid = false;
            }
            else if (isNaN(valorHH))
            {
                $('#divInsertPresupuesto_Tecnico_vfValorHH').text('El valor hora debe ser numérico');
                $('#divInsertPresupuesto_Tecnico_vfValorHH').show();

                valid = false;
            }
            else if (parseInt(valorHH) < 1)
            {
                $('#divInsertPresupuesto_Tecnico_vfValorHH').text('El valor hora debe ser mayor a 0');
                $('#divInsertPresupuesto_Tecnico_vfValorHH').show();

                valid = false;
            }

            if (valid === true)
            {
                insertPresupuesto_Tecnico_calculateNeto();
            }

            return valid;
        }

        function clearForm_InsertPresupuesto_Antecedentes()
        {
            $('.requiredText').hide();

            $('#lbInsertPresupuesto_TallerOTID').text("-1");
            $('#<%= txtInsertPresupuesto_Antecedentes_DescripcionFallo.ClientID %>').val("");
            $('#<%= txtInsertPresupuesto_Antecedentes_CausaProbable.ClientID %>').val("");
        }

        function validateForm_InsertPresupuesto_Antecedentes()
        {
            $('.requiredText').hide();

            var fechaCompromiso = $('#<%= txtInsertPresupuesto_Antecedentes_FechaCompromiso.ClientID %>').val();
            //var descripcionFallo = $('#<%= txtInsertPresupuesto_Antecedentes_DescripcionFallo.ClientID %>').val();
            //var causaProbable = $('#<%= txtInsertPresupuesto_Antecedentes_CausaProbable.ClientID %>').val();

            var valid = true;

            if (fechaCompromiso.length < 1)
            {
                $('#divInsertIngreso_Antecedentes_vfFechaCompromiso').show();

                valid = false;
            }

            return valid;
        }

        function insertPresupuesto_Confirmacion_calculateResumen()
        {
            var textValorNetoTecnico = unformatPeso($('#lbInsertPresupuesto_Tecnico_ValorNeto').text());
            var textValorNetoRepuestos = unformatPeso($('#lbInsertPresupuesto_Repuestos_ValorNeto').text());

            valorNetoTecnico = parseInt(textValorNetoTecnico);
            valorNetoRepuestos = parseInt(textValorNetoRepuestos);

            if ((isNaN(valorNetoTecnico) === false) && (isNaN(valorNetoRepuestos) === false))
            {
                var subtotal = valorNetoTecnico + valorNetoRepuestos;
                var iva = subtotal * 0.19;
                var total = subtotal + iva;

                iva = iva.toFixed(0);
                total = total.toFixed(0);

                //Format peso
                {
                    valorNetoTecnico = formatPeso(valorNetoTecnico);
                    valorNetoRepuestos = formatPeso(valorNetoRepuestos);
                    subtotal = formatPeso(subtotal);
                    iva = formatPeso(iva);
                    total = formatPeso(total);
                }
            }
            else
            {
                if (isNaN(valorNetoTecnico))
                {
                    valorNetoTecnico = "Error de cálculo";
                }

                if (isNaN(valorNetoRepuestos))
                {
                    valorNetoRepuestos = "Error de cálculo";
                }

                var subtotal = "Error de cálculo";
                var iva = "Error de cálculo";
                var total = "Error de cálculo";
            }

            var rows = $('#tbInsertPresupuesto_Confirmacion > tbody > tr');

            $($($($(rows).get(0)).find('td')).get(1)).text(valorNetoTecnico);
            $($($($(rows).get(1)).find('td')).get(1)).text(valorNetoRepuestos);
            $($($($(rows).get(2)).find('td')).get(1)).text(subtotal);
            $($($($(rows).get(3)).find('td')).get(1)).text(iva);
            $($($($(rows).get(4)).find('td')).get(1)).text(total);
        }

        function clearForm_InsertPresupuesto_RepuestoSelect()
        {
            $('.requiredText').hide();

            $('#ddlInsertPresupuesto_Repuesto').val('');
            $('#<%= txtInsertPresupuesto_Repuestos_Cantidad.ClientID %>').val("");
        }

        function tbInsertPresupuesto_Repuestos_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR REPUESTO',
                    content: '¿Realmente deseas eliminar el repuesto #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        insertPresupuesto_removeRepuesto(id);
                    }
                }
            );
        }

        function insertPresupuesto_removeRepuesto(id)
        {
            $('#tbInsertPresupuesto_Repuestos > tbody > tr').each(
                function ()
                {
                    var columns = $(this).find('td');

                    if ($(columns[0]).html() === id.toString())
                    {
                        $(this).remove();

                        if ($('#tbInsertPresupuesto_Repuestos > tbody > tr').length < 1)
                        {
                            var emptyRow = '<tr>'
                                            + '    <td colspan="8" style="text-align:center;">'
                                            + '        <label>No hay elementos cargados en la lista</label>'
                                            + '    </td>'
                                            + '</tr>';

                            $('#tbInsertPresupuesto_Repuestos > tbody').append(emptyRow);
                        }

                        insertPresupuesto_Repuestos_calculateNeto();
                    }
                }
            );
        }

        function tbInsertPresupuesto_Repuestos_isEmpty()
        {
            var rowCount = $('#tbInsertPresupuesto_Repuestos > tbody > tr').length;
            if (rowCount === 0)
            {
                return true;
            }
            else if (rowCount === 1)
            {
                var firstRow = $('#tbInsertPresupuesto_Repuestos > tbody > tr')[0];
                var countColumn = $(firstRow).find("td").length;
                if (countColumn === 1)
                {
                    return true;
                }
            }
            else
            {
                return false;
            }
        }

        function tbInsertPresupuesto_Repuestos_getIndexItemInTable(id)
        {
            var rows = $('#tbInsertPresupuesto_Repuestos > tbody > tr');

            for (var i = 0; i < rows.length; i++)
            {
                var columns = $(rows[i]).find('td');

                if ($(columns[0]).html() === id.toString())
                {
                    return i;
                }
            }

            return -1;
        }

        function insertPresupuesto_Repuestos_calculateNeto()
        {
            var netoRepuestos = 0;
            var rows = $('#tbInsertPresupuesto_Repuestos > tbody > tr');
            for (var i = 0; i < rows.length; i++)
            {
                var columns = $(rows[i]).find('td');
                if (columns.length > 2) {
                    var totalNeto = parseInt(unformatPeso($(columns[6]).text()));
                    if (isNaN(totalNeto) === false)
                    {
                        netoRepuestos = netoRepuestos + totalNeto;
                    }
                    else
                    {
                        netoRepuestos = "Error de cálculo";

                        break;
                    }
                }
            }

            if (isNaN(netoRepuestos))
            {
                $('#lbInsertPresupuesto_Repuestos_ValorNeto').text(netoRepuestos);
            }
            else
            {
                $('#lbInsertPresupuesto_Repuestos_ValorNeto').text(formatPeso(netoRepuestos));
            }

            insertPresupuesto_Confirmacion_calculateResumen();
        }

        function insertPresupuesto_RepuestoSelect_Success()
        {
            //ADD REPUESTO
            var validForm = validateForm_InsertPresupuesto_RepuestoSelect();

            if (validForm === true)
            {
                var id = $('#ddlInsertPresupuesto_Repuesto').val();
                var cantidad = $("#<%= txtInsertPresupuesto_Repuestos_Cantidad.ClientID %>").val();

                $.post(
                    '../service/WSTaller.asmx/getInfoRepuesto_JSON',
                    {
                        id: id
                    }
                )
                .done(
                    function (response)
                    {
                        var responseText = $(response).text();
                        var responseJson = $.parseJSON(responseText);

                        var statusCode = responseJson['statusCode'];

                        switch (statusCode)
                        {
                            case -1:
                                {
                                    //EXCEPTION

                                    $.alert(
		                                    {
		                                        icon: 'fa fa-cogs',
		                                        title: 'ERROR',
		                                        content: 'Se ha producido un error al recuperar la información del repuesto',
		                                        confirmButton: 'Cerrar'
		                                    }
                                    );

                                    break;
                                }

                            case 0:
                                {
                                    //FAIL

                                    $.alert(
		                                    {
		                                        icon: 'fa fa-warning',
		                                        title: 'ERROR',
		                                        content: 'Se ha producido un error al recuperar la información del repuesto',
		                                        confirmButton: 'Cerrar'
		                                    }
                                    );

                                    break;
                                }

                            case 1:
                                {
                                    //SUCCESS
                                    var data = responseJson['data'];

                                    if (data.length > 0)
                                    {
                                        if (tbInsertPresupuesto_Repuestos_isEmpty())
                                        {
                                            $('#tbInsertPresupuesto_Repuestos > tbody > tr').remove();
                                        }

                                        var repuesto = data[0];

                                        var index = tbInsertPresupuesto_Repuestos_getIndexItemInTable(repuesto.id);
                                        if (index < 0)
                                        {
                                            var row = ' <tr title="' + repuesto.nombre + ': ' + repuesto.descripcion + '">'
                                                    + '     <td style="text-align: center;">' + repuesto.id + '</td>'
                                                    + '     <td style="text-align: center;">' + repuesto.sap + '</td>'
                                                    + '     <td style="text-align: center;">' + repuesto.cod + '</td>'
                                                    + '     <td style="text-align: center;">' + repuesto.nombre + '</td>'
                                                    + '     <td style="text-align:right;"><div class="input-group"><span class="input-group-addon"><i class="fa fa-usd"></i></span><input type="number" min="1" class="form-control textNumber" value="' + repuesto.valorUnitario + '"/></div><span class="requiredText" style="display: none;"></span></td>'
                                                    + '     <td style="text-align: center;">' + cantidad + '</td>'
                                                    + '     <td style="text-align:right;">' + formatPeso(parseInt(repuesto.valorUnitario) * (parseInt(cantidad))) + '</td>'
                                                    + '     <td style="text-align: center;">'
                                                    + '         <a class="btn btn-danger" href="javascript:tbInsertPresupuesto_Repuestos_removeItem(' + repuesto.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                            $('#tbInsertPresupuesto_Repuestos > tbody').append(row);

                                            $('#tbInsertPresupuesto_Repuestos > tbody > tr > td > div > .textNumber').change(
                                                function ()
                                                {
                                                    var columns = $($($($(this).parent()).parent()).parent()).find('td');

                                                    var cantidad = parseInt($(columns[5]).text());
                                                    var textValorUnitario = $(this).val();

                                                    if (textValorUnitario.length < 1)
                                                    {
                                                        var total = "Error de cálculo";
                                                    }
                                                    else if (isNaN(textValorUnitario))
                                                    {
                                                        var total = "Error de cálculo";
                                                    }
                                                    else
                                                    {
                                                        var valorUnitario = parseInt(textValorUnitario);

                                                        if (isNaN(valorUnitario))
                                                        {
                                                            var total = "Error de cálculo";
                                                        }
                                                        else if (valorUnitario < 1)
                                                        {
                                                            var total = "Error de cálculo";
                                                        }
                                                        else
                                                        {
                                                            var total = valorUnitario * cantidad;
                                                        }
                                                    }

                                                    $(columns[5]).text(cantidad);
                                                    if (isNaN(total))
                                                    {
                                                        $(columns[6]).text(total);
                                                    }
                                                    else
                                                    {
                                                        $(columns[6]).text(formatPeso(total));
                                                    }

                                                    insertPresupuesto_Repuestos_calculateNeto();
                                                }
                                            );
                                        }
                                        else
                                        {
                                            //alert("El repuesto seleccionado ya está en la lista (index:" + index + ")");
                                            var columns = $($('#tbInsertPresupuesto_Repuestos > tbody > tr').get(index)).find('td');

                                            var previousCantidad = parseInt($(columns[5]).text());
                                            cantidad = parseInt(cantidad) + previousCantidad;
                                            var textValorUnitario = $($($(columns[4]).find('.textNumber')).get(0)).val();

                                            if (textValorUnitario.length < 1)
                                            {
                                                var total = "Error de cálculo";
                                            }
                                            else if (isNaN(textValorUnitario))
                                            {
                                                var total = "Error de cálculo";
                                            }
                                            else
                                            {
                                                var valorUnitario = parseInt(textValorUnitario);

                                                if (isNaN(valorUnitario))
                                                {
                                                    var total = "Error de cálculo";
                                                }
                                                else if (valorUnitario < 1) {
                                                    var total = "Error de cálculo";
                                                }
                                                else
                                                {
                                                    var total = valorUnitario * cantidad;
                                                }
                                            }

                                            $(columns[5]).text(cantidad);
                                            if (isNaN(total))
                                            {
                                                $(columns[6]).text(total);
                                            }
                                            else
                                            {
                                                $(columns[6]).text(formatPeso(total));
                                            }
                                        }

                                        insertPresupuesto_Repuestos_calculateNeto();

                                        clearForm_InsertPresupuesto_RepuestoSelect();

                                        $("#divInsertPresupuesto_RepuestosSelect").hide();
                                        $("#divInsertPresupuesto_RepuestosList").show();
                                    }
                                    else
                                    {
                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'ERROR',
		                                            content: 'No se ha encontrado un repuesto con el código sap ingresado',
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );
                                    }

                                    break;
                                }

                            default:
                                {

                                    break;
                                }
                        }
                    }
                )
                .fail(
                    function (response)
                    {
                        $.alert(
		                        {
		                            icon: 'fa fa-cogs',
		                            title: 'ERROR',
		                            content: 'Se ha producido un error al recuperar la información del repuesto',
		                            confirmButton: 'Cerrar'
		                        }
                        );
                    }
                );
            }
            else {
                //alert("Invalid form");
            }
        }

        function validateForm_InsertPresupuesto_RepuestoSelect()
        {
            $('.requiredText').hide();

            var repuesto = $('#ddlInsertPresupuesto_Repuesto').val();
            var cantidad = $('#<%= txtInsertPresupuesto_Repuestos_Cantidad.ClientID %>').val();

            var valid = true;

            if (repuesto.length < 1)
            {
                $('#divInsertPresupuesto_Repuestos_vfRepuesto').show();

                valid = false;
            }

            if (cantidad.length < 1)
            {
                $('#divInsertPresupuesto_Repuestos_vfCantidad').text('Debes ingresar la cantidad');
                $('#divInsertPresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }
            else if (validateNumber(cantidad) === false)
            {
                $('#divInsertPresupuesto_Repuestos_vfCantidad').text('La cantidad debe ser un número entero');
                $('#divInsertPresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }
            else if (isNaN(cantidad))
            {
                $('#divInsertPresupuesto_Repuestos_vfCantidad').text('La cantidad debe ser numérica');
                $('#divInsertPresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }
            else if (parseInt(cantidad) < 1)
            {
                $('#divInsertPresupuesto_Repuestos_vfCantidad').text('La cantidad debe ser mayor a 0');
                $('#divInsertPresupuesto_Repuestos_vfCantidad').show();

                valid = false;
            }

            return valid;
        }

        function insertPresupuesto_RepuestoSelect_Cancel()
        {
            clearForm_InsertPresupuesto_RepuestoSelect();

            $("#divInsertPresupuesto_RepuestosSelect").hide();
            $("#divInsertPresupuesto_RepuestosList").show();
        }

        function showInsertPresupuesto_RepuestoAdd()
        {
            $('.requiredText').hide();

            $("#divInsertPresupuesto_RepuestosList").hide();
            $("#divInsertPresupuesto_RepuestosSelect").show();
        }

        /*
        function insertPresupuesto_loadDDLRepuesto()
        {
            ddlInsertPresupuesto_Repuesto.setData([]);

            $.post(
                '../service/WSTaller.asmx/getHeaderListRepuesto_JSON',
                {
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de repuestos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
                                   {
                                       icon: 'fa fa-warning',
                                       title: 'ERROR',
                                       content: 'Se ha producido un error al recuperar la lista de repuestos',
                                       confirmButton: 'Cerrar'
                                   }
                               );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                ddlInsertPresupuesto_Repuesto.setData(data);

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de repuestos',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }
        */

        function insertPresupuesto_Tecnico_calculateNeto()
        {
            var cantidadHoras = $('#<%= txtInsertPresupuesto_Tecnico_CantidadHoras.ClientID %>').val();
            var valorHH = $('#<%= txtInsertPresupuesto_Tecnico_ValorHH.ClientID %>').val();

            cantidadHoras = parseInt(cantidadHoras);
            valorHH = parseInt(valorHH);

            if ((isNaN(cantidadHoras) == false) && (isNaN(valorHH) === false))
            {
                var netoTecnico = cantidadHoras * valorHH;
            }
            else
            {
                var netoTecnico = "Error de cálculo";
            }

            $('#lbInsertPresupuesto_Tecnico_ValorNeto').text(netoTecnico);

            insertPresupuesto_Confirmacion_calculateResumen();
        }

        function insertPresupuesto_loadDDLTecnico()
        {
            $("#<%= ddlInsertPresupuesto_Tecnico.ClientID %>").find('option').remove();
            $("#<%= ddlInsertPresupuesto_Tecnico.ClientID %>").append('<option value="">Seleccione..</option>');

            $.post(
                '../service/WSTaller.asmx/getHeaderListTrabajador_JSON',
                {
                }
            )
            .done(
                function (response)
                {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];

                    switch (statusCode)
                    {
                        case -1:
                            {
                                //EXCEPTION

                                $.alert(
		                            {
		                                icon: 'fa fa-cogs',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de técnicos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 0:
                            {
                                //FAIL

                                $.alert(
		                            {
		                                icon: 'fa fa-warning',
		                                title: 'ERROR',
		                                content: 'Se ha producido un error al recuperar la lista de técnicos',
		                                confirmButton: 'Cerrar'
		                            }
                                );

                                break;
                            }

                        case 1:
                            {
                                //SUCCESS
                                var data = responseJson['data'];

                                for (var i = 0; i < data.length; i++) {
                                    $("#<%= ddlInsertPresupuesto_Tecnico.ClientID %>").append('<option value="' + data[i].id + '">' + data[i].nombre + '</option>');
                                }

                                break;
                            }

                        default:
                            {

                                break;
                            }
                    }
                }
            )
            .fail(
                function (response)
                {
                    //JQUERY ERROR

                    $.alert(
		                {
		                    icon: 'fa fa-cogs',
		                    title: 'ERROR',
		                    content: 'Se ha producido un error al recuperar la lista de técnicos',
		                    confirmButton: 'Cerrar'
		                }
                    );
                }
            );
        }

        function showInsertPresupuesto(tallerot_id)
        {
            $("#divDetailOT").hide();

            insertPresupuesto_prepareForm(tallerot_id);
            $("#divInsertPresupuesto").show();
        }

        function insertPresupuesto_prepareForm(tallerot_id)
        {
            clearForm_InsertPresupuesto();

            $("#divInsertPresupuesto_lbTitulo").text('OT #' + tallerot_id);
            $("#lbInsertPresupuesto_TallerOTID").text(tallerot_id);

            insertPresupuesto_loadDDLTecnico();
            //insertPresupuesto_loadDDLRepuesto();
            divInsertPresupuesto_goTabAntecedentes(0);
        }

        function divInsertPresupuesto_goTabAntecedentes(direction)
        {
            $("#divInsertPresupuesto_tabAntecedentes").click();
        }

        function divInsertPresupuesto_goTabTecnico(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_InsertPresupuesto_Antecedentes();

                if (validForm === true)
                {
                    $("#divInsertPresupuesto_tabTecnico").click();
                }
                else
                {
                    $.alert(
                            {
                                icon: 'fa fa-warning',
                                title: 'ATENCIÓN',
                                content: 'Para continuar debes completar los datos del formulario',
                                confirmButton: 'Cerrar'
                            }
                    );
                }
            }
            else
            {
                $("#divInsertPresupuesto_tabTecnico").click();
            }
        }

        function divInsertPresupuesto_goTabRepuestos(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_InsertPresupuesto_Tecnico();

                if (validForm === true)
                {
                    $("#divInsertPresupuesto_tabRepuestos").click();
                }
                else
                {
                    $.alert(
                            {
                                icon: 'fa fa-warning',
                                title: 'ATENCIÓN',
                                content: 'Para continuar debes completar los datos del formulario',
                                confirmButton: 'Cerrar'
                            }
                    );
                }
            }
            else
            {
                $("#divInsertPresupuesto_tabRepuestos").click();
            }
        }

        function divInsertPresupuesto_goTabConfirmacion(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_InsertPresupuesto_Repuestos();

                if (validForm === true)
                {
                    $("#divInsertPresupuesto_tabConfirmacion").click();
                }
                else
                {
                    $.alert(
                            {
                                icon: 'fa fa-warning',
                                title: 'ATENCIÓN',
                                content: 'Para continuar debes completar los datos del formulario',
                                confirmButton: 'Cerrar'
                            }
                    );
                }
            }
            else
            {
                $("#divInsertPresupuesto_tabConfirmacion").click();
            }
        }

        function cancelInsertPresupuesto()
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'REGISTRAR PRESUPUESTO',
                    content: 'Se perder&aacute;n todos los datos no guardados. ¿Desea continuar?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        $("#divInsertPresupuesto").hide();
                        $("#divDetailOT").show();
                    }
                }
            );   
        }

        function tbOT_addPresupuesto()
        {
            var tallerot_id = $('#divDetailOT_lbTitulo').text();
            showInsertPresupuesto(tallerot_id);
        }

    </script>

</asp:Content>