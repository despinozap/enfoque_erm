<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="cierreCaja.aspx.cs" Inherits="personal_cierreCaja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content" class="col-lg-12">
	<!-- PAGE HEADER-->
	<div class="row">
		<div class="col-sm-12">
			<div class="page-header">
                <!-- /BREADCRUMBS -->
				<div class="clearfix"  style="margin: 20px">
					<h3 class="content-title pull-left padding-top-10">Cierre Caja</h3>
                </div>
            </div>

        </div>
    </div>
    <!-- PAGE BODY-->
    <div class="row">
        <div class="col-md-12">
			<div class="row">
				<div class="col-lg-6">
                    <div class="box border pink">
		                <div class="box-title">
			                <h4><i class="fa fa-bars"></i>Sucursales</h4>
			                <div class="tools">
                                <asp:LinkButton runat="server" ID="btnBuscar" class="btnBuscar search" 
                                    onclick="btnBuscar_Click">
									<i class="fa fa-search search"></i><span style="font-family:'Open Sans';"> Buscar</span>
								</asp:LinkButton>
			                </div>
                        </div>
                        <div class="box-body">
			                    <div class="row">
                                </div>
                            </div>
                    </div>
		        </div>
                <div class="col-lg-6">
                    <div class="box border blue">
		                <div class="box-title">
			                <h4><i class="fa fa-bars"></i>Información Cierre</h4>
			                <div class="tools">
			                </div>
                        </div>
                        <div class="box-body">
			                    <div class="row">
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".btnBuscar").click(function () {
        alert("hola");
    });
</script>
</asp:Content>

