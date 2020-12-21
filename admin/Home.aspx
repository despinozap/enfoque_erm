<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Web_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<!--
    JS Graficos
   -->
<script src="../Resources/grafico/JSgrafico.js" type="text/javascript"></script>
<!-- GAGE -->
<script src="../Theme/js/justgage/js/raphael.2.1.0.min.js" type="text/javascript"></script>
<script src="../Theme/js/justgage/js/justgage.1.0.1.min.js" type="text/javascript"></script>
<style type="text/css">
		      #g1, #g2, #g3, #g4, #g5, #g6 {
				width:100%; height:160px;
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
					<h3 class="content-title pull-left padding-top-10">Dashboard</h3>
					<!-- DATE RANGE PICKER -->
					<span class="date-range pull-right">
						<div class="btn-group">
							<a class="js_update btn btn-default" href="#">Hoy</a>
							<a class="js_update btn btn-default" href="#">Semana</a>
							<a class="js_update btn btn-default hidden-xs" href="#">Mes</a>
                            <a class="js_update btn btn-default hidden-xs" href="#">Año</a>
                            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                Personalizado
                                <span class="caret"></span>
                            </button>
                            <!--												
							<a id="reportrange" class="btn reportrange">
								<i class="fa fa-calendar"></i>
								<span></span>
								<i class="fa fa-angle-down"></i>
							</a>
                            -->
						</div>
					</span>
					<!-- /DATE RANGE PICKER -->
				</div>
			</div>
		</div>
	</div>
	<!-- /PAGE HEADER -->
    <!-- Inicio -->
    <div class="row">
        <div class="col-md-12">
			<div class="row">
				<div class="col-lg-3">
                    <div class="dashbox panel panel-default">
					    <div class="panel-body">
						    <div class="panel-left blue">
							    <i class="fa fa-3x">A</i>
						    </div>
						    <div class="panel-right">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="dashbox panel panel-default">
					    <div class="panel-body">
						    <div class="panel-left blue">
							    <i class="fa fa-3x">S</i>
						    </div>
						    <div class="panel-right">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="dashbox panel panel-default">
					    <div class="panel-body">
						    <div class="panel-left blue">
							    <i class="fa fa-3x">P</i>
						    </div>
						    <div class="panel-right">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="dashbox panel panel-default">
					    <div class="panel-body">
						    <div class="panel-left blue">
							    <i class="fa fa-3x">$</i>
						    </div>
						    <div class="panel-right">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Nueva Linea Grafico-->
    <div class="row">
        <div class="col-md-12">
			<div class="row">
                <div class="col-lg-12">
                    <div class="box solid grey">
				        <div class="box-title">
					        <h4><i class="fa fa-dollar"></i>Ventas</h4>
					        <div class="tools">
						        <a href="javascript:;" class="reload hidden">
							        <i class="fa fa-refresh"></i>
						        </a>
						        <a href="javascript:;" class="collapse">
							        <i class="fa fa-chevron-up"></i>
						        </a>
						        <a href="javascript:;" class="remove hidden">
							        <i class="fa fa-times"></i>
						        </a>
					        </div>
                        </div>
				        <div class="box-body">
					        <div id="chart-revenue" style="height:240px"></div>
				        </div>
				    </div>
                </div>
			</div>
            </div>
        </div>
    <!-- Botones Tipo¨Pago -->
    <div class="row">
		<div class="col-md-12">
			<div class="quick-pie panel panel-default">
				<div class="panel-body">
					<div class="col-md-2 text-center">
                        <div id="pie_1" class="piechart padding-bottom-20" data-percent="86">
							<span class="percent"></span>
						</div>
						<a href="#" class="title">Efectivo</a>
                    <!--
						<div id="dash_pie_4" class="piechart" data-percent="59">
							<span class="percent"></span>
						</div>
						<a href="#" class="title">Efectivo</a>
                        -->
					</div>
					<div class="col-md-2 text-center">
						<div id="dash_pie_5" class="piechart" data-percent="73">
							<span class="percent"></span>
						</div>
						<a href="#" class="title">Cheque</a>
					</div>
					<div class="col-md-2 text-center">
						<div id="dash_pie_6" class="piechart" data-percent="90">
							<span class="percent"></span>
						</div>
						<a href="#" class="title">Red Compra</a>
					</div>
                    <div class="col-md-2 text-center">
						<div id="dash_pie_7" class="piechart" data-percent="90">
							<span class="percent"></span>
						</div>
						<a href="#" class="title">Credito</a>
					</div>
                    <div class="col-md-2 text-center">
						<div id="dash_pie_8" class="piechart" data-percent="90">
							<span class="percent"></span>
						</div>
						<a href="#" class="title">Transferencia</a>
					</div>
                    <div class="col-md-2 text-center">
						<div id="dash_pie_9" class="piechart" data-percent="90">
							<span class="percent"></span>
						</div>
						<a href="#" class="title">Gif Card</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
        <div class="col-md-12">
	        <!-- BOX -->
	        <div class="box border blue">
		        <div class="box-title">
			        <h4><i class="fa fa-bars"></i>Graficos Mitades</h4>
			        <div class="tools">
			        </div>
		        </div>
		        <div class="box-body">
			        <div class="row">
				        <div class="col-md-4"><div id="g3"></div></div>
				        <div class="col-md-4"><div id="g4"></div></div>
				        <div class="col-md-4"><div id="g5"></div></div>
			        </div>
			        <div class="row">
				        <div class="col-md-4"><div id="g1"></div></div>
				        <div class="col-md-4"><div id="g2"></div></div>
				        <div class="col-md-4"><div id="g6"></div></div>
			        </div>
		        </div>
	        </div>
	        <!-- /BOX -->
        </div>
        </div>

</div>
<script type="text/javascript">
    $(document).ready(function () {
        dash_pie();
        pie_chart();
        update_pie(7, 12); update_pie(8, 24); update_pie(9, 36); chart_revenue();
        App.setPage("Home");  //Set current page
        //App.init(); //Initialise plugins and elements
        //alert("hola");
        grafico.init();
        //alert("hola2");
    });
    valor = $("#percent").value;
    
</script>
</asp:Content>
