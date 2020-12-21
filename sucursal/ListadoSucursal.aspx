<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="ListadoSucursal.aspx.cs" Inherits="sucursal_ListadoSucursal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- GOOGLE MAPS -->
	<script src="http://maps.google.com/maps/api/js?sensor=true" type="text/javascript"></script>
	<script type="text/javascript" src="../theme/js/gmaps/gmaps.min.js"></script>
    <script type="text/javascript" src="../theme/js/googlemaps.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content" class="col-lg-12">
	<!-- PAGE HEADER-->
	<div class="row">
		<div class="col-sm-12">
			<div class="page-header">
                <!-- /BREADCRUMBS -->
				<div class="clearfix"  style="margin: 20px">
					<h3 class="content-title pull-left padding-top-10">listado Sucursales</h3>
                </div>
            </div>
        </div>
    </div>
    <!-- PAGE BODY-->
<div class="row">
    <div class="col-md-12">
		<div class="row">            
            <div class="col-lg-6">
			    <div class="box border blue">
				    <div class="box-title">
					<h4><i class="fa fa-bars"></i>Accordion</h4>
					<div class="tools">
                    </div>
                </div>                
                    <div class="box-body">
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
								<h3 class="panel-title"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Sucursal #1 </a> </h3>
								</div>
								<div id="collapseOne" class="panel-collapse collapse">
								    <div class="panel-body">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <label id="lbNombre" class="control-label col-lg-4">Fono:</label>
                                            </div>
                                            <div class="row">
                                                <label id="Label1" class="control-label col-lg-4">Mail:</label>
                                            </div>
                                            <div class="row">
                                                <label id="Label2" class="control-label col-lg-4">Dirección:</label>
                                            </div>
                                        </div>
                                    </div>
							    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="box border blue">
		            <div class="box-title">
			            <h4><i class="fa fa-globe"></i>Mapa</h4>
			            <div class="tools">
			            </div>
                    </div>
                    <div class="box-body">
						<div id="gmap_marker" class="gmaps"></div>
					</div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function () {
        MapsGoogle.init(); //Init the google maps
    });
</script>
</asp:Content>

