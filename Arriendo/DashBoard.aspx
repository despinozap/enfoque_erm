<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="DashBoard.aspx.cs" Inherits="Arriendo_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content" class="col-lg-12">
    <div class="row">
        <div class="col-sm-12">
			<div class="page-header">
				<div class="clearfix"  style="margin: 20px">
					<h3 class="content-title pull-left padding-top-10"><i class="fa fa-tachometer"></i> DashBoard Arriendos</h3>
                </div>     
			</div>
		</div>               

        <div class="col-md-6">
            <div class="box border blue">
				<div class="box-title">
					<h4>Equipos</h4>
					<div class="tools">
                        <span>Filtro Familia:</span>                        
                        
                        <select id="sFiltro" runat="Server" style="font-size: 14px;color: #555555;vertical-align: middle;background-color: #ffffff;border: 1px solid #cccccc;border-radius: 4px;">
                          <option value="volvo">TODOS</option>
                          <option value="saab">TORRES</option>
                          <option value="saab">CARGADOR FRONTAL</option>
                          <option value="mercedes">GRUA</option>
                          <option value="audi">MOTO NIVELADORA</option>
                          <option value="audi">TALADRO</option>
                        </select>
						<a href="javascript:;" class="search">
							<i class="fa fa-search search-icon"></i>
						</a>
                        
                        <!--<span style="color:#555555">
                        <a class="pop" data-title="Descripcion de Colores" title="" data-original-title="" 
                        data-content="<p style='color: #70afc4;margin-left: 10px;font-weight: bold;'>Reserva</p><p style='color: #a8bc7b;margin-left: 10px;font-weight: bold;'>Disponible</p><p style='color: #f0ad4e;margin-left: 10px;font-weight: bold;'>Arriendo</p><p style='color: #d9534f;margin-left: 10px;font-weight: bold;'>Mantencion</p>">
							<i class="fa fa-info-circle" style="color: white;font-size: 20px;"></i>
						</a>
                        </span>-->

					</div>
				</div>
				<div class="box-body">
					<div class="panel-group" id="accordionEquipos" runat="server">
						<div class="panel panel-default">
							<div class="panel-heading">
							    <h3 class="panel-title"> 
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                        TORRES 
                                        <span class="badge badge-blue">10</span>
                                        <div class="progress" style="height: 20px !important;width: 60%;float: right;margin-bottom: 0px;">
	                                        <div class="progress-bar progress-bar-success tip-right" data-original-title="Disponible" style="width: 50%">
	                                        <span class="h1" style="font-size: 19px;">3</span>
	                                        </div>
	                                        <div class="progress-bar progress-bar-warning tip-left" data-original-title="Arriendo" style="width: 20%">
	                                        <span class="h1" style="font-size: 19px;">2</span>
	                                        </div>
	                                        <div class="progress-bar progress-bar-danger tip-left" data-original-title="Mantencion" style="width: 30%">
	                                        <span class="h1" style="font-size: 19px;">5</span>
	                                        </div>
                                        </div>
                                    </a>                                 
                                </h3>
							</div>
							<div id="collapseOne" class="panel-collapse collapse">
							    <div class="panel-body"> 
                                    <table class="table table-striped">
						                <thead>
							                <tr>
							                <th>Equipo</th>
							                <th>Serie</th>
							                <th>Horometro</th>
							                </tr>
						                </thead>
						                <tbody>
							                <tr>
							                <td>Equipo 1</td>
							                <td>0-1-0</td>
							                <td>450 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-2-0</td>
							                <td>1.100 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-3-0</td>
							                <td>20 h</td>
							                </tr>
						                </tbody>
						                </table>
                                </div>
							</div>
						</div>
						<!-- -->
                        <div class="panel panel-default">
							<div class="panel-heading">
							<h3 class="panel-title"> 
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#Div1">
                                    CARGADOR FRONTAL 
                                    <span class="badge badge-blue">15</span>
                                    <div class="progress" style="height: 20px !important;width: 60%;float: right;margin-bottom: 0px;">
	                                    <div class="progress-bar progress-bar-success tip-right" data-original-title="Disponible" style="width: 13.33%">
	                                    <span class="h1" style="font-size: 19px;">2</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-warning tip-left" data-original-title="Arriendo" style="width: 20%">
	                                    <span class="h1" style="font-size: 19px;">3</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-danger tip-left" data-original-title="Mantencion" style="width: 66.67%">
	                                    <span class="h1" style="font-size: 19px;">10</span>
	                                    </div>
                                    </div>
                                </a> 
                                
                            </h3>
							</div>
							<div id="Div1" class="panel-collapse collapse" style="height: auto;">
							    <div class="panel-body"> 
                                    <table class="table table-striped">
						                <thead>
							                <tr>
							                <th>Equipo</th>
							                <th>Serie</th>
							                <th>Horometro</th>
							                </tr>
						                </thead>
						                <tbody>
							                <tr>
							                <td>Equipo 1</td>
							                <td>0-1-0</td>
							                <td>450 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-2-0</td>
							                <td>1.100 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-3-0</td>
							                <td>20 h</td>
							                </tr>
						                </tbody>
						                </table>
                                </div>
							</div>
						</div>
						<!-- -->
                        <div class="panel panel-default">
							<div class="panel-heading">
							<h3 class="panel-title"> 
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#Div2">
                                    GRUA 
                                    <span class="badge badge-blue">5</span>
                                    <div class="progress" style="height: 20px !important;width: 60%;float: right;margin-bottom: 0px;">
	                                    <div class="progress-bar progress-bar-success tip-right" data-original-title="Disponible" style="width: 20%">
	                                    <span class="h1" style="font-size: 19px;">1</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-warning tip-left" data-original-title="Arriendo" style="width: 40%">
	                                    <span class="h1" style="font-size: 19px;">2</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-danger tip-left" data-original-title="Mantencion" style="width: 40%">
	                                    <span class="h1" style="font-size: 19px;">2</span>
	                                    </div>
                                    </div>
                                </a> 
                                
                            </h3>
							</div>
							<div id="Div2" class="panel-collapse collapse">
							    <div class="panel-body"> 
                                    <table class="table table-striped">
						                <thead>
							                <tr>
							                <th>Equipo</th>
							                <th>Serie</th>
							                <th>Horometro</th>
							                </tr>
						                </thead>
						                <tbody>
							                <tr>
							                <td>Equipo 1</td>
							                <td>0-1-0</td>
							                <td>450 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-2-0</td>
							                <td>1.100 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-3-0</td>
							                <td>20 h</td>
							                </tr>
						                </tbody>
						                </table>
                                </div>
							</div>
						</div>
						<!-- -->
                        <div class="panel panel-default">
							<div class="panel-heading">
							<h3 class="panel-title"> 
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#Div3">
                                    MOTO NIVELADORA 
                                    <span class="badge badge-blue">40</span>
                                    <div class="progress" style="height: 20px !important;width: 60%;float: right;margin-bottom: 0px;">
	                                    <div class="progress-bar progress-bar-success tip-right" data-original-title="Disponible" style="width: 75%">
	                                    <span class="h1" style="font-size: 19px;">30</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-warning tip-left" data-original-title="Arriendo" style="width: 20%">
	                                    <span class="h1" style="font-size: 19px;">8</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-danger tip-left" data-original-title="Mantencion" style="width: 5%">
	                                    <span class="h1" style="font-size: 19px;">2</span>
	                                    </div>
                                    </div>
                                </a> 
                                
                            </h3>
							</div>
							<div id="Div3" class="panel-collapse collapse">
							    <div class="panel-body"> 
                                    <table class="table table-striped">
						                <thead>
							                <tr>
							                <th>Equipo</th>
							                <th>Serie</th>
							                <th>Horometro</th>
							                </tr>
						                </thead>
						                <tbody>
							                <tr>
							                <td>Equipo 1</td>
							                <td>0-1-0</td>
							                <td>450 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-2-0</td>
							                <td>1.100 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-3-0</td>
							                <td>20 h</td>
							                </tr>
						                </tbody>
						                </table>
                                </div>
							</div>
						</div>
						<!-- -->
                        <div class="panel panel-default">
							<div class="panel-heading">
							<h3 class="panel-title"> 
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#Div4">
                                    TALADRO 
                                    <span class="badge badge-blue">120</span>
                                    <div class="progress" style="height: 20px !important;width: 60%;float: right;margin-bottom: 0px;">
	                                    <div class="progress-bar progress-bar-success tip-right" data-original-title="Disponible" style="width: 33.33%">
	                                    <span class="h1" style="font-size: 19px;">40</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-warning tip-left" data-original-title="Arriendo" style="width: 50%">
	                                    <span class="h1" style="font-size: 19px;">60</span>
	                                    </div>
	                                    <div class="progress-bar progress-bar-danger tip-left" data-original-title="Mantencion" style="width: 16.67%">
	                                    <span class="h1" style="font-size: 19px;">20</span>
	                                    </div>
                                    </div>
                                </a> 
                                
                            </h3>
							</div>
							<div id="Div4" class="panel-collapse collapse">
							    <div class="panel-body"> 
                                    <table class="table table-striped">
						                <thead>
							                <tr>
							                <th>Equipo</th>
							                <th>Serie</th>
							                <th>Horometro</th>
							                </tr>
						                </thead>
						                <tbody>
							                <tr>
							                <td>Equipo 1</td>
							                <td>0-1-0</td>
							                <td>450 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-2-0</td>
							                <td>1.100 h</td>
							                </tr>
							                <tr>
							                <td>Equipo 3</td>
							                <td>0-3-0</td>
							                <td>20 h</td>
							                </tr>
						                </tbody>
						                </table>
                                </div>
							</div>
						</div>
						<!-- -->
					</div>
				</div>
			</div>
            
				

        </div>
        <div class="col-md-6">
            <div class="box border">
				<div class="box-title">
					<h4>EQUIPOS EN RESERVA</h4>
					<div class="tools">
                        <a href="javascript:;" class="addNew">
							<i class="fa fa-plus"></i>
						</a>
					</div>
				</div>
				<div class="box-body" id="bodyReserva" runat="server">
					<table class="table table-striped">
						<thead>
							<tr>
							<th>Serie</th>
							<th>Equipo</th>
							<th>Cliente</th>
							<th>Vendedor</th>
                            <th>Hasta</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>1-0</td>
							<td>Equipo 1</td>
							<td>Cliente 1</td>
							<td>Pedro Soto</td>
                            <td>17/05/2016</td>
							</tr>
							<tr>
							<td>2-0</td>
							<td>Equipo 2</td>
							<td>Cliente 2</td>
							<td>Pedro Soto</td>
                            <td>17/05/2016</td>
							</tr>
							<tr>
							<td>3-0</td>
							<td>Equipo 3</td>
							<td>Cliente 3</td>
							<td>Pedro Soto</td>
                            <td>17/05/2016</td>
							</tr>
						</tbody>
						</table>
				</div>
			</div>
        </div>
        <div class="col-md-6">
            <div class="box border inverse">
				<div class="box-title">
					<h4>LISTADO B</h4>
					<div class="tools">
                        
					</div>
				</div>
				<div class="box-body" id="bodyListaB" runat="server">
					<table class="table table-striped">
						<thead>
							<tr>
							<th>Cliente</th>
							<th>Deuda</th>
							<th>Ultimo Pago</th>
                            <th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td>Cliente 1</td>
							<td>$ 1.000.000</td>
							<td>01/01/2016</td>
                            <th><i class="fa fa-check" style="color: green;"></i></th>
							</tr>
							<tr>
							<td>Cliente 3</td>
							<td>$ 1.000.000</td>
							<td>01/01/2016</td>
                            <th><i class="fa fa-times" style="color: red;"></i></th>
							</tr>
							<tr>
							<td>Cliente 3</td>
							<td>$ 1.000.000</td>
							<td>01/01/2016</td>
                            <th><i class="fa fa-check" style="color: green;"></i></th>
							</tr>
						</tbody>
						</table>
				</div>
			</div>
        </div>
    </div>


</div>


<!--

<div class="progress progress-striped active" style="height: 20px !important;">
	<div class="progress-bar progress-bar-success" style="width: 35%">
	<span class="sr-only"></span>
	</div>
	<div class="progress-bar progress-bar-warning" style="width: 20%">
	<span class="h1" style="font-size: 19px;">20</span>
	</div>
	<div class="progress-bar progress-bar-danger" style="width: 10%">
	<span class="sr-only">10% Complete (danger)</span>
	</div>
</div>

-->

<script type="text/javascript">
    menu.setPage('mArriendo', 'maDashboard');                 
</script>


</asp:Content>


