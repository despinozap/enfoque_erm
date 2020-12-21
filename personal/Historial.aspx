<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Historial.aspx.cs" Inherits="personal_Historial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<!-- FULL CALENDAR -->
	<script type="text/javascript" src="../theme/js/fullcalendar/fullcalendar.min.js"></script>
    <script src="../Resources/calendario/JScalendario.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content" class="col-lg-12">
	<!-- PAGE HEADER-->
	<div class="row">
		<div class="col-sm-12">
			<div class="page-header">
                <!-- /BREADCRUMBS -->
				<div class="clearfix"  style="margin: 20px">
					<h3 class="content-title pull-left padding-top-10">Historial</h3>
                </div>
            </div>
        </div>
    </div>
    <!-- PAGE BODY-->
    <div class="row">
        <div class="col-md-12">
			<div class="row">
                <div class="col-lg-5">
                    <div class="box border text-dark pink">
                        <div class="box-title">
	                        <h4><i class="fa fa-calendar"></i>Calendario</h4>
	                        <div class="tools">
                                <asp:DropDownList ID="ddlSucursales" runat="server" class="green"></asp:DropDownList>
	                        </div>
                        </div>
                        <div class="box-body">
	                        <div class="row">
		                        <div class="col-md-12">
			                        <div id='calendar'></div>
		                        </div>
	                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
            <div class="row">                                                
                <div class="box border purple">
                    <div class="box-title">
	                    <h4><i class="fa fa-bars"></i>Atenciones</h4>
	                    <div class="tools">
	                    </div>
                    </div>
                    <div class="box-body">
			            <div class="row">
                            <div class="col-md-12">
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
        </div>       
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        calendario.init(); //Initialise plugins and elements
    });    
</script>
</asp:Content>

