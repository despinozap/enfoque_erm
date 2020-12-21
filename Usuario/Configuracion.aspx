﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasperPage/skin.master" AutoEventWireup="true" CodeFile="Configuracion.aspx.cs" Inherits="Usuario_Configuracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<!-- STYLESHEETS --><!--[if lt IE 9]><script src="../theme/js/flot/excanvas.min.js"></script><script src="../theme/http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="../theme/http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="../theme/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="../theme/css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="../theme/css/responsive.css" >
	
	<link href="../theme/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- JQUERY UI-->
	<link rel="stylesheet" type="text/css" href="../theme/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="../theme/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- BOOTSTRAP SWITCH -->
	<link rel="stylesheet" type="text/css" href="../theme/js/bootstrap-switch/bootstrap-switch.min.css" />
	<!-- HUBSPOT MESSENGER -->
	<link rel="stylesheet" type="text/css" href="../theme/js/hubspot-messenger/css/messenger.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/hubspot-messenger/css/messenger-spinner.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/hubspot-messenger/css/messenger-theme-air.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/hubspot-messenger/css/messenger-theme-block.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/hubspot-messenger/css/messenger-theme-flat.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/hubspot-messenger/css/messenger-theme-future.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/hubspot-messenger/css/messenger-theme-ice.min.css" />
	<!-- MAGIC SUGGEST -->
	<link rel="stylesheet" type="text/css" href="../theme/js/magic-suggest/magicsuggest-1.3.1-min.css" />
	<!-- DATE PICKER -->
	<link rel="stylesheet" type="text/css" href="../theme/js/datepicker/themes/default.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/datepicker/themes/default.date.min.css" />
	<link rel="stylesheet" type="text/css" href="../theme/js/datepicker/themes/default.time.min.css" />
	<!-- COLOR PICKER -->
	<link rel="stylesheet" type="text/css" href="../theme/js/colorpicker/css/colorpicker.min.css" />
	<!-- FONTS -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="../theme/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="../theme/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="../theme/bootstrap-dist/js/bootstrap.min.js"></script>
	
		
	<!-- DATE RANGE PICKER -->
	<script src="../theme/js/bootstrap-daterangepicker/moment.min.js"></script>
	
	<script src="../theme/js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="../theme/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="../theme/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="../theme/js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- BOOTSTRAP SWITCH -->
	<script type="text/javascript" src="../theme/js/bootstrap-switch/bootstrap-switch.min.js"></script>
	<!-- BOOTBOX -->
	<script type="text/javascript" src="../theme/js/bootbox/bootbox.min.js"></script>
	<!-- HUBSPOT MESSENGER -->
	<script type="text/javascript" src="../theme/js/hubspot-messenger/js/messenger.min.js"></script>
	<script type="text/javascript" src="../theme/js/hubspot-messenger/js/messenger-theme-flat.js"></script>
	<script type="text/javascript" src="../theme/js/hubspot-messenger/js/messenger-theme-future.js"></script>
	<!-- MAGIC SUGGEST -->
	<script type="text/javascript" src="../theme/js/magic-suggest/magicsuggest-1.3.1-min.js"></script>
	<!-- TIMEAGO -->
	<script type="text/javascript" src="../theme/js/timeago/jquery.timeago.min.js"></script>
	<!-- DATE PICKER -->
	<script type="text/javascript" src="../theme/js/datepicker/picker.js"></script>
	<script type="text/javascript" src="../theme/js/datepicker/picker.date.js"></script>
	<script type="text/javascript" src="../theme/js/datepicker/picker.time.js"></script>
	<!-- COLOR PICKER -->
	<script type="text/javascript" src="../theme/js/colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<!-- RATY -->
	<script type="text/javascript" src="../theme/js/jquery-raty/jquery.raty.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="../theme/js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="../theme/js/script.js"></script>
	<script>
	    jQuery(document).ready(function () {
	        App.setPage("elements");  //Set current page
	        App.init(); //Initialise plugins and elements
	    });
	</script>
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
				<ul class="breadcrumb">
					<li>
						<i class="fa fa-home"></i>
						<a href="../theme/index.html">Home</a>
					</li>
					<li>
						<a href="../theme/#">UI Features</a>
					</li>
					<li>Elements</li>
				</ul>
				<!-- /BREADCRUMBS -->
				<div class="clearfix">
					<h3 class="content-title pull-left">Elements</h3>
				</div>
				<div class="description">Common UI Elements and Features</div>
			</div>
		</div>
	</div>
	<!-- /PAGE HEADER -->
	<!-- PAGE MAIN CONTENT -->
	<!-- MODALS -->
	<div class="row">
		<div class="col-md-7">
			<!-- BOX-->
			<div class="box border green">
				<div class="box-title">
					<h4><i class="fa fa-desktop"></i>Modals</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-md-12">
							<div class="text-center">
								<div class="btn-group">
									<a class="btn btn-default basic-alert" href="../theme/#">Basic</a>
									<a class="btn btn-default confirm-dialog" href="../theme/#">Confirm Alert</a>
									<a class="btn btn-default multiple-dialogs" href="../theme/#">Multiple Alerts</a>
									<a class="btn btn-default multiple-buttons" href="../theme/#">Multiple Buttons</a>													
									<a class="btn btn-default programmatic-close" href="../theme/#">Force Close</a>
								</div>
							</div>
							<div class="divide-20"></div>
							<div class="well example-modal">
								<div class="modal">
									<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h4 class="modal-title">Modal title</h4>
										</div>
										<div class="modal-body">
										<p>One fine body&hellip;</p>
										</div>
										<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save changes</button>
										</div>
									</div><!-- /.modal-content -->
									</div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /BOX -->
		</div>
		<div class="col-md-5">
			<!-- COLOR PICKER -->
			<div class="box border inverse">
				<div class="box-title">
					<h4><i class="fa fa-flask"></i>Color Picker</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body" id="color-pickers">
						<form class="form-horizontal " action="#">                  
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							HEX format:
						</label>										   
						<div class="col-md-8">											 
							<input type="text" name="regular" class="form-control colorpicker" value="#FA840E" data-color-format="hex">											 
						</div>										 
						</div>										 
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							RGBa format:
						</label>										   
						<div class="col-md-8">											 
							<input type="text" name="regular" class="form-control colorpicker" value="rgb(45,14,255,0.58)" data-color-format="rgba">											 
						</div>										   
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Using events:
						</label>										   
						<div class="col-md-8">											 
							<a href="../theme/#" class="btn btn-primary btn-block" id="colorpicker-event" data-color-format="hex" data-color="#fff">
							<i class="fa fa-adjust"></i> Change div color
							</a>											 
						</div>										   
						</div>										 
					</form>
				</div>
			</div>
			<!-- /COLOR PICKER -->
			<!-- DATE PICKER -->
			<div class="box border blue">
				<div class="box-title">
					<h4><i class="fa fa-calendar"></i>Date & Time Picker</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
						<form class="form-horizontal " action="#">
						<div class="form-group">
							<label class="col-md-4 control-label">Default datepicker:</label>
							<div class="col-md-8">
								<input  class="form-control datepicker" type="text" name="regular" size="10">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Fullscreen datepicker:</label>
							<div class="col-md-8">
								<input type="text" name="regular" class="form-control datepicker-fullscreen">
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-4 control-label">Fullscreen timepicker:</label>
							<div class="col-md-8">
								<input type="text" name="regular" class="form-control timepicker-fullscreen">
							</div>
						</div>																			
					</form>
				</div>
			<!-- /DATE PICKER -->
			</div>
		</div>
	</div>
	<!-- /MODALS -->
	<div class="separator"></div>
	<!-- TOOLTIPS ETC -->
	<div class="row">
		<!-- TOOLTIPS -->
		<div class="col-md-6">
			<div class="box border inverse">
				<div class="box-title">
					<h4><i class="fa fa-question"></i>Tooltips</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body center">
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
					<button class="btn btn-danger tip-left" title="Tooltip at left">Left</button>
					<button class="btn btn-success tip-right" title="Tooltip at right">Right</button>
					<button class="btn btn-info tip" title="Tooltip at top">Top</button>
					<button class="btn btn-warning tip-bottom" title="Tooltip at bottom">Bottom</button>
				</div>
			</div>			
		</div>
		<!-- /TOOLTIPS -->
		<div class="col-md-6">
			<!-- POPOVERS -->
			<div class="box border">
				<div class="box-title">
					<h4><i class="fa fa-square-o"></i>Popovers</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body center">
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
					<button class="btn btn-primary pop-hover" data-title="Hover" data-content="Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum">On Hover</button>
					<button class="btn btn-danger pop-left" data-title="Left" data-content="Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum">Left</button>
					<button class="btn btn-success pop" data-title="Right" data-content="Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum">Right</button>
					<button class="btn btn-info pop-top" data-title="Top" data-content="Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum">Top</button>
					<button class="btn btn-warning pop-bottom" data-title="Bottom" data-content="Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum">Bottom</button>
				</div>
			</div>
			<!-- /POPOVERS -->
		</div>
	</div>
	<div class="separator"></div>
	<!-- /TOOLTIPS ETC -->
	<div class="row">
		<!-- ALERTS -->
		<div class="col-md-6">
			<div class="box">
				<div class="box-title">
					<h4><i class="fa fa-exclamation"></i>Alerts</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
					<div class="alert alert-block alert-info fade in">
						<a class="close" data-dismiss="alert" href="../theme/#" aria-hidden="true">&times;</a>
							<p><h4><i class="fa fa-check-square-o"></i> All check</h4> and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
					</div>
					<div class="alert alert-block alert-danger fade in">
						<a class="close" data-dismiss="alert" href="../theme/#" aria-hidden="true">&times;</a>
						<h4><i class="fa fa-times"></i> Oh snap! You got an error!</h4>
							<p>Change this and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
							<p>
								<a class="btn btn-danger" href="../theme/#">Undo</a>
								<a class="btn btn-default" href="../theme/#">Ok</a>
							</p>
					</div>
					<div class="alert alert-block alert-success fade in">
						<a class="close" data-dismiss="alert" href="../theme/#" aria-hidden="true">&times;</a>
							<p><h4><i class="fa fa-heart"></i> Successful!</h4> and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit.</p>
					</div>
					<div class="alert alert-block alert-warning fade in">
						<a class="close" data-dismiss="alert" href="../theme/#" aria-hidden="true">&times;</a>
							<p><h4><i class="fa fa-exclamation-circle"></i> Warning</h4> and that and try again. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /ALERTS -->
		<!-- WELLS -->
		<div class="col-md-6">
			<div class="box border red">
				<div class="box-title">
					<h4><i class="fa fa-bitbucket"></i>Wells</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
					<div class="well"><h4>Normal Well</h4> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mi nunc, rutrum quis tincidunt ac. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mi nunc, rutrum quis tincidunt ac  </div>
					<div class="well well-lg"><h4>Large Well</h4> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mi nunc, rutrum quis tincidunt ac </div>
					<div class="well well-sm"><h4>Small Well</h4> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mi nunc, rutrum quis tincidunt ac </div>

				</div>
			</div>
		</div>
		<!-- /WELLS -->
	</div>
	<div class="separator"></div>
						
	<div class="row">
		<!-- MAGIC SUGGEST -->
		<div class="col-md-6">
			<div class="box border orange">
				<div class="box-title">
					<h4><i class="fa fa-check"></i>Autocomplete - Magic Suggest</h4>
					<div class="tools hidden-xs">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
					<h5>Replacing an INPUT field</h5>
					<input id="ms1" type="text" name="ms1"/>
					<div style="clear:both;"></div>
					<h5>Replacing a DIV</h5>
					<div id="ms2"></div>
					<div style="clear:both;"></div>
					<h5>Stacking in bottom, ajax source (type 1 char to load)</h5>
					<input id="ms3" type="text"/>
					<div style="clear:both;"></div>
					<h5>Filter style, right side</h5>
					<input id="ms4" type="text"/>
					<div style="clear:both;"></div>
					<h5>Result as string</h5>
					<input id="ms5" type="text" value="['john@kennedy.com','martin@luther.com']"/>
					<div style="clear:both;"></div>
					<h5>Simple regular combo</h5>
					<input id="ms7" type="text"/>
				</div>
			</div>
		</div>
		<!-- /MAGIC SUGGEST -->
		<div class="col-md-6">
			<!-- AJAX LOADERS -->
			<div class="box border purple">
				<div class="box-title">
					<h4><i class="fa fa-spinner fa fa-spin"></i>Ajax Loaders</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
					<img src="../theme/img/loaders/1.gif">
					<img src="../theme/img/loaders/2.gif">
					<img src="../theme/img/loaders/3.gif">
					<img src="../theme/img/loaders/4.gif">
					<img src="../theme/img/loaders/5.gif">
					<img src="../theme/img/loaders/6.gif">
					<img src="../theme/img/loaders/7.gif">
					<img src="../theme/img/loaders/8.gif">
					<img src="../theme/img/loaders/9.gif">
					<img src="../theme/img/loaders/10.gif">
					<img src="../theme/img/loaders/11.gif">
					<img src="../theme/img/loaders/12.gif">
					<img src="../theme/img/loaders/13.gif">
					<img src="../theme/img/loaders/14.gif">
					<img src="../theme/img/loaders/15.gif">
					<img src="../theme/img/loaders/16.gif">
					<img src="../theme/img/loaders/17.gif">
					<img src="../theme/img/loaders/18.gif">
				</div>
			</div>
			<!-- /AJAX LOADERS -->
			<!-- TIMEAGO -->
			<div class="box border pink">
				<div class="box-title">
					<h4><i class="fa fa-clock-o"></i>Smart Timeago</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
					<div class="alert alert-block alert-info fade in">
						<a class="close" data-dismiss="alert" href="../theme/#" aria-hidden="true">&times;</a>
							<p><strong>Timeago</strong> is a jQuery plugin that makes it easy to support automatically updating fuzzy timestamps (e.g. "4 minutes ago" or "about 1 day ago").</p>
					</div>
						<p>You opened this page <abbr id="curr-time" class="timeago tip" title="" ></abbr></p>
						<p>I went to the doctor <abbr id="yesterday" class="timeago tip" title=""></abbr></p>
						<p>Ryan was born <abbr class="timeago tip" title="Dec 18, 1978">Dec 18, 1978</abbr></p>
				</div>
			</div>
			<!-- /TIMEAGO -->
		</div>
	</div>
	<div class="separator"></div>
	<div class="row">
		<div class="col-md-6">
			<!-- PAGINATION -->
			<div class="box border">
				<div class="box-title">
					<h4><i class="fa fa-exchange"></i>Pagination</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
						<ul class="pagination pagination-lg">
						<li><a href="../theme/#">&laquo;</a></li>
						<li class="active"><a href="../theme/#">1</a></li>
						<li><a href="../theme/#">2</a></li>
						<li><a href="../theme/#">3</a></li>
						<li><a href="../theme/#">4</a></li>
						<li><a href="../theme/#">5</a></li>
						<li><a href="../theme/#">&raquo;</a></li>
					</ul>
					<br/>
					<ul class="pagination">
						<li><a href="../theme/#">&laquo;</a></li>
						<li><a href="../theme/#">1</a></li>
						<li><a href="../theme/#">2</a></li>
						<li><a href="../theme/#">3</a></li>
						<li class="active"><a href="../theme/#">4</a></li>
						<li><a href="../theme/#">5</a></li>
						<li><a href="../theme/#">&raquo;</a></li>
					</ul>
					<br/>
					<ul class="pagination pagination-sm">
						<li><a href="../theme/#">&laquo;</a></li>
						<li><a href="../theme/#">1</a></li>
						<li><a href="../theme/#">2</a></li>
						<li><a href="../theme/#">3</a></li>
						<li><a href="../theme/#">4</a></li>
						<li><a href="../theme/#">5</a></li>
						<li class="active"><a href="../theme/#">&raquo;</a></li>
					</ul>
				</div>
			</div>
			<!-- /PAGINATION -->
		</div>
		<div class="col-md-4">
			<!-- PAGERS -->
			<div class="box border green">
				<div class="box-title">
					<h4><i class="fa fa-exchange"></i>Pagers</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body">
						<ul class="pager">
						<li><a href="../theme/#">Previous</a></li>
						<li><a href="../theme/#">Next</a></li>
					</ul>
										
					<ul class="pager">
						<li class="previous"><a href="../theme/#">&larr; Older</a></li>
						<li class="next"><a href="../theme/#">Newer &rarr;</a></li>
					</ul>
										
					<ul class="pager">
						<li class="previous disabled"><a href="../theme/#">&larr; Older</a></li>
						<li class="next"><a href="../theme/#">Newer &rarr;</a></li>
					</ul>
				</div>
			</div>
			<!-- /PAGERS -->
		</div>
	</div>
	<div class="separator"></div>
	<div class="row">
		<div class="col-md-6">
			<div class="box border blue">
				<div class="box-title">
					<h4><i class="fa fa-dot-circle-o"></i>Jumbotron</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body big">
					<div class="jumbotron">
						<h1>Hello, world!</h1>
						<p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
						<p><a class="btn btn-primary btn-lg" role="button">Learn more</a></p>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">								
			<!-- RATINGS -->
			<div class="box border red">
				<div class="box-title">
					<h4><i class="fa fa-star"></i>Ratings</h4>
					<div class="tools">
						<a href="../theme/#box-config" data-toggle="modal" class="config">
							<i class="fa fa-cog"></i>
						</a>
						<a href="../theme/javascript:;" class="reload">
							<i class="fa fa-refresh"></i>
						</a>
						<a href="../theme/javascript:;" class="collapse">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a href="../theme/javascript:;" class="remove">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="box-body big">
					<form class="form-horizontal " action="#">                  
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Normal:
						</label>										   
						<div class="col-md-8">											 
							<div id="score-demo"></div>											 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Changes the number of stars:
						</label>										   
						<div class="col-md-8">											 
							<div id="number-demo"></div>											 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Read only:
						</label>										   
						<div class="col-md-8">											 
							<div id="readOnly-demo"></div>											 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Half Show:
						</label>										   
						<div class="col-md-8">											 
							<div id="halfShow-true-demo"></div>										 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Cookies:
						</label>										   
						<div class="col-md-8">											 
							<div id="starHalf-demo"></div>											 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Star Off and Star On:
						</label>										   
						<div class="col-md-8">											 
							<div id="star-off-and-star-on-demo"></div>										 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Cancel off and Cancel On:
						</label>										   
						<div class="col-md-8">											 
							<div id="cancel-off-and-cancel-on-demo"></div>									 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Bigger size:
						</label>										   
						<div class="col-md-8">											 
							<div id="size-demo"></div>											 
						</div>										 
						</div>
						<div class="form-group">										   
						<label class="col-md-4 control-label">
							Target Div:
						</label>										   
						<div class="col-md-8">											 
						<div id="target-div-demo" class="target-demo"></div>
						<div id="target-div-hint" class="hint"></div>										 
						</div>										 
						</div>
					</form>
				</div>
			</div>
			<!-- /RATINGS -->
		</div>
	</div>
	<!-- /PAGE MAIN CONTENT -->
	<div class="footer-tools">
		<span class="go-top">
			<i class="fa fa-chevron-up"></i> Top
		</span>
	</div>
</div><!-- /CONTENT-->
</asp:Content>

