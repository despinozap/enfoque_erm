<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="Usuario_Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="content" class="col-lg-12">
    <!-- PAGE HEADER-->
    <div class="row">
	    <div class="col-sm-12">
		    <div class="page-header">
			    <div class="clearfix"  style="margin: 20px">
				    <h3 class="content-title pull-left padding-top-10"><i class="fa fa-user text-green"></i> Perfil</h3>
			    </div>
		    </div>
	    </div>
    </div>
    <!-- /PAGE HEADER -->
    <!-- Case -->
    <div class="row">
        <div class="col-md-12">
	        <!-- BOX -->
	        <div class="box border blue col-lg-offset-2 col-md-8">
		        <div class="box-title">
			        <h4><i class="fa fa-user"></i> Datos Perfil</h4>
		        </div>
		        <div class="box-body">
                    <div class="tabbable">
                        <ul class="nav nav-tabs">
							<li class="active"><a href="#info" data-toggle="tab"><i class="fa fa-book"></i> <span class="hidden-inline-mobile">Información</span></a></li>
							<li><a href="#datos" data-toggle="tab"><i class="fa fa-user"></i> <span class="hidden-inline-mobile">Datos Cuenta</span></a></li>
						</ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="info"> 
                            </div>
                            <div class="tab-pane" id="datos">                                
                                <form class="form-horizontal" action="#">
                                    <div class="form-group">
                                        <asp:Label ID="lbUsuario" runat="server" class="control-label col-md-4" Text="Usuario"></asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtUsuario" runat="server" class="form-control" placeholder="Ingrese Usuario"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" class="control-label col-md-4" Text="Usuario"></asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Ingrese Usuario"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" class="control-label col-md-4" Text="Usuario"></asp:Label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Ingrese Usuario"></asp:TextBox>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>                      
                    </div>                    
		        </div>
	        </div>
	        <!-- /BOX -->
        </div>
        </div>
</div>
</asp:Content>

