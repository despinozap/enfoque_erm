<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Ingresos.aspx.cs" Inherits="Taller_Ingreso" %>

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
					    <h3 class="content-title pull-left padding-top-10"><i class="fa fa-users"></i> Ingresos a Taller</h3>
                        <a id="btnNuevo" href="#" onclick="showInsertIngreso();" class="btn btn-lg btn-success pull-right"><i class="fa fa-plus"></i> Nuevo</a>
                    </div>     
			    </div>
		    </div>
	    </div>
	    <!-- /PAGE HEADER -->
        <!-- Div Insert Ingreso -->
        <div class="row divInsertar" id="divInsertIngreso" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Nuevo ingreso</h4>
					    <div class="tools">
						    <a href="javascript:cancelInsertIngreso();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
                        <div class="tabbable">
					        <ul class="nav nav-tabs">
						        <li class="active"><a href="#divInsertIngreso_Cliente" data-toggle="tab" id="divInsertIngreso_tabCliente"><i class="fa fa-briefcase"></i> Cliente</a></li>
						        <li><a href="#divInsertIngreso_Recepcion" data-toggle="tab" id="divInsertIngreso_tabRecepcion"><i class="fa fa-check-circle"></i> Recepción</a></li>
						        <li><a href="#divInsertIngreso_Equipos" data-toggle="tab" id="divInsertIngreso_tabEquipos"><i class="fa fa-gears"></i> Equipos</a></li>
                                <li><a href="#divInsertIngreso_Documentos" data-toggle="tab" id="divInsertIngreso_tabDocumentos"><i class="fa fa-files-o"></i> Documentos</a></li>
					        </ul>
					        <div class="tab-content">
						        <div class="tab-pane fade in active" id="divInsertIngreso_Cliente">
							        <div class="panel panel-default" id="divInsertIngreso_ClienteSelect">
									    <div class="panel-heading">
										    <h3 class="panel-title">Seleccionar cliente</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Empresa <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:DropDownList ID="ddlInsertIngreso_Empresa" CssClass="form-control" runat="server"></asp:DropDownList>										 
						                                <span class="requiredText" id="divInsertIngreso_Cliente_vfEmpresa">Debes seleccionar una empresa</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Contacto <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:DropDownList ID="ddlInsertIngreso_Contacto" CssClass="form-control" runat="server"></asp:DropDownList>										 
						                                <span class="requiredText" id="divInsertIngreso_Cliente_vfContacto">Debes seleccionar un contacto</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous disabled"><a href="#">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divInsertIngreso_goTabRecepcion(1);">Siguiente &rarr;</a></li>
									</ul>
						        </div>
						        <div class="tab-pane fade" id="divInsertIngreso_Recepcion">
                                    <div class="panel panel-default" id="divInsertIngreso_RecepcionDatos">
									    <div class="panel-heading">
										    <h3 class="panel-title">Datos de recepción</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Nº de recepción <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:TextBox type="text" ID="txtInsertIngreso_Recepcion_NumeroRecepcion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divInsertIngreso_Recepcion_vfNumeroRecepcion">Debes ingresar el número de recepción</span>
                                                    </div>
                                                    <label class="col-md-2 control-label">
							                            Recepcionado por <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:DropDownList ID="ddlInsertIngreso_RecepcionadoPor" CssClass="form-control" runat="server"></asp:DropDownList>							 
						                                <span class="requiredText" id="divInsertIngreso_Recepcion_vfRecepcionadoPor">Debes seleccionar el personal que recepciona</span>
                                                    </div>                                                    
                                                </div>
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Fecha de recepción <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">	
                                                        <div class="input-group">
												            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											                <asp:TextBox type="text" ID="txtInsertIngreso_Recepcion_FechaRecepcion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
											            </div>										 
                                                        <span class="requiredText" id="divInsertIngreso_Recepcion_vfFechaRecepcion">Debes ingresar la fecha de recepción</span>						 
						                            </div>
                                                    <label class="col-md-2 control-label">
						                            </label>
						                            <div class="col-md-4">											 
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
						                            <label class="col-md-2 control-label">
							                            Observaciones
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:TextBox type="text" ID="txtInsertIngreso_Recepcion_Observaciones" class="form-control" runat="server" ReadOnly="false" Rows="4" TextMode="MultiLine"></asp:TextBox>							 
						                            </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
						            <ul class="pager">
                                        <li class="previous"><a href="javascript:divInsertIngreso_goTabCliente(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divInsertIngreso_goTabEquipos(1);">Siguiente &rarr;</a></li>
									</ul>
                                </div>
						        <div class="tab-pane fade" id="divInsertIngreso_Equipos">
							        <div class="panel panel-default" id="divInsertIngreso_EquiposSelect" style="display: none;">
									    <div class="panel-heading">
										    <h3 class="panel-title">Seleccionar equipo</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Equipo (sap) <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">			
                                                        <input type="text" id="ddlInsertIngreso_Equipo" class="form-control" />								 									 
						                                <span class="requiredText" id="divInsertIngreso_Equipos_vfEquipo">Debes seleccionar el equipo</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-10 col-md-offset-2">
                                                        <a class="btn btn-danger pull-right" href="javascript:insertIngreso_EquipoSelect_Cancel();"><i class="fa fa-times"></i> Cancelar</a>
                                                        <a class="btn btn-success pull-right" href="javascript:insertIngreso_EquipoSelect_Success();"><i class="fa fa-plus"></i> Aceptar</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <div class="panel panel-default" id="divInsertIngreso_EquiposList">
									    <div class="panel-heading">
										    <h3 class="panel-title">Lista de equipos recepcionados</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbInsertIngreso_Equipos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th>ID</th>
                                                                    <th>Sap</th>
	                                                                <th>Código</th>
	                                                                <th>Nombre</th>            
                                                                    <th>Tipo</th>
                                                                    <th>Modelo</th>
                                                                    <th>Opciones</th>
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
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-8 col-md-offset-2" style="text-align:center;">
                                                        <span class="requiredText" id="divInsertIngreso_Equipo_vfEquipos">Debes seleccionar al menos un equipo</span>
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <a class="btn btn-success pull-right" href="javascript:showInsertIngreso_EquipoAdd();"><i class="fa fa-plus"></i> Agregar equipo</a>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbInsertIngreso_Fotos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th style="display: none;">ID</th>
                                                                    <th>Nombre del archivo</th>
                                                                    <th>ID Equipo</th>
	                                                                <th>Opciones</th>
							                                    </tr>
						                                    </thead>
						                                    <tbody>
                                                                <tr>
                                                                    <td colspan="3" style="text-align:center;">
                                                                        <label>No hay elementos cargados en la lista</label>
                                                                    </td>
                                                                </tr>
						                                    </tbody>
						                                    <tfoot>
                                                                <tr style="display:none;">
                                                                    <td>
                                                                        <input type="file" id="divInsertIngreso_Fotos_fuFile" accept=".jpg,.jpeg,.png" />
                                                                    </td>
                                                                </tr>
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-8 col-md-offset-2" style="text-align:center;">
                                                        <span class="requiredText" id="divInsertIngreso_Equipos_vfFotos">Debes seleccionar al menos una foto</span>
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>

						            <ul class="pager">
                                        <li class="previous"><a href="javascript:divInsertIngreso_goTabRecepcion(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divInsertIngreso_goTabDocumentos(1);">Siguiente &rarr;</a></li>
									</ul>
                                </div>
                                <div class="tab-pane fade" id="divInsertIngreso_Documentos">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">
							                    Acta de recepción <span class="required">*</span>
						                    </label>
						                    <div class="col-md-6">											 
                                                <input type="file" id="divInsertIngreso_Documentos_fuActaRecepcion" accept=".jpg,.jpeg,.png" style="display: none;" />	
                                                <label id="divInsertIngreso_Documentos_idActaRecepcion" style="display: none;"></label>
                                                <label id="divInsertIngreso_Documentos_fnActaRecepcion" class="control-label">No se ha cargado el archivo</label>							 
						                        <span class="requiredText" id="divInsertIngreso_Documentos_vfActaRecepcion">Debes cargar el acta de recepción</span>
                                            </div>
                                            <div class="col-md-2">
                                                <a id="divInsertIngreso_btSelectFile_ActaRecepcion" class="btn btn-default form-control"><i class="fa fa-file-text-o"></i> Seleccionar</a>
                                            </div>
                                            <div class="col-md-2">
                                               
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">
							                    Guía de despacho
						                    </label>
						                    <div class="col-md-6">											 
                                                <input type="file" id="divInsertIngreso_Documentos_fuGuiaDespacho" accept=".jpg,.jpeg,.png" style="display: none;" />	
                                                <label id="divInsertIngreso_Documentos_idGuiaDespacho" style="display: none;"></label>
                                                <label id="divInsertIngreso_Documentos_fnGuiaDespacho" class="control-label">No se ha cargado el archivo</label>							 
                                            </div>
                                            <div class="col-md-2">
                                                <a id="divInsertIngreso_btSelectFile_GuiaDespacho" class="btn btn-default form-control"><i class="fa fa-file-text-o"></i> Seleccionar</a>
                                            </div>
                                            <div class="col-md-2">
                                                <a id="divInsertIngreso_btClearFile_GuiaDespacho" class="btn btn-danger form-control" disabled="true"><i class="fa  fa-trash-o"></i> Quitar</a>
                                            </div>
                                        </div>
                                        <ul class="pager">
                                            <li class="previous"><a href="javascript:divInsertIngreso_goTabEquipos(0);">&larr; Anterior</a></li>
										    <li class="next"><a href="javascript:tryInsertIngreso();">Siguiente &rarr;</a></li>
									    </ul>
                                    </div>
                                </div>
					        </div>
					    </div>
                    </div>                
			    </div>
			    <!-- /BOX -->
            </div>
        </div>
        <!-- Div Detail Ingreso -->
        <div class="row" id="divDetailIngreso" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Detalle de ingreso #<label id="divDetailIngreso_lbTitulo"></label></h4>
					    <div class="tools">
						    <a href="javascript:cancelDetailIngreso();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
						<div id="divDetailIngreso_Ingreso" class="box border">
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
                                                            Empresa
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailIngreso_lbEmpresa">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Contacto
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailIngreso_lbContacto">
						                                </label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Nº recepción
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailIngreso_lbNumeroRecepcion">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Recepcionado por
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailIngreso_lbRecepcionadoPor">
						                                </label>
                                                    </td>
                                                </tr>
												<tr>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha recepción
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailIngreso_lbFechaRecepcion">
						                                </label>
                                                    </td>
                                                    <td class="infoTitle">
                                                        <label>
                                                            Fecha registro
                                                        </label>
                                                    </td>
                                                    <td class="infoValue">
                                                        <label id="divDetailIngreso_lbFechaRegistro">
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
                                                        <label id="divDetailIngreso_lbObservaciones">
						                                </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>                                           
									</div>
								</div>
							</div>
						</div>
						<div id="divDetailIngreso_Equipos" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Equipos</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
							<div class="box-body">
								<div class="form-group"> 
									<table id="tbDetailIngreso_Equipos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>ID</th>
												<th>Sap</th>
												<th>Código</th>
												<th>Nombre</th>            
												<th>Tipo</th>
												<th>Modelo</th>
												<th>Fotos</th>
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
						<div id="divDetailIngreso_Documentos" class="box border">
                            <div class="box-title">
							    <h4><i class="fa fa-bars"></i>Documentos</h4>
							    <div class="tools hidden-xs">
								    <a href="#" class="collapseBoxButton">
									    <i class="fa fa-chevron-up"></i>
								    </a>
							    </div>
                            </div>
							<div class="box-body">
								<div class="form-group"> 
									<table id="tbDetailIngreso_Documentos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>Nombre</th>
												<th>Tamaño</th>
												<th>Tipo</th>
												<th>Documento</th>            
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
						</div>
					</div>              
			    </div>
			    <!-- /BOX -->
            </div>
        </div>
        <!-- Div Update Ingreso -->
        <div class="row" id="divUpdateIngreso" style="display: none;">
            <div class="col-md-12">
                <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-user"></i>Editar ingreso #<label id="divUpdateIngreso_lbTitulo"></label></h4>
					    <div class="tools">
						    <a href="javascript:cancelUpdateIngreso();" class="">
							    <i class="fa fa-times"></i>
						    </a>
					    </div>
				    </div>
				    <div class="box-body">
                        <div class="tabbable">
					        <ul class="nav nav-tabs">
						        <li class="active"><a href="#divUpdateIngreso_Cliente" data-toggle="tab" id="divUpdateIngreso_tabCliente"><i class="fa fa-briefcase"></i> Cliente</a></li>
						        <li><a href="#divUpdateIngreso_Recepcion" data-toggle="tab" id="divUpdateIngreso_tabRecepcion"><i class="fa fa-check-circle"></i> Recepción</a></li>
						        <li><a href="#divUpdateIngreso_Equipos" data-toggle="tab" id="divUpdateIngreso_tabEquipos"><i class="fa fa-gears"></i> Equipos</a></li>
                                <li><a href="#divUpdateIngreso_Documentos" data-toggle="tab" id="divUpdateIngreso_tabDocumentos"><i class="fa fa-files-o"></i> Documentos</a></li>
					        </ul>
					        <div class="tab-content">
                                <div class="tab-pane fade in active" id="divUpdateIngreso_Cliente">
							        <div class="panel panel-default" id="divUpdateIngreso_ClienteSelect">
									    <div class="panel-heading">
										    <h3 class="panel-title">Seleccionar cliente</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Empresa <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:DropDownList ID="ddlUpdateIngreso_Empresa" CssClass="form-control" runat="server"></asp:DropDownList>										 
						                                <span class="requiredText" id="divUpdateIngreso_Cliente_vfEmpresa">Debes seleccionar una empresa</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Contacto <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:DropDownList ID="ddlUpdateIngreso_Contacto" CssClass="form-control" runat="server"></asp:DropDownList>										 
						                                <span class="requiredText" id="divUpdateIngreso_Cliente_vfContacto">Debes seleccionar un contacto</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <ul class="pager">
                                        <li class="previous disabled"><a href="#">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divUpdateIngreso_goTabRecepcion(1);">Siguiente &rarr;</a></li>
									</ul>
						        </div>
                                <div class="tab-pane fade" id="divUpdateIngreso_Recepcion">
                                    <div class="panel panel-default" id="divUpdateIngreso_RecepcionDatos">
									    <div class="panel-heading">
										    <h3 class="panel-title">Datos de recepción</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Nº de recepción <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:TextBox type="text" ID="txtUpdateIngreso_Recepcion_NumeroRecepcion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>							 
						                                <span class="requiredText" id="divUpdateIngreso_Recepcion_vfNumeroRecepcion">Debes ingresar el número de recepción</span>
                                                    </div>
                                                    <label class="col-md-2 control-label">
							                            Recepcionado por <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">											 
                                                        <asp:DropDownList ID="ddlUpdateIngreso_RecepcionadoPor" CssClass="form-control" runat="server"></asp:DropDownList>							 
						                                <span class="requiredText" id="divUpdateIngreso_Recepcion_vfRecepcionadoPor">Debes seleccionar el personal que recepciona</span>
                                                    </div>                                                    
                                                </div>
                                                <div class="form-group"> 
                                                    <label class="col-md-2 control-label">
							                            Fecha de recepción <span class="required">*</span>
						                            </label>
						                            <div class="col-md-4">	
                                                        <div class="input-group">
												            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											                <asp:TextBox type="text" ID="txtUpdateIngreso_Recepcion_FechaRecepcion" class="form-control" runat="server" ReadOnly="false"></asp:TextBox>
											            </div>										 
                                                        <span class="requiredText" id="divUpdateIngreso_Recepcion_vfFechaRecepcion">Debes ingresar la fecha de recepción</span>						 
						                            </div>
                                                    <label class="col-md-2 control-label">
						                            </label>
						                            <div class="col-md-4">											 
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
						                            <label class="col-md-2 control-label">
							                            Observaciones
						                            </label>
						                            <div class="col-md-10">											 
                                                        <asp:TextBox type="text" ID="txtUpdateIngreso_Recepcion_Observaciones" class="form-control" runat="server" ReadOnly="false" Rows="4" TextMode="MultiLine"></asp:TextBox>							 
						                            </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
						            <ul class="pager">
                                        <li class="previous"><a href="javascript:divUpdateIngreso_goTabCliente(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divUpdateIngreso_goTabEquipos(1);">Siguiente &rarr;</a></li>
									</ul>
                                </div>
                                <div class="tab-pane fade" id="divUpdateIngreso_Equipos">
							        <div class="panel panel-default" id="divUpdateIngreso_EquiposSelect" style="display: none;">
									    <div class="panel-heading">
										    <h3 class="panel-title">Seleccionar equipo</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-md-2 control-label">
							                            Equipo (sap) <span class="required">*</span>
						                            </label>
						                            <div class="col-md-10">											 
                                                        <input type="text" id="ddlUpdateIngreso_Equipo" class="form-control" />											 
						                                <span class="requiredText" id="divUpdateIngreso_Equipos_vfEquipo">Debes seleccionar el equipo</span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-10 col-md-offset-2">
                                                        <a class="btn btn-danger pull-right" href="javascript:updateIngreso_EquipoSelect_Cancel();"><i class="fa fa-times"></i> Cancelar</a>
                                                        <a class="btn btn-success pull-right" href="javascript:updateIngreso_EquipoSelect_Success();"><i class="fa fa-plus"></i> Aceptar</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
                                    <div class="panel panel-default" id="divUpdateIngreso_EquiposList">
									    <div class="panel-heading">
										    <h3 class="panel-title">Lista de equipos recepcionados</h3>
									    </div>
									    <div class="panel-body">
                                            <div class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbUpdateIngreso_Equipos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th>ID</th>
                                                                    <th>Sap</th>
	                                                                <th>Código</th>
	                                                                <th>Nombre</th>            
                                                                    <th>Tipo</th>
                                                                    <th>Modelo</th>
                                                                    <th>Opciones</th>
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
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-8 col-md-offset-2" style="text-align:center;">
                                                        <span class="requiredText" id="divUpdateIngreso_Equipo_vfEquipos">Debes seleccionar al menos un equipo</span>
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <a class="btn btn-success pull-right" href="javascript:showUpdateIngreso_EquipoAdd();"><i class="fa fa-plus"></i> Agregar equipo</a>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12">
                                                        <table id="tbUpdateIngreso_Fotos" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						                                    <thead>
							                                    <tr>
                                                                    <th style="display: none;">ID</th>
                                                                    <th>Nombre del archivo</th>
                                                                    <th>ID Equipo</th>
	                                                                <th>Opciones</th>
							                                    </tr>
						                                    </thead>
						                                    <tbody>
                                                                <tr>
                                                                    <td colspan="3" style="text-align:center;">
                                                                        <label>No hay elementos cargados en la lista</label>
                                                                    </td>
                                                                </tr>
						                                    </tbody>
						                                    <tfoot>
                                                                <tr style="display:none;">
                                                                    <td>
                                                                        <input type="file" id="divUpdateIngreso_Fotos_fuFile" accept=".jpg,.jpeg,.png" />
                                                                    </td>
                                                                </tr>
						                                    </tfoot>
					                                    </table>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-8 col-md-offset-2" style="text-align:center;">
                                                        <span class="requiredText" id="divUpdateIngreso_Equipos_vfFotos">Debes seleccionar al menos una foto</span>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label id="divUpdateIngreso_Fotos_removedFilesID" style="display: none;"></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
								    </div>
						            <ul class="pager">
                                        <li class="previous"><a href="javascript:divUpdateIngreso_goTabRecepcion(0);">&larr; Anterior</a></li>
										<li class="next"><a href="javascript:divUpdateIngreso_goTabDocumentos(1);">Siguiente &rarr;</a></li>
									</ul>
                                </div>
                                <div class="tab-pane fade" id="divUpdateIngreso_Documentos">
                                    <div class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">
							                    Acta de recepción <span class="required">*</span>
						                    </label>
						                    <div class="col-md-6">											 
                                                <input type="file" id="divUpdateIngreso_Documentos_fuActaRecepcion" accept=".jpg,.jpeg,.png" style="display: none;" />	
                                                <label id="divUpdateIngreso_Documentos_idActaRecepcion" style="display: none;"></label>
                                                <label id="divUpdateIngreso_Documentos_fnActaRecepcion" class="control-label">No se ha cargado el archivo</label>							 
						                        <span class="requiredText" id="divUpdateIngreso_Documentos_vfActaRecepcion">Debes cargar el acta de recepción</span>
                                            </div>
                                            <div class="col-md-2">
                                                <a id="divUpdateIngreso_btSelectFile_ActaRecepcion" class="btn btn-default form-control"><i class="fa fa-file-text-o"></i> Seleccionar</a>
                                            </div>
                                            <div class="col-md-2">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label">
							                    Guía de despacho
						                    </label>
						                    <div class="col-md-6">											 
                                                <input type="file" id="divUpdateIngreso_Documentos_fuGuiaDespacho" accept=".jpg,.jpeg,.png" style="display: none;" />	
                                                <label id="divUpdateIngreso_Documentos_idGuiaDespacho" style="display: none;"></label>
                                                <label id="divUpdateIngreso_Documentos_fnGuiaDespacho" class="control-label">No se ha cargado el archivo</label>						 
                                            </div>
                                            <div class="col-md-2">
                                                <a id="divUpdateIngreso_btSelectFile_GuiaDespacho" class="btn btn-default form-control"><i class="fa fa-file-text-o"></i> Seleccionar</a>
                                            </div>
                                            <div class="col-md-2">
                                                <a id="divUpdateIngreso_btClearFile_GuiaDespacho" class="btn btn-danger form-control" disabled="true"><i class="fa  fa-trash-o"></i> Quitar</a>
                                            </div>
                                        </div>
                                        <ul class="pager">
                                            <li class="previous"><a href="javascript:divUpdateIngreso_goTabEquipos(0);">&larr; Anterior</a></li>
										    <li class="next"><a href="javascript:tryUpdateIngreso();">Siguiente &rarr;</a></li>
									    </ul>
                                    </div>
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
                                            <label id="lbInsertPresupuesto_TallerIngresoID" style="display: none;">-1</label>
                                            <label id="lbInsertPresupuesto_EquipoID" style="display: none;">-1</label>
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
        <!-- Data List Ingreso -->
        <div class="row" id="divListIngreso_Equipo">
            <!-- DATA TABLES -->
		    <div class="col-md-12">            
			    <!-- BOX -->
			    <div class="box border blue">
				    <div class="box-title">
					    <h4><i class="fa fa-users"></i>Equipos ingresados</h4>
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
					    <table id="dtIngreso_Equipo" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
						    <thead>
							    <tr>
                                    <th class="">ID Ingreso</th>
                                    <th class="">ID Equipo</th>
                                    <th class="">Empresa</th>
                                    <th class="">Contacto</th>
                                    <th class="">Nº de recepción</th>
	                                <th class="">Fecha recepción</th>          
                                    <th class="">Opciones</th>
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

                //Insert ingreso
                {
                    $('#<%= ddlInsertIngreso_Empresa.ClientID %>').change(
                        function ()
                        {
                            insertIngreso_loadDDLContacto();
                        }
                    );

                    $("#<%= txtInsertIngreso_Recepcion_FechaRecepcion.ClientID %>").datetimepicker({
                        rtl: true,
                        format: "yyyy-mm-dd hh:ii",
                        language: "es",
                        endDate: new Date(),
                        autoclose: true,
                        showMeridian: true,
                        pickerPosition: "top-center",
                        pick12HourFormat: false
                    });

                    $('#divInsertIngreso_Documentos_fuActaRecepcion').change(
                        function ()
                        {
                            var file = $(this)[0].files[0];
                            $('#divInsertIngreso_Documentos_vfActaRecepcion').hide();

                            insertIngreso_Documentos_tryUploadFile(file, 0);
                        }
                    );

                    $('#divInsertIngreso_Documentos_fuGuiaDespacho').change(
                        function () 
                        {
                            var file = $(this)[0].files[0];
                            insertIngreso_Documentos_tryUploadFile(file, 1);
                        }
                    );

                    $('#divInsertIngreso_btSelectFile_ActaRecepcion').click(
                        function ()
                        {
                            $('#divInsertIngreso_Documentos_fuActaRecepcion').click();
                        }
                    );

                    $('#divInsertIngreso_btSelectFile_GuiaDespacho').click(
                        function ()
                        {
                            $('#divInsertIngreso_Documentos_fuGuiaDespacho').click();
                        }
                    );

                    $('#divInsertIngreso_btClearFile_GuiaDespacho').click(
                        function ()
                        {
                            $.confirm(
                                {
                                    icon: 'fa fa-question',
                                    title: 'ELIMINAR GUIA DE DESPACHO',
                                    content: '¿Realmente desea eliminar la guía de despacho del ingreso?',
                                    confirmButton: 'Aceptar',
                                    cancelButton: 'Cancelar',
                                    confirm: function ()
                                    {
                                        $('#divInsertIngreso_Documentos_fuGuiaDespacho').val('');
                                        $('#divInsertIngreso_Documentos_idGuiaDespacho').text('');
                                        $('#divInsertIngreso_Documentos_fnGuiaDespacho').text('No se ha cargado el archivo');
                                        $('#divInsertIngreso_btClearFile_GuiaDespacho').attr('disabled', 'true');
                                    }
                                }
                            );
                        }
                    );
                }

                //Update ingreso
                {
                    $("#<%= txtUpdateIngreso_Recepcion_FechaRecepcion.ClientID %>").datetimepicker(
                        {
                            rtl: true,
                            format: "yyyy-mm-dd hh:ii",
                            language: "es",
                            endDate: new Date(),
                            autoclose: true,
                            showMeridian: true,
                            pickerPosition: "top-center",
                            pick12HourFormat: false
                        }
                    );
                    
                    $('#divUpdateIngreso_Documentos_fuActaRecepcion').change(
                        function () 
                        {
                            var file = $(this)[0].files[0];
                            $('#divUpdateIngreso_Documentos_vfActaRecepcion').hide();

                            updateIngreso_Documentos_tryUploadFile(file, 0);
                        }
                    );

                    $('#divUpdateIngreso_Documentos_fuGuiaDespacho').change(
                        function () 
                        {
                            var file = $(this)[0].files[0];
                            updateIngreso_Documentos_tryUploadFile(file, 1);
                        }
                    );

                    $('#divUpdateIngreso_btSelectFile_ActaRecepcion').click(
                        function () 
                        {
                            $('#divUpdateIngreso_Documentos_fuActaRecepcion').click();
                        }
                    );

                    $('#divUpdateIngreso_btSelectFile_GuiaDespacho').click(
                        function () 
                        {
                            $('#divUpdateIngreso_Documentos_fuGuiaDespacho').click();
                        }
                    );

                    $('#divUpdateIngreso_btClearFile_GuiaDespacho').click(
                        function ()
                        {
                            $.confirm(
                                {
                                    icon: 'fa fa-question',
                                    title: 'ELIMINAR GUIA DE DESPACHO',
                                    content: '¿Realmente desea eliminar la guía de despacho del ingreso?',
                                    confirmButton: 'Aceptar',
                                    cancelButton: 'Cancelar',
                                    confirm: function ()
                                    {
                                        $('#divUpdateIngreso_Documentos_fuGuiaDespacho').val('');
                                        $('#divUpdateIngreso_Documentos_idGuiaDespacho').text('');
                                        $('#divUpdateIngreso_Documentos_fnGuiaDespacho').text('No se ha cargado el archivo');
                                        $('#divUpdateIngreso_btClearFile_GuiaDespacho').attr('disabled', 'true');
                                    }
                                }
                            );
                        }
                    );
                    
                }

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

                loadIngreso_loadDTIngreso_Equipo();
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
            dtIngreso_Equipo = $('#dtIngreso_Equipo').DataTable({
                "createdRow": function (row, data, index)
                {
                    $(row).find('td').attr('align', 'center');

                    $(row).find('td > .btn-success').click(
                        function ()
                        {
                            tbIngresoEquipo_detailItem(data[0]);
                        }
                    );

                    $(row).find('td > .btn-warning').click(
                        function ()
                        {
                            tbIngresoEquipo_editItem(data[0]);
                        }
                    );

                    $(row).find('td > .btn-default').click(
                        function ()
                        {
                            tbIngresoEquipo_createOT(data[0], data[1]);
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
            console.log('Original:' + strValue + ', Formated: ' + pesoValue);

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
            tbIngreso_detailItem("28");
        }

        function testJSON()
        {
            $.post(
                '../service/WSTaller.asmx/getTest_JSON',
                {
                }
            )
            .done(
                function (response) {
                    var responseText = $(response).text();
                    var responseJson = $.parseJSON(responseText);

                    var statusCode = responseJson['statusCode'];
                    var msg = responseJson['msg'];
                    var data = responseJson['data'];


                    console.log(data);
                }
            )
            .fail(
                function (response) {
                    //JQUERY ERROR
                }
            );
        }


        /*
        *
        *   I N S E R T  I N G R E S O
        *
        */

        function tryInsertIngreso()
        {
            validForm = validateForm_InsertIngreso();

            if (validForm === true)
            {
                var stringListEquipoId = "";
                var rowsEquipo = $('#tbInsertIngreso_Equipos > tbody > tr');

                for (var i = 0; i < rowsEquipo.length; i++)
                {
                    var colsEquipo = $(rowsEquipo[i]).find('td');
                    var equipo_id = $(colsEquipo[0]).text();

                    stringListEquipoId += equipo_id;
                    if (i < rowsEquipo.length - 1)
                    {
                        stringListEquipoId += ',';
                    }
                }


                var stringListFotosArchivoId = "";
                var stringListFotosEquipoId = "";
                var rowsFoto = $('#tbInsertIngreso_Fotos > tbody > tr');

                for (var i = 0; i < rowsFoto.length; i++)
                {
                    var colsFoto = $(rowsFoto[i]).find('td');

                    if (colsFoto.length > 2)
                    {
                        var archivo_id = $(colsFoto[0]).text();
                        var equipo_id = $(colsFoto[2]).text();

                        stringListFotosArchivoId += archivo_id;
                        stringListFotosEquipoId += equipo_id;
                        if (i < rowsFoto.length - 1)
                        {
                            stringListFotosArchivoId += ',';
                            stringListFotosEquipoId += ',';
                        }
                    }
                }

                var data = new FormData();

                data.append('numeroRecepcion', $("#<%= txtInsertIngreso_Recepcion_NumeroRecepcion.ClientID %>").val());
                data.append('recepcionadoPor', $("#<%= ddlInsertIngreso_RecepcionadoPor.ClientID %>").val());
                data.append('fechaRecepcion', $("#<%= txtInsertIngreso_Recepcion_FechaRecepcion.ClientID %>").val());
                data.append('observaciones', $("#<%= txtInsertIngreso_Recepcion_Observaciones.ClientID %>").val());
                data.append('contacto_id', $("#<%= ddlInsertIngreso_Contacto.ClientID %>").val());
                data.append('stringListEquipoId', stringListEquipoId);
                data.append('stringListFotosArchivoId', stringListFotosArchivoId);
                data.append('stringListFotosEquipoId', stringListFotosEquipoId);
                data.append('actaRecepcionArchivoId', $('#divInsertIngreso_Documentos_idActaRecepcion').text());
                if ($('#divInsertIngreso_Documentos_idGuiaDespacho').text().length > 0)
                {
                    data.append('guiaDespachoArchivoId', $('#divInsertIngreso_Documentos_idGuiaDespacho').text());
                }

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/insertIngreso_JSON",
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

                                        clearForm_InsertIngreso();
                                        $("#divInsertIngreso").hide();
                                        loadIngreso_loadDTIngreso_Equipo(false);
                                        $("#divListIngreso_Equipo").show();

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

        function clearForm_InsertIngreso()
        {
            clearForm_InsertIngreso_Cliente();
            clearForm_InsertIngreso_Recepcion();
            clearForm_InsertIngreso_Equipos();
            clearForm_InsertIngreso_Documentos();
        }

        function validateForm_InsertIngreso()
        {

            if(validateForm_InsertIngreso_Cliente() === false)
            {
                divInsertIngreso_goTabCliente(0);

                return false;
            }
            else if (validateForm_InsertIngreso_Recepcion() === false)
            {
                divInsertIngreso_goTabRecepcion(0);

                return false;
            }
            else if (validateForm_InsertIngreso_Equipos() === false)
            {
                divInsertIngreso_goTabEquipos(0);

                return false;
            }
            else if (validateForm_InsertIngreso_Documentos() === false)
            {
                divInsertIngreso_goTabDocumentos(0);

                return false;
            }

            return true;
        }

        function clearForm_InsertIngreso_Documentos()
        {
            $('.requiredText').hide();

            $('#divInsertIngreso_Documentos_fuActaRecepcion').val('');
            $('#divInsertIngreso_Documentos_idActaRecepcion').text('');
            $('#divInsertIngreso_Documentos_fnActaRecepcion').text('No se ha cargado el archivo');
            $('#divInsertIngreso_Documentos_fuGuiaDespacho').val('');
            $('#divInsertIngreso_Documentos_idGuiaDespacho').text('');
            $('#divInsertIngreso_Documentos_fnGuiaDespacho').text('No se ha cargado el archivo');
            $('#divInsertIngreso_btClearFile_GuiaDespacho').attr('disabled', 'true');
        }

        function validateForm_InsertIngreso_Documentos()
        {
            $('.requiredText').hide();

            var valid = true;
            if ($('#divInsertIngreso_Documentos_idActaRecepcion').text() === '')
            {
                $('#divInsertIngreso_Documentos_vfActaRecepcion').show();
                valid = false;
            }

            return valid;
        }

        function clearForm_InsertIngreso_Equipos()
        {
            $('.requiredText').hide();

            $('#tbInsertIngreso_Equipos > tbody > tr').remove();

            var emptyRow = '<tr>'
                         + '    <td colspan="7" style="text-align:center;">'
                         + '        <label>No hay elementos cargados en la lista</label>'
                         + '    </td>'
                         + '</tr>';

            $('#tbInsertIngreso_Equipos > tbody').append(emptyRow);

            $('#tbInsertIngreso_Fotos > tbody > tr').remove();

            var emptyRow = '<tr>'
                         + '    <td colspan="3" style="text-align:center;">'
                         + '        <label>No hay elementos cargados en la lista</label>'
                         + '    </td>'
                         + '</tr>';

            $('#tbInsertIngreso_Fotos > tbody').append(emptyRow);
        }

        function isEmpty_tbInsertIngreso_Equipos()
        {
            var rowsEquipo = $('#tbInsertIngreso_Equipos > tbody > tr');
            if(rowsEquipo.length > 1)
            {
                return false;
            }
            else if(rowsEquipo.length === 1)
            {
                var colsEquipo = $(rowsEquipo[0]).find('td');
                if(colsEquipo.length > 1)
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

        function validateForm_InsertIngreso_Equipos()
        {
            $('.requiredText').hide();

            var isEmpty_Equipos = isEmpty_tbInsertIngreso_Equipos();

            var valid = true;

            if (isEmpty_Equipos)
            {
                $('#divInsertIngreso_Equipo_vfEquipos').show();

                valid = false;
            }

            var rowCount = $('#tbInsertIngreso_Fotos > tbody > tr').length;
            if (rowCount < 1)
            {
                $('#divInsertIngreso_Equipos_vfFotos').show();
                valid = false;
            }
            else if (rowCount === 1)
            {
                var colCount = $($($('#tbInsertIngreso_Fotos > tbody > tr')[0]).find('td')).length;
                if (colCount < 2)
                {
                    $('#divInsertIngreso_Equipos_vfFotos').show();
                    valid = false;
                }
            }

            return valid;
        }

        function clearForm_InsertIngreso_Recepcion()
        {
            $('.requiredText').hide();

            $('#<%= txtInsertIngreso_Recepcion_NumeroRecepcion.ClientID %>').val("");
            $('#<%= ddlInsertIngreso_RecepcionadoPor.ClientID %> > option').remove();
            $('#<%= txtInsertIngreso_Recepcion_FechaRecepcion.ClientID %>').val("");
            $('#<%= txtInsertIngreso_Recepcion_Observaciones.ClientID %>').val("");
        }

        function validateForm_InsertIngreso_Recepcion()
        {
            $('.requiredText').hide();

            var numeroRecepcion = $('#<%= txtInsertIngreso_Recepcion_NumeroRecepcion.ClientID %>').val();
            var recepcionadoPor = $('#<%= ddlInsertIngreso_RecepcionadoPor.ClientID %>').val();
            var fechaRecepcion = $('#<%= txtInsertIngreso_Recepcion_FechaRecepcion.ClientID %>').val();
            var observaciones = $('#<%= txtInsertIngreso_Recepcion_Observaciones.ClientID %>').val();

            var valid = true;

            if (numeroRecepcion.length < 1)
            {
                $('#divInsertIngreso_Recepcion_vfNumeroRecepcion').show();

                valid = false;
            }

            if (recepcionadoPor.length < 1)
            {
                $('#divInsertIngreso_Recepcion_vfRecepcionadoPor').show();

                valid = false;
            }

            if (fechaRecepcion.length < 1)
            {
                $('#divInsertIngreso_Recepcion_vfFechaRecepcion').show();

                valid = false;
            }

            return valid;
        }

        function clearForm_InsertIngreso_Cliente()
        {
            $('.requiredText').hide();

            $('#<%= ddlInsertIngreso_Empresa.ClientID %> > option').remove();
            $('#<%= ddlInsertIngreso_Contacto.ClientID %> > option').remove();
        }

        function validateForm_InsertIngreso_Cliente()
        {
            $('.requiredText').hide();

            var empresa = $('#<%= ddlInsertIngreso_Empresa.ClientID %>').val();
            var contacto = $('#<%= ddlInsertIngreso_Contacto.ClientID %>').val();

            var valid = true;

            if (empresa.length < 1)
            {
                $('#divInsertIngreso_Cliente_vfEmpresa').show();

                valid = false;
            }
            else if (contacto.length < 1)
            {
                $('#divInsertIngreso_Cliente_vfContacto').show();

                valid = false;
            }

            return valid;
        }

        function clearForm_InsertIngreso_EquipoSelect()
        {
            $('.requiredText').hide();

            $('#ddlInsertIngreso_Equipo').val('');
        }

        function validateForm_InsertIngreso_EquipoSelect()
        {
            $('.requiredText').hide();

            var equipo = $('#ddlInsertIngreso_Equipo').val();

            var valid = true;

            if (equipo.length < 1)
            {
                $('#divInsertIngreso_Equipo_vfEquipo').show();

                valid = false;
            }

            return valid;
        }

        function insertIngreso_Documentos_tryUploadFile(file, type)
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

                                default: //SUCCESS
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

                                        if (type === 0)
                                        {
                                            $('#divInsertIngreso_Documentos_idActaRecepcion').text(statusCode);
                                            $('#divInsertIngreso_Documentos_fnActaRecepcion').text(file.name);
                                        }
                                        else if(type === 1)
                                        {
                                            $('#divInsertIngreso_Documentos_idGuiaDespacho').text(statusCode);
                                            $('#divInsertIngreso_Documentos_fnGuiaDespacho').text(file.name);
                                            $('#divInsertIngreso_btClearFile_GuiaDespacho').removeAttr('disabled');
                                        }

                                        break;
                                    }
                            }
                        }
                    }
            );
        }

        function insertIngreso_loadDDLContacto()
        {
            $("#<%= ddlInsertIngreso_Contacto.ClientID %>").find('option').remove();
            $("#<%= ddlInsertIngreso_Contacto.ClientID %>").append('<option value="">Seleccione..</option>');

            var empresa_id = $("#<%= ddlInsertIngreso_Empresa.ClientID %>").val();

            if (empresa_id.length > 0)
            {
                $.post(
                    '../service/WSTaller.asmx/getHeaderListContacto_JSON',
                    {
                        empresa_id: empresa_id
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
                                    console.log(data);
                                    for (var i = 0; i < data.length; i++)
                                    {
                                        $("#<%= ddlInsertIngreso_Contacto.ClientID %>").append('<option value="' + data[i].id + '">' + data[i].nombre + '</option>');
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
        }

        function tbInsertIngreso_Equipos_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR EQUIPO',
                    content: '¿Realmente deseas eliminar el equipo #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        insertIngreso_removeEquipo(id);
                    }
                }
            );
        }

        function insertIngreso_removeEquipo(id)
        {
            var rowsFotos = $('#tbInsertIngreso_Fotos > tbody > tr');
            for(var i=0; i<rowsFotos.length; i++)
            {
                var columns = $(rowsFotos[i]).find('td');
                if($(columns[2]).text() == id)
                {
                    $(rowsFotos[i]).remove();
                }
            }

            if ($('#tbInsertIngreso_Fotos > tbody > tr').length < 1)
            {
                var emptyRow = '<tr>'
                                + '    <td colspan="3" style="text-align:center;">'
                                + '        <label>No hay elementos cargados en la lista</label>'
                                + '    </td>'
                                + '</tr>';

                $('#tbInsertIngreso_Fotos > tbody').append(emptyRow);
            }

            $('#tbInsertIngreso_Equipos > tbody > tr').each(
                function ()
                {
                    var columns = $(this).find('td');

                    if ($(columns[0]).html() === id.toString())
                    {
                        $(this).remove();

                        if ($('#tbInsertIngreso_Equipos > tbody > tr').length < 1)
                        {
                            var emptyRow = '<tr>'
                                            + '    <td colspan="7" style="text-align:center;">'
                                            + '        <label>No hay elementos cargados en la lista</label>'
                                            + '    </td>'
                                            + '</tr>';

                            $('#tbInsertIngreso_Equipos > tbody').append(emptyRow);
                        }
                    }
                }
            );
        }

        function tbInsertIngreso_Equipos_isEmpty()
        {
            var rowCount = $('#tbInsertIngreso_Equipos > tbody > tr').length;
            if (rowCount === 0)
            {
                return true;
            }
            else if(rowCount === 1)
            {
                var firstRow = $('#tbInsertIngreso_Equipos > tbody > tr')[0];
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

        function tbInsertIngreso_Equipos_isItemInTable(id)
        {
            var rows = $('#tbInsertIngreso_Equipos > tbody > tr');

            for(var i=0; i<rows.length; i++)
            {
                var columns = $(rows[i]).find('td');

                if($(columns[0]).html() === id.toString())
                {
                    return true;
                }
            }

            return false;
        }

        function insertIngreso_EquipoSelect_Success()
        {
            //ADD EQUIPO
            var validForm = validateForm_InsertIngreso_EquipoSelect();

            if (validForm === true)
            {
                var id = $('#ddlInsertIngreso_Equipo').val();

                $.post(
                    '../service/WSTaller.asmx/getInfoEquipo_JSON',
                    {
                        id : id
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

                                    if (data.length > 0)
                                    {
                                        if (tbInsertIngreso_Equipos_isEmpty())
                                        {
                                            $('#tbInsertIngreso_Equipos > tbody > tr').remove();
                                        }

                                        var equipo = data[0];

                                        if (tbInsertIngreso_Equipos_isItemInTable(equipo.id) === false)
                                        {
                                            var row = ' <tr>'
                                                    + '     <td style="text-align: center;">' + equipo.id + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.sap + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.cod + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.nombre + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.tipo + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.modelo + '</td>'
                                                    + '     <td align="center">'
                                                    + '         <a class="btn btn-default" href="javascript:insertIngreso_Fotos_addFoto(' + equipo.id + ');">Agregar foto</a>'
                                                    + '         <a class="btn btn-danger" href="javascript:tbInsertIngreso_Equipos_removeItem(' + equipo.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                            $('#tbInsertIngreso_Equipos > tbody').append(row);
                                        }
                                        else
                                        {
                                            $.alert(
		                                            {
		                                                icon: 'fa fa-info',
		                                                title: 'INFORMACIÓN',
		                                                content: 'El equipo seleccionado ya está en la lista',
		                                                confirmButton: 'Cerrar'
		                                            }
                                            );
                                        }

                                        clearForm_InsertIngreso_EquipoSelect();

                                        $("#divInsertIngreso_EquiposSelect").hide();
                                        $("#divInsertIngreso_EquiposList").show();
                                    }
                                    else
                                    {
                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'ERROR',
		                                            content: 'No se ha encontrado un equipo con el código sap ingresado',
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
		                            content: 'Se ha producido un error al recuperar la información del equipo',
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

        function insertIngreso_Equipo_tryRemoveFoto(id)
        {
            var data = new FormData();

            data.append('archivo_id', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removeArchivo_JSON",
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

                                        var rows = $('#tbInsertIngreso_Fotos > tbody > tr');
                                        for (var i = 0; i < rows.length; i++)
                                        {
                                            var columns = $(rows[i]).find('td');
                                            if($(columns[0]).text() == id)
                                            {
                                                $(rows[i]).remove();

                                                break;
                                            }
                                        }

                                        var rowCount = $('#tbInsertIngreso_Fotos > tbody > tr').length;
                                        if (rowCount < 1)
                                        {
                                            var emptyRow = '<tr>'
                                                            + '    <td colspan="3" style="text-align:center;">'
                                                            + '        <label>No hay elementos cargados en la lista</label>'
                                                            + '    </td>'
                                                            + '</tr>';

                                            $('#tbInsertIngreso_Fotos > tbody').append(emptyRow);
                                        }

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

        function tbInsertIngreso_Fotos_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR ARCHIVO',
                    content: '¿Realmente deseas eliminar el archivo?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        insertIngreso_Equipo_tryRemoveFoto(id);
                    }
                }
            );
        }

        function insertIngreso_Equipo_tryUploadFoto(file, equipo_id)
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

                                default: //SUCCESS
                                    {
                                        var msg = responseJson['msg'];

                                        /*
                                        $.alert(
		                                        {
		                                            icon: 'fa fa-check',
		                                            title: 'REALIZADO',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );
                                        */

                                        if ($('#tbInsertIngreso_Fotos > tbody > tr').length > 0)
                                        {
                                            if($($('#tbInsertIngreso_Fotos > tbody > tr').get(0)).find('td').length < 2)
                                            {
                                                $('#tbInsertIngreso_Fotos > tbody > tr').remove();
                                            }
                                        }

                                        var row = ' <tr>'
                                                    + '     <td style="display: none;">' + statusCode + '</td>'
                                                    + '     <td style="text-align: center;">' + file.name + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo_id + '</td>'
                                                    + '     <td align="center">'
                                                    + '         <a class="btn btn-danger" href="javascript:tbInsertIngreso_Fotos_removeItem(' + statusCode + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                        $('#tbInsertIngreso_Fotos > tbody').append(row);

                                        $('#divInsertIngreso_Equipos_vfFotos').hide();

                                        break;
                                    }
                            }
                        }
                    }
            );
        }


        function insertIngreso_Fotos_addFoto(equipo_id)
        {
            $('#divInsertIngreso_Fotos_fuFile').unbind("change");

            $('#divInsertIngreso_Fotos_fuFile').change(
                function ()
                {
                    if ($(this).get(0).files.length > 0)
                    {

                        var file = $(this).get(0).files[0];
                        insertIngreso_Equipo_tryUploadFoto(file, equipo_id);
                    }
                }
            );

            $('#divInsertIngreso_Fotos_fuFile').click();
        }

        function insertIngreso_EquipoSelect_Cancel()
        {
            clearForm_InsertIngreso_EquipoSelect();

            $("#divInsertIngreso_EquiposSelect").hide();
            $("#divInsertIngreso_EquiposList").show();
        }

        function showInsertIngreso_EquipoAdd()
        {
            $('.requiredText').hide();

            $("#divInsertIngreso_EquiposList").hide();
            $("#divInsertIngreso_EquiposNew").hide();
            $("#divInsertIngreso_EquiposSelect").show();
        }

        function divInsertIngreso_goTabCliente(direction)
        {
            $("#divInsertIngreso_tabCliente").click();
        }

        function divInsertIngreso_goTabRecepcion(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_InsertIngreso_Cliente();

                if (validForm === true)
                {
                    $("#divInsertIngreso_tabRecepcion").click();
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
                $("#divInsertIngreso_tabRecepcion").click();
            }
        }

        function divInsertIngreso_goTabEquipos(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_InsertIngreso_Recepcion();
                
                if(validForm === true)
                {
                    $("#divInsertIngreso_tabEquipos").click();
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
                $("#divInsertIngreso_tabEquipos").click();
            }  
        }

        function divInsertIngreso_goTabDocumentos(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_InsertIngreso_Equipos();

                if (validForm === true)
                {
                    $("#divInsertIngreso_tabDocumentos").click();
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
                $("#divInsertIngreso_tabDocumentos").click();
            }
        }

        function cancelInsertIngreso()
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'REGISTRAR INGRESO',
                    content: 'Se perder&aacute;n todos los datos no guardados. ¿Desea continuar?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        $("#divInsertIngreso").hide();
                        $("#divListIngreso_Equipo").show();
                    }
                }
            );
        }

        function showInsertIngreso()
        {
            $("#divDetailIngreso").hide();
            $("#divUpdateIngreso").hide();
            $("#divInsertPresupuesto").hide();
            $("#divListIngreso_Equipo").hide();

            insertIngreso_prepareForm();
        }

        function insertIngreso_prepareForm()
        {
            clearForm_InsertIngreso();

            var data = new FormData();

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/getFormElements_TallerIngreso_JSON",
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
                                        var data = responseJson['data'];

                                        {
                                            var tbEmpresa = data['Empresa'];

                                            $("#<%= ddlInsertIngreso_Empresa.ClientID %>").append('<option value="">Seleccione..</option>'); 
                                            for (var i = 0; i < tbEmpresa.length; i++)
                                            {
                                                var empresa = tbEmpresa[i];

                                                $("#<%= ddlInsertIngreso_Empresa.ClientID %>").append('<option value="' + empresa.id + '">' + empresa.nombre + '</option>');
                                            }
                                        }

                                        {
                                            $("#<%= ddlInsertIngreso_Contacto.ClientID %>").append('<option value="">Seleccione..</option>');
                                        }

                                        {
                                            var tbTrabajador = data['Trabajador'];

                                            $("#<%= ddlInsertIngreso_RecepcionadoPor.ClientID %>").append('<option value="">Seleccione..</option>');
                                            for (var i = 0; i < tbTrabajador.length; i++)
                                            {
                                                var trabajador = tbTrabajador[i];

                                                $("#<%= ddlInsertIngreso_RecepcionadoPor.ClientID %>").append('<option value="' + trabajador.id + '">' + trabajador.nombre + '</option>');
                                            }
                                        }


                                        $("#divInsertIngreso").show();
                                        divInsertIngreso_goTabCliente(0);

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
        *   L I S T  I N G R E S O
        *
        */

        function loadIngreso_addRow
        (
            talleringreso_id,
            equipo_id,
            talleringreso_empresa,
            talleringreso_contacto,
            talleringreso_numeroRecepcion,
            talleringreso_fechaRecepcion,
            optionDetail,
            optionEdit,
            optionPresupuesto
        )
        {
                var buttonIcon = document.createElement('i');
                buttonIcon.className = 'fa fa-search';
                var detailButton = document.createElement('a');
                detailButton.className = 'btn btn-success';
                detailButton.style = 'margin-right: 2px;';
                detailButton.title = 'Ver detalle';
                $(detailButton).append($(buttonIcon));

                var buttonIcon = document.createElement('i');
                buttonIcon.className = 'fa fa-pencil';
                var editButton = document.createElement('a');
                editButton.className = 'btn btn-warning';
                editButton.style = 'margin-right: 2px;';
                editButton.title = 'Editar';
                $(editButton).append($(buttonIcon));

                var buttonIcon = document.createElement('i');
                buttonIcon.className = 'fa fa-usd';
                var presupuestoButton = document.createElement('a');
                presupuestoButton.className = 'btn btn-default';
                presupuestoButton.title = 'Ingresar presupuesto';
                $(presupuestoButton).append($(buttonIcon));

                if (optionDetail === false)
                {
                    detailButton.classList.add('disabled');
                }

                if (optionEdit === false)
                {
                    editButton.classList.add('disabled');
                }

                if (optionPresupuesto === false)
                {
                    presupuestoButton.classList.add('disabled');
                }

                var options = detailButton.outerHTML + editButton.outerHTML + presupuestoButton.outerHTML;

                dtIngreso_Equipo.row.add(
                                [
                                    talleringreso_id,
                                    equipo_id,
                                    talleringreso_empresa,
                                    talleringreso_contacto,
                                    talleringreso_numeroRecepcion,
                                    talleringreso_fechaRecepcion,
                                    options
                                ]
                ).draw(false);
        }

        function loadIngreso_loadDTIngreso_Equipo()
        {
            $.post(
                '../service/WSTaller.asmx/getHeaderListTallerIngreso_Equipo_JSON',
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

                                dtIngreso_Equipo.clear().draw(false);

                                for (var i = 0; i < data.length; i++)
                                {
                                    var ingreso_equipo = data[i];

                                    loadIngreso_addRow(
                                        ingreso_equipo.talleringreso_id,
                                        ingreso_equipo.equipo_id,
                                        ingreso_equipo.talleringreso_empresa,
                                        ingreso_equipo.talleringreso_contacto,
                                        ingreso_equipo.talleringreso_numeroRecepcion,
                                        ingreso_equipo.talleringreso_fechaRecepcion,
                                        true,
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
                function (response) {
                    //JQUERY ERROR
                }
            );
        }
        

        /*
        *
        *   D E T A I L  I N G R E S O
        *
        */

        function tbIngresoEquipo_detailItem(id)
        {
            $.post(
                '../service/WSTaller.asmx/getInfoTallerIngreso_JSON',
                {
                    talleringreso_id: id
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

                                //TallerIngreso
                                {
                                    var tbTallerIngreso = data['TallerIngreso'];

                                    $('#divDetailIngreso_lbTitulo').text(tbTallerIngreso['id']);
                                    $('#divDetailIngreso_lbEmpresa').text(tbTallerIngreso['empresa_nombre']);
                                    $('#divDetailIngreso_lbContacto').text(tbTallerIngreso['contacto_nombre']);
                                    $('#divDetailIngreso_lbNumeroRecepcion').text(tbTallerIngreso['numeroRecepcion']);
                                    $('#divDetailIngreso_lbRecepcionadoPor').text(tbTallerIngreso['recepcionadoPor_nombre']);
                                    $('#divDetailIngreso_lbFechaRecepcion').text(tbTallerIngreso['fechaRecepcion']);
                                    $('#divDetailIngreso_lbFechaRegistro').text(tbTallerIngreso['fechaRegistro']);
                                    $('#divDetailIngreso_lbObservaciones').text(tbTallerIngreso['observaciones']);
                                    
                                }

                                //Equipos
                                {
                                    $('#tbDetailIngreso_Equipos > tbody > tr').remove();

                                    var tbEquipo = data['Equipo'];

                                    for(var i=0; i<tbEquipo.length; i++)
                                    {
                                        var equipo = tbEquipo[i];
                                        var sap = "";
                                        var cod = "";
                                        var nombre = "";
                                        var tipo = "";
                                        var modelo = "";

                                        if (equipo['sap'] !== null)
                                        {
                                            sap = equipo.sap;
                                        }

                                        if (equipo['cod'] !== null)
                                        {
                                            cod = equipo.cod;
                                        }

                                        if (equipo['nombre'] !== null)
                                        {
                                            nombre = equipo.nombre;
                                        }

                                        if (equipo['tipo'] !== null)
                                        {
                                            tipo = equipo.tipo;
                                        }

                                        if (equipo['modelo'] !== null)
                                        {
                                            modelo = equipo.modelo;
                                        }

                                        var newRow = '<tr>'
                                                   + '  <td style="text-align: center;">' + equipo.id + '</td>'
                                                   + '  <td style="text-align: center;">' + sap + '</td>'
                                                   + '  <td style="text-align: center;">' + cod + '</td>'
                                                   + '  <td style="text-align: center;">' + nombre + '</td>'
                                                   + '  <td style="text-align: center;">' + tipo + '</td>'
                                                   + '  <td style="text-align: center;">' + modelo + '</td>'
                                                   + '  <td style="text-align: center;"></td>'
                                                   + '</tr>'

                                        $('#tbDetailIngreso_Equipos > tbody').append(newRow);
                                    }
                                }

                                //Fotos
                                {
                                    var rowsEquipo = $('#tbDetailIngreso_Equipos > tbody > tr');
                                    var tbFoto = data['Foto'];

                                    for (var i = 0; i < tbFoto.length; i++)
                                    {
                                        var foto = tbFoto[i];

                                        var linkFoto = document.createElement("a");
                                        linkFoto.href = 'javascript:downloadFile(' + foto.archivo_id + ');';
                                        linkFoto.text = foto.archivo_nombre;

                                        for(var j=0; j<rowsEquipo.length; j++)
                                        {
                                            var colsEquipo = $(rowsEquipo[j]).find('td');
                                            var equipo_id = parseInt($(colsEquipo[0]).text());
                                            if (equipo_id == foto.equipo_id)
                                            {
                                                $(colsEquipo[6]).append(linkFoto);
                                                $(colsEquipo[6]).append('<br />');
                                            }
                                        }
                                    }
                                }

                                //Documentos
                                {
                                    var tbDocumento = data['Documento'];

                                    for (var i = 0; i < tbDocumento.length; i++)
                                    {
                                        var documento = tbDocumento[i];

                                        var tipoDocumento;

                                        if (documento.archivo_tipoArchivo === "ActaRecepcion")
                                        {
                                            tipoDocumento = "Acta de recepción";
                                        }
                                        else if (documento.archivo_tipoArchivo === "GuiaDespacho")
                                        {
                                            tipoDocumento = "Guía de despacho";
                                        }
                                   
                                        var newRow = '<tr>'
                                                   + '  <td style="text-align: center;">' + documento.archivo_nombre + '</td>'
                                                   + '  <td style="text-align: center;">' + documento.archivo_longitud + ' bytes</td>'
                                                   + '  <td style="text-align: center;">' + documento.archivo_tipoContenido + '</td>'
                                                   + '  <td style="text-align: center;">' + tipoDocumento + '</td>'
                                                   + '  <td align="center">'
                                                   + '      <a class="btn btn-primary" href="javascript:downloadFile(' + documento.archivo_id + ');" title="Descargar"><i class="fa fa-download"></i></a>'
                                                   + '  </td>'
                                                   + '</tr>'

                                        $('#tbDetailIngreso_Documentos > tbody').append(newRow);
                                    }
                                }

                                $("#divListIngreso_Equipo").hide();
                                $("#divDetailIngreso").show();

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
		                        content: 'Se ha producido un error al recuperar la información del equipo',
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

        function clearForm_DetailIngreso()
        {
            $('#divDetailIngreso_lbTitulo').text('');
            $('#divDetailIngreso_lbEmpresa').text('');
            $('#divDetailIngreso_lbContacto').text('');
            $('#divDetailIngreso_lbNumeroRecepcion').text('');
            $('#divDetailIngreso_lbRecepcionadoPor').text('');
            $('#divDetailIngreso_lbFechaRecepcion').text('');
            $('#divDetailIngreso_lbFechaRegistro').text('');
            $('#divDetailIngreso_lbObservaciones').text('');

            $('#tbDetailIngreso_Equipos > tbody > tr').remove();

            $('#tbDetailIngreso_Equipos > tbody > tr').remove();
             
            $('#tbDetailIngreso_Documentos > tbody > tr').remove();
        }

        function cancelDetailIngreso()
        {
            clearForm_DetailIngreso();
            $("#divDetailIngreso").hide();
            $("#divListIngreso_Equipo").show();
        }


        /*
        *
        *   E D I T  I N G R E S O
        *
        */

        function tryUpdateIngreso()
        {
            validForm = validateForm_UpdateIngreso();

            if (validForm === true)
            {
                var stringListEquipoId = "";
                var rowsEquipo = $('#tbUpdateIngreso_Equipos > tbody > tr');

                for (var i = 0; i < rowsEquipo.length; i++)
                {
                    var colsEquipo = $(rowsEquipo[i]).find('td');
                    var equipo_id = $(colsEquipo[0]).text();

                    stringListEquipoId += equipo_id;
                    if (i < rowsEquipo.length - 1)
                    {
                        stringListEquipoId += ',';
                    }
                }


                var stringListFotosArchivoId = "";
                var stringListFotosEquipoId = "";
                var rowsFoto = $('#tbUpdateIngreso_Fotos > tbody > tr');

                for (var i = 0; i < rowsFoto.length; i++)
                {
                    var colsFoto = $(rowsFoto[i]).find('td');

                    if (colsFoto.length > 2)
                    {
                        var archivo_id = $(colsFoto[0]).text();
                        var equipo_id = $(colsFoto[2]).text();

                        stringListFotosArchivoId += archivo_id;
                        stringListFotosEquipoId += equipo_id;
                        if (i < rowsFoto.length - 1)
                        {
                            stringListFotosArchivoId += ',';
                            stringListFotosEquipoId += ',';
                        }
                    }
                }

                var data = new FormData();

                data.append('id', $('#divUpdateIngreso_lbTitulo').text());
                data.append('numeroRecepcion', $("#<%= txtUpdateIngreso_Recepcion_NumeroRecepcion.ClientID %>").val());
                data.append('recepcionadoPor', $("#<%= ddlUpdateIngreso_RecepcionadoPor.ClientID %>").val());
                data.append('fechaRecepcion', $("#<%= txtUpdateIngreso_Recepcion_FechaRecepcion.ClientID %>").val());
                data.append('observaciones', $("#<%= txtUpdateIngreso_Recepcion_Observaciones.ClientID %>").val());
                data.append('contacto_id', $("#<%= ddlUpdateIngreso_Contacto.ClientID %>").val());
                data.append('stringListEquipoId', stringListEquipoId);
                data.append('stringListFotosArchivoId', stringListFotosArchivoId);
                data.append('stringListFotosEquipoId', stringListFotosEquipoId);
                data.append('actaRecepcionArchivoId', $('#divUpdateIngreso_Documentos_idActaRecepcion').text());
                if ($('#divUpdateIngreso_Documentos_idGuiaDespacho').text().length > 0)
                {
                    data.append('guiaDespachoArchivoId', $('#divUpdateIngreso_Documentos_idGuiaDespacho').text());
                }

                $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/updateIngreso_JSON",
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
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        clearForm_UpdateIngreso();
                                        $("#divUpdateIngreso").hide();
                                        loadIngreso_loadDTIngreso_Equipo(false);
                                        $("#divListIngreso_Equipo").show();

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

        function clearForm_UpdateIngreso()
        {
            clearForm_UpdateIngreso_Cliente();
            clearForm_UpdateIngreso_Recepcion();
            clearForm_UpdateIngreso_Equipos();
            clearForm_UpdateIngreso_Documentos();
        }

        function validateForm_UpdateIngreso()
        {

            if (validateForm_UpdateIngreso_Cliente() === false)
            {
                divUpdateIngreso_goTabCliente(0);

                return false;
            }
            else if (validateForm_UpdateIngreso_Recepcion() === false)
            {
                divUpdateIngreso_goTabRecepcion(0);

                return false;
            }
            else if (validateForm_UpdateIngreso_Equipos() === false)
            {
                divUpdateIngreso_goTabEquipos(0);

                return false;
            }
            else if (validateForm_UpdateIngreso_Documentos() === false)
            {
                divUpdateIngreso_goTabDocumentos(0);

                return false;
            }

            return true;
        }

        function clearForm_UpdateIngreso_Documentos()
        {
            $('.requiredText').hide();

            $('#divUpdateIngreso_Documentos_fuActaRecepcion').val('');
            $('#divUpdateIngreso_Documentos_idActaRecepcion').text('');
            $('#divUpdateIngreso_Documentos_fnActaRecepcion').text('No se ha cargado el archivo');
            $('#divUpdateIngreso_Documentos_fuGuiaDespacho').val('');
            $('#divUpdateIngreso_Documentos_idGuiaDespacho').text('');
            $('#divUpdateIngreso_Documentos_fnGuiaDespacho').text('No se ha cargado el archivo');
            $('#divUpdateIngreso_btClearFile_GuiaDespacho').attr('disabled', 'true');
        }

        function validateForm_UpdateIngreso_Documentos()
        {
            $('.requiredText').hide();

            var valid = true;

            if ($('#divUpdateIngreso_Documentos_idActaRecepcion').text() === '')
            {
                $('#divUpdateIngreso_Documentos_vfActaRecepcion').show();
                valid = false;
            }

            return valid;
        }

        function clearForm_UpdateIngreso_Equipos()
        {
            $('.requiredText').hide();

            $('#tbUpdateIngreso_Equipos > tbody > tr').remove();

            var emptyRow = '<tr>'
                         + '    <td colspan="7" style="text-align:center;">'
                         + '        <label>No hay elementos cargados en la lista</label>'
                         + '    </td>'
                         + '</tr>';

            $('#tbUpdateIngreso_Equipos > tbody').append(emptyRow);

            $('#tbUpdateIngreso_Fotos > tbody > tr').remove();

            var emptyRow = '<tr>'
                         + '    <td colspan="3" style="text-align:center;">'
                         + '        <label>No hay elementos cargados en la lista</label>'
                         + '    </td>'
                         + '</tr>';

            $('#tbUpdateIngreso_Fotos > tbody').append(emptyRow);
        }

        function isEmpty_tbUpdateIngreso_Equipos()
        {
            var rowsEquipo = $('#tbUpdateIngreso_Equipos > tbody > tr');
            if (rowsEquipo.length > 1)
            {
                return false;
            }
            else if (rowsEquipo.length === 1)
            {
                var colsEquipo = $(rowsEquipo[0]).find('td');
                if (colsEquipo.length > 1)
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

        function validateForm_UpdateIngreso_Equipos()
        {
            $('.requiredText').hide();

            var isEmpty_Equipos = isEmpty_tbUpdateIngreso_Equipos();

            var valid = true;

            if (isEmpty_Equipos)
            {
                $('#divUpdateIngreso_Equipo_vfEquipos').show();

                valid = false;
            }

            var rowCount = $('#tbUpdateIngreso_Fotos > tbody > tr').length;
            if (rowCount < 1)
            {
                $('#divUpdateIngreso_Equipos_vfFotos').show();
                valid = false;
            }
            else if (rowCount === 1)
            {
                var colCount = $($($('#tbUpdateIngreso_Fotos > tbody > tr')[0]).find('td')).length;
                if (colCount < 2)
                {
                    $('#divUpdateIngreso_Equipos_vfFotos').show();
                    valid = false;
                }
            }

            return valid;
        }

        function clearForm_UpdateIngreso_Recepcion()
        {
            $('.requiredText').hide();

            $('#<%= txtUpdateIngreso_Recepcion_NumeroRecepcion.ClientID %>').val("");
            $('#<%= ddlUpdateIngreso_RecepcionadoPor.ClientID %> > option').remove();
            $('#<%= txtUpdateIngreso_Recepcion_FechaRecepcion.ClientID %>').val("");
            $('#<%= txtUpdateIngreso_Recepcion_Observaciones.ClientID %>').val("");
        }

        function validateForm_UpdateIngreso_Recepcion()
        {
            $('.requiredText').hide();

            var numeroRecepcion = $('#<%= txtUpdateIngreso_Recepcion_NumeroRecepcion.ClientID %>').val();
            var recepcionadoPor = $('#<%= ddlUpdateIngreso_RecepcionadoPor.ClientID %>').val();
            var fechaRecepcion = $('#<%= txtUpdateIngreso_Recepcion_FechaRecepcion.ClientID %>').val();
            var observaciones = $('#<%= txtUpdateIngreso_Recepcion_Observaciones.ClientID %>').val();

            var valid = true;

            if (numeroRecepcion.length < 1)
            {
                $('#divUpdateIngreso_Recepcion_vfNumeroRecepcion').show();

                valid = false;
            }

            if (recepcionadoPor.length < 1)
            {
                $('#divUpdateIngreso_Recepcion_vfRecepcionadoPor').show();

                valid = false;
            }

            if (fechaRecepcion.length < 1)
            {
                $('#divUpdateIngreso_Recepcion_vfFechaRecepcion').show();

                valid = false;
            }

            return valid;
        }

        function clearForm_UpdateIngreso_Cliente()
        {
            $('.requiredText').hide();

            $('#<%= ddlUpdateIngreso_Empresa.ClientID %> > option').remove();
            $('#<%= ddlUpdateIngreso_Contacto.ClientID %> > option').remove();
        }

        function validateForm_UpdateIngreso_Cliente()
        {
            $('.requiredText').hide();

            var empresa = $('#<%= ddlUpdateIngreso_Empresa.ClientID %>').val();
            var contacto = $('#<%= ddlUpdateIngreso_Contacto.ClientID %>').val();

            var valid = true;

            if (empresa.length < 1)
            {
                $('#divUpdateIngreso_Cliente_vfEmpresa').show();

                valid = false;
            }
            else if (contacto.length < 1)
            {
                $('#divUpdateIngreso_Cliente_vfContacto').show();

                valid = false;
            }

            return valid;
        }

        function tbUpdateIngreso_Equipos_removeItem(id)
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR EQUIPO',
                    content: '¿Realmente deseas eliminar el equipo #' + id + '?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        updateIngreso_removeEquipo(id);
                    }
                }
            );
        }

        function updateIngreso_removeEquipo(id)
        {
            var rowsFotos = $('#tbUpdateIngreso_Fotos > tbody > tr');
            for (var i = 0; i < rowsFotos.length; i++)
            {
                var columns = $(rowsFotos[i]).find('td');
                if ($(columns[2]).text() == id)
                {
                    $(rowsFotos[i]).remove();
                }
            }

            if ($('#tbUpdateIngreso_Fotos > tbody > tr').length < 1)
            {
                var emptyRow = '<tr>'
                                + '    <td colspan="3" style="text-align:center;">'
                                + '        <label>No hay elementos cargados en la lista</label>'
                                + '    </td>'
                                + '</tr>';

                $('#tbUpdateIngreso_Fotos > tbody').append(emptyRow);
            }

            $('#tbUpdateIngreso_Equipos > tbody > tr').each(
                function ()
                {
                    var columns = $(this).find('td');

                    if ($(columns[0]).html() === id.toString())
                    {
                        $(this).remove();

                        if ($('#tbUpdateIngreso_Equipos > tbody > tr').length < 1)
                        {
                            var emptyRow = '<tr>'
                                            + '    <td colspan="7" style="text-align:center;">'
                                            + '        <label>No hay elementos cargados en la lista</label>'
                                            + '    </td>'
                                            + '</tr>';

                            $('#tbUpdateIngreso_Equipos > tbody').append(emptyRow);
                        }
                    }
                }
            );
        }

        function tbUpdateIngreso_Equipos_isEmpty()
        {
            var rowCount = $('#tbUpdateIngreso_Equipos > tbody > tr').length;
            if (rowCount === 0)
            {
                return true;
            }
            else if (rowCount === 1)
            {
                var firstRow = $('#tbUpdateIngreso_Equipos > tbody > tr')[0];
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

        function tbUpdateIngreso_Equipos_isItemInTable(id)
        {
            var rows = $('#tbUpdateIngreso_Equipos > tbody > tr');

            for (var i = 0; i < rows.length; i++)
            {
                var columns = $(rows[i]).find('td');

                if ($(columns[0]).html() === id.toString())
                {
                    return true;
                }
            }

            return false;
        }

        function updateIngreso_EquipoSelect_Success()
        {
            //ADD EQUIPO
            var validForm = validateForm_UpdateIngreso_EquipoSelect();

            if (validForm === true)
            {
                var id = $('#ddlUpdateIngreso_Equipo').val();

                $.post(
                    '../service/WSTaller.asmx/getInfoEquipo_JSON',
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

                                    if (data.length > 0)
                                    {
                                        if (tbUpdateIngreso_Equipos_isEmpty())
                                        {
                                            $('#tbUpdateIngreso_Equipos > tbody > tr').remove();
                                        }

                                        var equipo = data[0];

                                        if (tbUpdateIngreso_Equipos_isItemInTable(equipo.id) === false)
                                        {
                                            var row = ' <tr>'
                                                    + '     <td style="text-align: center;">' + equipo.id + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.sap + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.cod + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.nombre + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.tipo + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo.modelo + '</td>'
                                                    + '     <td align="center">'
                                                    + '         <a class="btn btn-default" href="javascript:updateIngreso_Fotos_addFoto(' + equipo.id + ');">Agregar foto</a>'
                                                    + '         <a class="btn btn-danger" href="javascript:tbUpdateIngreso_Equipos_removeItem(' + equipo.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                            $('#tbUpdateIngreso_Equipos > tbody').append(row);
                                        }
                                        else
                                        {
                                            $.alert(
		                                            {
		                                                icon: 'fa fa-info',
		                                                title: 'INFORMACIÓN',
		                                                content: 'El equipo seleccionado ya está en la lista',
		                                                confirmButton: 'Cerrar'
		                                            }
                                            );
                                        }

                                        clearForm_UpdateIngreso_EquipoSelect();

                                        $("#divUpdateIngreso_EquiposSelect").hide();
                                        $("#divUpdateIngreso_EquiposList").show();
                                    }
                                    else
                                    {
                                        $.alert(
		                                        {
		                                            icon: 'fa fa-warning',
		                                            title: 'ERROR',
		                                            content: 'No se ha encontrado un equipo con el código sap ingresado',
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
		                            content: 'Se ha producido un error al recuperar la información del equipo',
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

        function updateIngreso_Equipo_tryRemoveFoto(id)
        {
            var data = new FormData();

            data.append('archivo_id', id);

            $.ajax(
                    {
                        type: "POST",
                        url: "../service/WSTaller.asmx/removeArchivo_JSON",
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

                                        var rows = $('#tbUpdateIngreso_Fotos > tbody > tr');
                                        for (var i = 0; i < rows.length; i++)
                                        {
                                            var columns = $(rows[i]).find('td');
                                            if ($(columns[0]).text() == id)
                                            {
                                                $(rows[i]).remove();

                                                break;
                                            }
                                        }

                                        var rowCount = $('#tbUpdateIngreso_Fotos > tbody > tr').length;
                                        if (rowCount < 1)
                                        {
                                            var emptyRow = '<tr>'
                                                            + '    <td colspan="3" style="text-align:center;">'
                                                            + '        <label>No hay elementos cargados en la lista</label>'
                                                            + '    </td>'
                                                            + '</tr>';

                                            $('#tbUpdateIngreso_Fotos > tbody').append(emptyRow);
                                        }

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

        function tbUpdateIngreso_Fotos_removeItem(id)
        {
            if ($('#tbUpdateIngreso_Fotos > tbody > tr').length === 1)
            {
                var columns = $($('#tbUpdateIngreso_Fotos > tbody > tr').get(0)).find('td');
                if($(columns).length > 1)
                {
                    $.alert(
		                    {
		                        icon: 'fa fa-warning',
		                        title: 'ERROR',
		                        content: 'Debes dejar al menos 1 foto en el ingreso. Para eliminar la foto actual se debe cargar otra con anterioridad',
		                        confirmButton: 'Cerrar'
		                    }
                    );

                    return;
                }
            }

            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'ELIMINAR ARCHIVO',
                    content: '¿Realmente deseas eliminar el archivo?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        updateIngreso_Equipo_tryRemoveFoto(id);
                    }
                }
            );
        }

        function updateIngreso_Equipo_tryUploadFoto(file, equipo_id)
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

                                default: //SUCCESS
                                    {
                                        var msg = responseJson['msg'];

                                        /*
                                        $.alert(
		                                        {
		                                            icon: 'fa fa-check',
		                                            title: 'REALIZADO',
		                                            content: msg,
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );
                                        */

                                        if ($('#tbUpdateIngreso_Fotos > tbody > tr').length > 0)
                                        {
                                            if ($($('#tbUpdateIngreso_Fotos > tbody > tr').get(0)).find('td').length < 2)
                                            {
                                                $('#tbUpdateIngreso_Fotos > tbody > tr').remove();
                                            }
                                        }

                                        var row = ' <tr>'
                                                    + '     <td style="display: none;">' + statusCode + '</td>'
                                                    + '     <td style="text-align: center;">' + file.name + '</td>'
                                                    + '     <td style="text-align: center;">' + equipo_id + '</td>'
                                                    + '     <td align="center">'
                                                    + '         <a class="btn btn-danger" href="javascript:tbUpdateIngreso_Fotos_removeItem(' + statusCode + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                        $('#tbUpdateIngreso_Fotos > tbody').append(row);

                                        $('#divUpdateIngreso_Equipos_vfFotos').hide();

                                        break;
                                    }
                            }
                        }
                    }
            );
        }

        function updateIngreso_Fotos_addFoto(equipo_id)
        {
            $('#divUpdateIngreso_Fotos_fuFile').unbind("change");

            $('#divUpdateIngreso_Fotos_fuFile').change(
                function ()
                {
                    if ($(this).get(0).files.length > 0)
                    {

                        var file = $(this).get(0).files[0];
                        updateIngreso_Equipo_tryUploadFoto(file, equipo_id);
                    }
                }
            );

            $('#divUpdateIngreso_Fotos_fuFile').click();
        }

        function updateIngreso_EquipoSelect_Cancel()
        {
            clearForm_UpdateIngreso_EquipoSelect();

            $("#divUpdateIngreso_EquiposSelect").hide();
            $("#divUpdateIngreso_EquiposList").show();
        }

        function showUpdateIngreso_EquipoAdd()
        {
            $('.requiredText').hide();

            $("#divUpdateIngreso_EquiposList").hide();
            $("#divUpdateIngreso_EquiposNew").hide();
            $("#divUpdateIngreso_EquiposSelect").show();
        }

        function clearForm_UpdateIngreso_EquipoSelect()
        {
            $('.requiredText').hide();


            $('#ddlUpdateIngreso_Equipo').val('');
        }

        function validateForm_UpdateIngreso_EquipoSelect()
        {
            $('.requiredText').hide();

            var equipo = $('#ddlUpdateIngreso_Equipo').val();

            var valid = true;

            if (equipo.length < 1)
            {
                $('#divUpdateIngreso_Equipo_vfEquipo').show();

                valid = false;
            }

            return valid;
        }

        function updateIngreso_Documentos_tryUploadFile(file, type)
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

                                default: //SUCCESS
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

                                        if (type === 0)
                                        {
                                            $('#divUpdateIngreso_Documentos_idActaRecepcion').text(statusCode);
                                            $('#divUpdateIngreso_Documentos_fnActaRecepcion').text(file.name);
                                        }
                                        else if (type === 1)
                                        {
                                            $('#divUpdateIngreso_Documentos_idGuiaDespacho').text(statusCode);
                                            $('#divUpdateIngreso_Documentos_fnGuiaDespacho').text(file.name);
                                            $('#divUpdateIngreso_btClearFile_GuiaDespacho').removeAttr('disabled');
                                        }

                                        break;
                                    }
                            }
                        }
                    }
            );
        }

        function divUpdateIngreso_goTabCliente(direction)
        {
            $("#divUpdateIngreso_tabCliente").click();
        }

        function divUpdateIngreso_goTabRecepcion(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_UpdateIngreso_Cliente();

                if (validForm === true)
                {
                    $("#divUpdateIngreso_tabRecepcion").click();
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
                $("#divUpdateIngreso_tabRecepcion").click();
            }
        }

        function divUpdateIngreso_goTabEquipos(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_UpdateIngreso_Recepcion();

                if (validForm === true)
                {
                    $("#divUpdateIngreso_tabEquipos").click();
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
                $("#divUpdateIngreso_tabEquipos").click();
            }
        }

        function divUpdateIngreso_goTabDocumentos(direction)
        {
            if (direction === 1)
            {
                var validForm = validateForm_UpdateIngreso_Equipos();

                if (validForm === true)
                {
                    $("#divUpdateIngreso_tabDocumentos").click();
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
                $("#divUpdateIngreso_tabDocumentos").click();
            }
        }

        function showUpdateIngreso(id)
        {
            $("#divInsertIngreso").hide();
            $("#divInsertPresupuesto").hide();
            
            updateIngreso_prepareForm(id);
        }

        function updateIngreso_prepareForm(id)
        {
            clearForm_UpdateIngreso();

            $.post(
                '../service/WSTaller.asmx/getInfoTallerIngreso_JSON',
                {
                    talleringreso_id: id
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

                                {
                                    var tbEmpresa = data['Form_Empresa'];

                                    $("#<%= ddlUpdateIngreso_Empresa.ClientID %>").append('<option value="">Seleccione..</option>');
                                    for (var i = 0; i < tbEmpresa.length; i++)
                                    {
                                        var empresa = tbEmpresa[i];

                                        $("#<%= ddlUpdateIngreso_Empresa.ClientID %>").append('<option value="' + empresa.id + '">' + empresa.nombre + '</option>');
                                    }
                                }

                                {
                                    var tbContacto = data['Form_Contacto'];

                                    $("#<%= ddlUpdateIngreso_Contacto.ClientID %>").append('<option value="">Seleccione..</option>');
                                    for (var i = 0; i < tbContacto.length; i++)
                                    {
                                        var contacto = tbContacto[i];

                                        $("#<%= ddlUpdateIngreso_Contacto.ClientID %>").append('<option value="' + contacto.id + '">' + contacto.nombre + '</option>');
                                    }
                                }

                                {
                                    var tbTrabajador = data['Form_Trabajador'];

                                    $("#<%= ddlUpdateIngreso_RecepcionadoPor.ClientID %>").append('<option value="">Seleccione..</option>');
                                    for (var i = 0; i < tbTrabajador.length; i++)
                                    {
                                        var trabajador = tbTrabajador[i];

                                        $("#<%= ddlUpdateIngreso_RecepcionadoPor.ClientID %>").append('<option value="' + trabajador.id + '">' + trabajador.nombre + '</option>');
                                    }
                                }

                                //TallerIngreso
                                {
                                    var tbTallerIngreso = data['TallerIngreso'];
                                    $('#divUpdateIngreso_lbTitulo').text(tbTallerIngreso['id']);

                                    //Cliente
                                    {
                                        $('#<%= ddlUpdateIngreso_Empresa.ClientID %>').unbind('change');
                                        $("#<%= ddlUpdateIngreso_Empresa.ClientID %>").val(tbTallerIngreso['empresa_id']);

                                        $('#<%= ddlUpdateIngreso_Empresa.ClientID %>').change(
                                            function ()
                                            {
                                                updateIngreso_loadDDLContacto();
                                            }
                                        );

                                        $("#<%= ddlUpdateIngreso_Contacto.ClientID %>").val(tbTallerIngreso['contacto_id']);
                                    }

                                    //Recepcion
                                    {
                                        $('#<%= txtUpdateIngreso_Recepcion_NumeroRecepcion.ClientID %>').val(tbTallerIngreso['numeroRecepcion']);
                                        $('#<%= txtUpdateIngreso_Recepcion_FechaRecepcion.ClientID %>').val(tbTallerIngreso['fechaRecepcion']);
                                        $("#<%= ddlUpdateIngreso_RecepcionadoPor.ClientID %>").val(tbTallerIngreso['trabajador_id']);
                                        $('#<%= txtUpdateIngreso_Recepcion_Observaciones.ClientID %>').val(tbTallerIngreso['observaciones']);
                                    }
                                }

                                //Equipos
                                {
                                    var tbEquipo = data['Equipo'];

                                    $('#tbUpdateIngreso_Equipos > tbody > tr').remove();

                                    for (var i = 0; i < tbEquipo.length; i++) 
                                    {
                                        var equipo = tbEquipo[i];
                                        var sap = "";
                                        var cod = "";
                                        var nombre = "";
                                        var tipo = "";
                                        var modelo = "";

                                        if (equipo['sap'] !== null) 
                                        {
                                            sap = equipo.sap;
                                        }

                                        if (equipo['cod'] !== null) 
                                        {
                                            cod = equipo.cod;
                                        }

                                        if (equipo['nombre'] !== null) 
                                        {
                                            nombre = equipo.nombre;
                                        }

                                        if (equipo['tipo'] !== null) 
                                        {
                                            tipo = equipo.tipo;
                                        }

                                        if (equipo['modelo'] !== null) 
                                        {
                                            modelo = equipo.modelo;
                                        }

                                        var row = ' <tr>'
                                                + '     <td style="text-align: center;">' + equipo.id + '</td>'
                                                + '     <td style="text-align: center;">' + sap + '</td>'
                                                + '     <td style="text-align: center;">' + cod + '</td>'
                                                + '     <td style="text-align: center;">' + nombre + '</td>'
                                                + '     <td style="text-align: center;">' + tipo + '</td>'
                                                + '     <td style="text-align: center;">' + modelo + '</td>'
                                                + '     <td align="center">'
                                                + '         <a class="btn btn-default" href="javascript:updateIngreso_Fotos_addFoto(' + equipo.id + ');">Agregar foto</a>'
                                                + '         <a class="btn btn-danger" href="javascript:tbUpdateIngreso_Equipos_removeItem(' + equipo.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                + '     </td>'
                                                + ' </tr>';

                                            $('#tbUpdateIngreso_Equipos > tbody').append(row);
                                    }
                                }

                                //Fotos
                                {
                                    var tbFoto = data['Foto'];

                                    $('#tbUpdateIngreso_Fotos > tbody > tr').remove();

                                    if (tbFoto.length > 0)
                                    {
                                        for (var i = 0; i < tbFoto.length; i++)
                                        {
                                            var foto = tbFoto[i];

                                            var row = ' <tr>'
                                                    + '     <td style="display: none;">' + foto.archivo_id + '</td>'
                                                    + '     <td style="text-align: center;">' + foto.archivo_nombre + '</td>'
                                                    + '     <td style="text-align: center;">' + foto.equipo_id + '</td>'
                                                    + '     <td align="center">'
                                                    + '         <a class="btn btn-danger" href="javascript:tbUpdateIngreso_Fotos_removeItem(' + foto.archivo_id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                            $('#tbUpdateIngreso_Fotos > tbody').append($(row));
                                        }
                                    }
                                    else
                                    {
                                        var emptyRow = '<tr>'
                                                        + '    <td colspan="3" style="text-align:center;">'
                                                        + '        <label>No hay elementos cargados en la lista</label>'
                                                        + '    </td>'
                                                        + '</tr>';

                                        $('#tbUpdateIngreso_Fotos > tbody').append(emptyRow);
                                    }
                                }

                                //Documentos
                                {
                                    var tbDocumento = data['Documento'];
                                    
                                    for (var i = 0; i < tbDocumento.length; i++)
                                    {
                                        var documento = tbDocumento[i];

                                        if (documento.archivo_tipoArchivo === "ActaRecepcion")
                                        {
                                            $('#divUpdateIngreso_Documentos_idActaRecepcion').text(documento['archivo_id']);
                                            $('#divUpdateIngreso_Documentos_fnActaRecepcion').text(documento['archivo_nombre']);
                                        }
                                        else if (documento.archivo_tipoArchivo === "GuiaDespacho")
                                        {
                                            $('#divUpdateIngreso_Documentos_idGuiaDespacho').text(documento['archivo_id']);
                                            $('#divUpdateIngreso_Documentos_fnGuiaDespacho').text(documento['archivo_nombre']);
                                            $('#divUpdateIngreso_btClearFile_GuiaDespacho').removeAttr('disabled');
                                        }                                
                                    }
                                }

                                $("#divListIngreso_Equipo").hide();
                                $("#divUpdateIngreso").show();

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
		                        content: 'Se ha producido un error al recuperar la información del equipo',
		                        confirmButton: 'Cerrar'
		                    }
                    );
                }
            );
        }

        function tbIngresoEquipo_editItem(id)
        {
            showUpdateIngreso(id);
        }

        function cancelUpdateIngreso()
        {
            $.confirm(
                {
                    icon: 'fa fa-question',
                    title: 'EDITAR INGRESO',
                    content: 'Se perder&aacute;n todos los datos no guardados. ¿Desea continuar?',
                    confirmButton: 'Aceptar',
                    cancelButton: 'Cancelar',
                    confirm: function ()
                    {
                        $("#divUpdateIngreso").hide();
                        $("#divListIngreso_Equipo").show();
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
                        stringListRepuestoCantidad += repuesto_cantidad;
                        stringListRepuestoValorUnitario += repuesto_valorUnitario;

                        if (i < rowsRepuesto.length - 1)
                        {
                            stringListRepuestoId += ',';
                            stringListRepuestoCantidad += ',';
                            stringListRepuestoValorUnitario += ',';
                        }
                    }
                }


                var data = new FormData();

                data.append('tallerIngresoId', $('#lbInsertPresupuesto_TallerIngresoID').text());
                data.append('equipoId', $('#lbInsertPresupuesto_EquipoID').text());
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
                        url: "../service/WSTaller.asmx/insertOT_JSON",
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
		                                            confirmButton: 'Cerrar'
		                                        }
                                        );

                                        clearForm_InsertPresupuesto();
                                        $("#divInsertPresupuesto").hide();
                                        loadIngreso_loadDTIngreso_Equipo(false);
                                        $("#divListIngreso_Equipo").show();

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

            if(validateForm_InsertPresupuesto_Antecedentes() === false)
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
                    else if (validateNumber($(this).val()) === false)
                    {
                        msg = 'El valor debe ser un número entero';
                    }
                    else if (isNaN($(this).val()))
                    {
                        msg = 'El valor unitario debe ser numérico';
                    }
                    else
                    {
                        var valorUnitario = parseInt($(this).val());

                        if(isNaN(valorUnitario))
                        {
                            msg = 'Debes ingresar un valor unitario válido';
                        }
                        else if(valorUnitario < 1)
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

            $('#lbInsertPresupuesto_TallerIngresoID').text("-1");
            $('#lbInsertPresupuesto_EquipoID').text("-1");
            $('#<%= txtInsertPresupuesto_Antecedentes_FechaCompromiso.ClientID %>').val("");
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

            if((isNaN(valorNetoTecnico) === false) && (isNaN(valorNetoRepuestos) === false))
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
            for(var i=0; i<rows.length; i++)
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
                        var netoRepuestos = "Error de cálculo";

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
                                                    + '     <td align="center">'
                                                    + '         <a class="btn btn-danger" href="javascript:tbInsertPresupuesto_Repuestos_removeItem(' + repuesto.id + ');" title="Eliminar"><i class="fa fa-trash-o"></i></a>'
                                                    + '     </td>'
                                                    + ' </tr>';

                                            $('#tbInsertPresupuesto_Repuestos > tbody').append(row);

                                            $('#tbInsertPresupuesto_Repuestos > tbody > tr > td > div > .textNumber').change(
                                                function()
                                                {
                                                    var columns = $($($($(this).parent()).parent()).parent()).find('td');

                                                    var cantidad = parseInt($(columns[5]).text());
                                                    var textValorUnitario = $(this).val();

                                                    if (textValorUnitario.length < 1)
                                                    {
                                                        var total = "Error de cálculo";
                                                    }
                                                    else if(validateNumber(textValorUnitario) === false)
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
            else
            {
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
            else if(isNaN(cantidad))
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

        function insertPresupuesto_Tecnico_calculateNeto()
        {
            var cantidadHoras = $('#<%= txtInsertPresupuesto_Tecnico_CantidadHoras.ClientID %>').val();
            var valorHH = $('#<%= txtInsertPresupuesto_Tecnico_ValorHH.ClientID %>').val();

            cantidadHoras = parseInt(cantidadHoras);
            valorHH = parseInt(valorHH);

            if((isNaN(cantidadHoras) == false) && (isNaN(valorHH) === false))
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

                                for (var i = 0; i < data.length; i++)
                                {
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

        function showInsertPresupuesto(talleringreso_id, equipo_id)
        {
            $("#divInsertIngreso").hide();
            $("#divUpdateIngreso").hide();
            $("#divListIngreso_Equipo").hide();

            insertPresupuesto_prepareForm(talleringreso_id, equipo_id);
            $("#divInsertPresupuesto").show();
        }

        function insertPresupuesto_prepareForm(talleringreso_id, equipo_id)
        {
            clearForm_InsertPresupuesto();

            $("#divInsertPresupuesto_lbTitulo").text('Ingreso #' + talleringreso_id + ', Equipo #' + equipo_id);
            $("#lbInsertPresupuesto_TallerIngresoID").text(talleringreso_id);
            $("#lbInsertPresupuesto_EquipoID").text(equipo_id);

            insertPresupuesto_loadDDLTecnico();
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
                        clearForm_InsertPresupuesto();
                        $("#divInsertPresupuesto").hide();
                        $("#divListIngreso_Equipo").show();
                    }
                }
            );
        }

        function tbIngresoEquipo_createOT(talleringreso_id, equipo_id)
        {
            showInsertPresupuesto(talleringreso_id, equipo_id);
        }

    </script>
</asp:Content>