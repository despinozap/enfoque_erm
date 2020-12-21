<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Presupuestos.aspx.cs" Inherits="Taller_Presupuestos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- DateTimePicker CSS -->
    <link href="../Theme/js/bootstrap-datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet">

	<!-- DATA TABLES -->
	<link rel="stylesheet" type="text/css" href="../Theme/js/datatables/css/jquery.dataTables.min.css" />

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
					    <h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i> Presupuestos</h3>
                    </div>     
			    </div>
		    </div>
	    </div>
        <!-- /PAGE HEADER -->
        <!-- Div Detail Presupuesto -->
        <div class="row" id="divDetailPresupuesto" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Detalle de Presupuesto #<label id="divDetailPresupuesto_lbTitulo"></label></h4>
					    <div class="tools">
						    <a href="javascript:cancelDetailPresupuesto();" class="">
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
                                        <label id="divDetailPresupuesto_lbOTId" style="display: none;"></label>
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
                                                            Fecha compromiso
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbFechaCompromiso">
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
                                                            Causa probable
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbCausaProbable">
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
                                                            Técnico asignado
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbTecnicoAsignado">
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
                                                            Valor técnico
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailPresupuesto_Presupuesto_lbValorTecnico">
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
														<th>Código</th>
														<th>Sap</th>
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
                        <div id="divDetailPresupuesto_Resolucion" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Resolución</h4>
                            </div>
	                        <div class="box-body">
		                        <div class="form-horizontal" role="form">
                                    <div class="form-group"> 
						                <label class="col-md-2 control-label">
							                Observaciones
						                </label>
						                <div class="col-md-10">											 
                                            <asp:TextBox type="text" ID="txtDetailPresupuesto_Resolucion_Observaciones" class="form-control" runat="server" ReadOnly="false" Rows="4" TextMode="MultiLine"></asp:TextBox>							 
						                    <span class="requiredText" id="divDetailPresupuesto_Resolucion_vfObservaciones">Debes ingresar la raz&oacute;n del rechazo</span>
                                        </div>
                                    </div>
			                        <div class="form-group"> 
										<div class="col-md-6">
                                            <a id="divDetailPresupuesto_Resolucion_btApprove" href="javascript:tryApprovePresupuesto();" class="btn btn-lg btn-success pull-right"><i class="fa fa-check"></i> Aprobar presupuesto</a>
										</div>
										<div class="col-md-6">
											<a id="divDetailPresupuesto_Resolucion_btReject" href="javascript:tryRejectPresupuesto();" class="btn btn-lg btn-danger pull-left"><i class="fa fa-times"></i> Rechazar presupuesto</a>
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
                                                        <asp:TextBox type="number" ID="txtUpdatePresupuesto_Tecnico_CantidadHoras" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divUpdatePresupuesto_Tecnico_vfCantidadHoras">Debes ingresar la cantidad de horas asignadas</span>
                                                    </div>
								                    <label class="col-md-2 control-label">
							                            Valor HH <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:TextBox type="number" ID="txtUpdatePresupuesto_Tecnico_ValorHH" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
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
                                                        <asp:TextBox type="number" ID="txtUpdatePresupuesto_Repuestos_Cantidad" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
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
        <!-- Data List Presupuesto -->
        <div class="row" id="divListPresupuesto">
            <!-- DATA TABLES -->
		    <div class="col-md-12">            
			    <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-users"></i>Presupuestos</h4>
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
					    <table id="dtPresupuesto" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						    <thead>
							    <tr>
                                    <th class="">ID</th>
                                    <th class="">ID Equipo</th>
                                    <th class="">Descripci&oacute;n falla</th>
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

    <!-- MAGIC SUGGEST -->
    <script src="../Theme/js/magic-suggest/magicsuggest-1.3.1-min.js" type="text/javascript"></script>


    <script type="text/javascript">

        $(document).ready(
            function ()
            {
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

                loadDTPresupuesto();
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
            dtPresupuesto = $('#dtPresupuesto').DataTable({
                "createdRow": function (row, data, index)
                {
                    $(row).find('td').attr('align', 'center');

                    $(row).find('td > .btn-success').click(
                        function ()
                        {
                            var columns = $($($(this).parent()).parent()).find('td');
                            var estado = $($(columns).get(6)).text();
                            if(estado === 'Pendiente')
                            {
                                tbPresupuesto_detailItem(data[0], true);
                            }
                            else
                            {
                                tbPresupuesto_detailItem(data[0], false);
                            }
                            
                        }
                    );

                    $(row).find('td > .btn-warning').click(
                        function ()
                        {
                            tbPresupuesto_editItem(data[0]);
                        }
                    );

                    $(row).find('td > .btn-danger').click(
                        function () {
                            tbPresupuesto_removeItem(data[0]);
                        }
                    );
                }
            });
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


        /*
        *
        *   L I S T  P R E S U P U E S T O
        *
        */

        function loadPresupuesto_addRow
        (
            id,
            equipo_id,
            descripcionFallo,
            empresa,
            fecha,
            fechaCompromiso,
            estado,
            optionDetail,
            optionEdit,
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

            if (optionEdit === true)
            {
                var buttonIcon = document.createElement('i');
                buttonIcon.className = 'fa fa-pencil';
                var editButton = document.createElement('a');
                editButton.className = 'btn btn-warning';
                editButton.style = 'margin-right: 2px;';
                editButton.title = 'Editar';
                $(editButton).append($(buttonIcon));

                options += editButton.outerHTML;
            }

            /*
            if (optionRemove === true)
            {
                var buttonIcon = document.createElement('i');
                buttonIcon.className = 'fa fa-trash-o';
                var removeButton = document.createElement('a');
                removeButton.className = 'btn btn-danger';
                $(removeButton).append($(buttonIcon));

                options += removeButton.outerHTML;
            }
            */

            dtPresupuesto.row.add(
                            [
                                id,
                                equipo_id,
                                descripcionFallo,
                                empresa,
                                fecha,
                                fechaCompromiso,
                                estado,
                                options
                            ]
            ).draw(false);
        }

        function loadDTPresupuesto()
        {
            $.post(
                '../service/WSTaller.asmx/getHeaderListTallerPresupuesto_JSON',
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

                                dtPresupuesto.clear().draw(false);

                                for (var i = 0; i < data.length; i++)
                                {
                                    var presupuesto = data[i];

                                    if (presupuesto.tallerpresupuesto_estadoId === 1)
                                    {
                                        loadPresupuesto_addRow(
                                            presupuesto.id,
                                            presupuesto.equipo_id,
                                            presupuesto.descripcionFallo,
                                            presupuesto.empresa,
                                            presupuesto.fecha,
                                            presupuesto.fechaCompromiso,
                                            presupuesto.tallerpresupuesto_estadoNombre,
                                            true,
                                            true,
                                            true
                                        );
                                    }
                                    else
                                    {
                                        loadPresupuesto_addRow(
                                            presupuesto.id,
                                            presupuesto.equipo_id,
                                            presupuesto.descripcionFallo,
                                            presupuesto.empresa,
                                            presupuesto.fecha,
                                            presupuesto.fechaCompromiso,
                                            presupuesto.tallerpresupuesto_estadoNombre,
                                            true,
                                            false,
                                            false
                                        );
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
                }
            );
        }


        /*
        *
        *   D E T A I L  P R E S U P U E S T O
        *
        */

        function tryApprovePresupuesto()
        {
            $('.requiredText').hide();

            var id = $('#divDetailPresupuesto_lbTitulo').text();

            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'APROBAR PRESUPUESTO',
                    content: '¿Realmente deseas aprobar el presupuesto #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        approvePresupuesto(id);
                    }
                }
            );
        }

        function approvePresupuesto(id)
        {
            var data = new FormData();

            data.append('tallerpresupuestoId', id);
            data.append('observaciones', $("#<%= txtDetailPresupuesto_Resolucion_Observaciones.ClientID %>").val());

            $.ajax(
                {
                    type: "POST",
                    url: "../service/WSTaller.asmx/approvePresupuesto_JSON",
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
                                                    clearForm_DetailPresupuesto();
                                                    $("#divDetailPresupuesto").hide();
                                                    loadDTPresupuesto();
                                                    $("#divListPresupuesto").show();
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

        function tryRejectPresupuesto()
        {
            $('.requiredText').hide();
            validForm = validateForm_DetailPresupuesto_Resolucion();

            if (validForm === true)
            {
                var id = $('#divDetailPresupuesto_lbTitulo').text();
                var tallerot_id = $('#divDetailPresupuesto_lbOTId').text();

                $.confirm(
                    {
                        icon: 'fa fa-question',
                        title: 'RECHAZAR PRESUPUESTO',
                        content: '¿Realmente deseas rechazar el presupuesto #' + id + '?',
                        confirmButton: 'Aceptar',
                        cancelButton: 'Cancelar',
                        confirm: function ()
                        {
                            rejectPresupuesto(id);
                        }
                    }
                );
            }
        }

        function rejectPresupuesto(id)
        {
            var data = new FormData();

            data.append('tallerpresupuestoId', id);
            data.append('observaciones', $("#<%= txtDetailPresupuesto_Resolucion_Observaciones.ClientID %>").val());

            $.ajax(
                {
                    type: "POST",
                    url: "../service/WSTaller.asmx/rejectPresupuesto_JSON",
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
                                                    clearForm_DetailPresupuesto();
                                                    $("#divDetailPresupuesto").hide();
                                                    loadDTPresupuesto();
                                                    $("#divListPresupuesto").show();
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

        function validateForm_DetailPresupuesto_Resolucion()
        {
            var observaciones = $('#<%= txtDetailPresupuesto_Resolucion_Observaciones.ClientID %>').val();

            var valid = true;

            if(observaciones.length < 1)
            {
                $('#divDetailPresupuesto_Resolucion_vfObservaciones').show();

                valid = false;
            }

            return valid;
        }

        function clearForm_DetailPresupuesto()
        {
            $('#<%= txtDetailPresupuesto_Resolucion_Observaciones.ClientID %>').val('');
        }


        function tbPresupuesto_detailItem(id, evaluable)
        {
            if(evaluable === true)
            {
                $('#divDetailPresupuesto_Resolucion').show();
            }
            else
            {
                $('#divDetailPresupuesto_Resolucion').hide();
            }
            
            loadPresupuesto_Detail(id, evaluable);
        }

        function loadPresupuesto_Detail(id)
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
                                    $('#divDetailPresupuesto_lbOTId').text(tbTallerPresupuesto['tallerot_id']);
                                    $('#divDetailPresupuesto_Presupuesto_lbFecha').text(tbTallerPresupuesto['tallerpresupuesto_fecha']);
                                    $('#divDetailPresupuesto_Presupuesto_lbFechaCompromiso').text(tbTallerPresupuesto['tallerpresupuesto_fechaCompromiso']);
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

                                    for (var i = 0; i < tbTallerRepuesto.length; i++) {
                                        var tallerrepuesto = tbTallerRepuesto[i];
                                        var newRow = '<tr title="' + tallerrepuesto.repuesto_nombre + ': ' + tallerrepuesto.repuesto_descripcion + '">'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_id + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_codigo + '</td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.repuesto_sap + '</td>'
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

                                $("#divDetailPresupuesto").show();
                                $("#divListPresupuesto").hide();

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

        function cancelDetailPresupuesto()
        {
            $("#divDetailPresupuesto").hide();
            $("#divListPresupuesto").show();
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
		                                            confirm: function () {
		                                                clearForm_UpdatePresupuesto();
		                                                $("#divUpdatePresupuesto").hide();
		                                                loadDTPresupuesto();
                                                        $('#divListPresupuesto').show();
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
            else
            {
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
                function ()
                {
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
                                                    + '         <a class="btn btn-danger" href="javascript:tbUpdatePresupuesto_Repuestos_removeItem(' + repuesto.id + ');" title="Eliminar"><i class="fa  fa-trash-o"></i></a>'
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
            else {
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

            if ((isNaN(cantidadHoras) == false) && (isNaN(valorHH) === false))
            {
                var netoTecnico = cantidadHoras * valorHH;
            }
            else
            {
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
                                                   + '  <td style="text-align:right;"><div class="input-group"><span class="input-group-addon"><i class="fa fa-usd"></i></span><input type="number" class="form-control textNumber" value="' + tallerrepuesto.tallerpresupuesto_repuesto_valorUnitario + '"/></div><span class="requiredText" style="display: none;"></span></td>'
                                                   + '  <td style="text-align: center;">' + tallerrepuesto.tallerpresupuesto_repuesto_cantidad + '</td>'
                                                   + '  <td style="text-align: right;">' + formatPeso(tallerrepuesto.tallerpresupuesto_repuesto_total) + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-danger" href="javascript:tbUpdatePresupuesto_Repuestos_removeItem(' + tallerrepuesto.repuesto_id + ');" title="Eliminar"><i class="fa  fa-trash-o"></i></a>'
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

                                $("#divListPresupuesto").hide();
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

        function tbPresupuesto_editItem(id)
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
                        $("#divListPresupuesto").show();
                    }
                }
            );
        }


        /*
        *
        *   R E M O V E  P R E S U P U E S T O
        *
        */

        function tryRemovePresupuesto(id)
        {
            alert('Trying to remove presupuesto ' + id);
        }

        function tbPresupuesto_removeItem(id)
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
                        tryRemovePresupuesto(id);
                    }
                }
            );
        }

    </script>

</asp:Content>