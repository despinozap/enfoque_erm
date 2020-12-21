<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="NuevaSucursal.aspx.cs" Inherits="sucursal_NuevaSucursal" %>

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
					<h3 class="content-title pull-left padding-top-10">Nueva Sucursal</h3>
                </div>
            </div>
        </div>
    </div>
    <!-- PAGE BODY-->
    <div class="row">
        <div class="col-md-12">
			<div class="row">
				<div class="col-md-6">
                    <form class="form-horizontal" action="#">
                        <div class="form-group">
                            <div class="panel panel-body">
                                <div class="panel-body col-md-12">
                                    <div class="row">
                                        <label id="lbNombre" class="control-label col-lg-4">Nombre:</label>
                                        <asp:TextBox ID="txtNombre" class="text-right col-lg-6" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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

