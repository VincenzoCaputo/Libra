<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="it.unisa.libra.model.dao.IStudenteDao"%>
<%@ page import="it.unisa.libra.model.dao.IAziendaDao"%>
<%@ page import="it.unisa.libra.model.dao.IProgettoFormativoDao"%>
<%@ page import="it.unisa.libra.model.dao.IUtenteDao"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="it.unisa.libra.bean.ProgettoFormativo"%>
<%@ page import="it.unisa.libra.bean.Studente"%>
<%@ page import="it.unisa.libra.bean.Azienda"%>
<%@ page import="it.unisa.libra.bean.TutorInterno"%>
<%@ page import="it.unisa.libra.bean.Presidente"%>
<%@ page import="it.unisa.libra.bean.Utente"%>
<%
	IStudenteDao studenteDao = (IStudenteDao) new InitialContext().lookup("java:app/Libra/StudenteJpa");
	IProgettoFormativoDao progettoFormativoDao = (IProgettoFormativoDao) new InitialContext()
			.lookup("java:app/Libra/ProgettoFormativoJpa");
	IAziendaDao aziendaDao = (IAziendaDao) new InitialContext().lookup("java:app/Libra/AziendaJpa");
	
	int numeroStudenti = studenteDao.contaOccorrenze();
	int numeroProgettiFormativi = progettoFormativoDao.contaOccorrenze();
	int numeroAziende = aziendaDao.contaOccorrenze();
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>Libra</title>
<!-- Bootstrap Core CSS -->
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- chartist CSS -->
<link href="assets/plugins/chartist-js/dist/chartist.min.css"
	rel="stylesheet">
<link href="assets/plugins/chartist-js/dist/chartist-init.css"
	rel="stylesheet">
<link
	href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css"
	rel="stylesheet">
<link href="assets/plugins/css-chart/css-chart.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/style.css" rel="stylesheet">
<!-- You can change the theme colors from here -->
<link href="css/colors/red.css" id="theme" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar card-no-border">
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none"
				stroke-width="2" stroke-miterlimit="10" /> </svg>
	</div> 
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<%@ include file="header.jsp"%>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<%@ include file="menu.jsp"%>
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="row">
					<!-- Column -->
					<div class="col-lg-6">

						<div class="card">
						<div class="row page-titles">
					<div class="col-md-6 col-8 align-self-center">
					<h3 class="text-themecolor m-b-0 m-t-0"></h3>
					<h3 class="text-themecolor m-b-0 m-t-0" align="right" ></h3>
					<h2 class="text-themecolor m-b-0 m-t-0" style="padding-left:3%" style="padding-top:3%" >LISTA STUDENTI</h2>
					
						
					</div>
				</div>
						<div class="card wizard-card" style="padding:1%">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Cognome</th>
												<th>Nome</th>
												<th>E-mail</th>
												<th>Matricola</th>
								</tr>
							</thead>
							<tbody>
							<%
											List<Studente> listaStudenti = studenteDao.listaOrdinataPerCognome();
											if (listaStudenti != null && listaStudenti.size() > 0) {
												for (Studente iscritto : listaStudenti) {
										%>
										
								<tr>
												<%
													if (iscritto != null && iscritto.getCognome() != null) {
												%>
												
												<td><h6><%=iscritto.getCognome()%></h6></td>
												<%
													} else {
												%>
												<td><h6>Non disponibile</h6></td>
												<td><span><</span></td>
												<%
													}
															if (iscritto != null && iscritto.getNome() != null) {
												%>
												<td>
													<h6>
														<%=(iscritto.getNome())%></h6>
												</td>
												<%
													} else {
												%>
												<td>
													<h6>Non disponibileee</h6>
												</td>
												<%
													}
															if (iscritto.getUtenteEmail() != null) {
												%>
												<td>
													<h6>
														<%=(iscritto.getUtenteEmail())%></h6>
												</td>
												<%
													} else {
												%>
												<td>
													<h6>Non disponibile</h6>
												</td>
												<%
													}
															if (iscritto.getMatricola() != null) {
												%>
												<td><span class="label label-light-success"><%=iscritto.getMatricola()%></span></td>
												<%
													} else {
												%>
												<td>
													<h6>Non disponibile</h6>
												</td>
												<%
													}
												%>

											</tr>
											<%
												}
													
												}
											%>
							</tbody>
						</table>
					</div>
				</div>
							
						</div>
					</div>

					<div class="col-lg-6">
						<!-- Row -->
						<div class="row">
							<!-- Column -->
							<div class="col-sm-6">
								<div class="card card-block">
									<!-- Row -->
									<div class="row p-t-10 p-b-10">
										<!-- Column -->
										<div class="col p-r-0">
											<h1 class="font-light"><%=numeroStudenti%></h1>
											<h6 class="text-muted">Studenti iscritti alla
												piattaforma</h6>
										</div>
										<!-- Column -->
										<div class="col text-right align-self-center">
											<div data-label="20%"
												class="css-bar m-b-0 css-bar-primary css-bar-20">
												<i class="mdi mdi-receipt"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Column -->
							<div class="col-sm-6">
								<div class="card card-block">
									<!-- Row -->
									<div class="row p-t-10 p-b-10">
										<!-- Column -->
										<div class="col p-r-0">
											<h1 class="font-light"><%=numeroProgettiFormativi%></h1>
											<h6 class="text-muted">Progetti formativi</h6>
										</div>
										<!-- Column -->
										<div class="col text-right align-self-center">
											<div data-label="30%"
												class="css-bar m-b-0 css-bar-danger css-bar-20">
												<i class="mdi mdi-receipt"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Column -->
							<div class="col-sm-6">
								<div class="card card-block">
									<!-- Row -->
									<div class="row p-t-10 p-b-10">
										<!-- Column -->
										<div class="col p-r-0">
											<h1 class="font-light"><%=numeroAziende%></h1>
											<h6 class="text-muted">Aziende convenzionate</h6>
										</div>
										<!-- Column -->
										<div class="col text-right align-self-center">
											<div data-label="40%"
												class="css-bar m-b-0 css-bar-warning css-bar-40">
												<i class="mdi mdi-receipt"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->

			<!-- footer -->
			<!-- ============================================================== -->
			<%@ include file="footer.jsp"%>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script src="assets/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="assets/plugins/bootstrap/js/tether.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script src="js/jquery.slimscroll.js"></script>
	<!--Wave Effects -->
	<script src="js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="js/sidebarmenu.js"></script>
	<!--stickey kit -->
	<script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
	<!--Custom JavaScript -->
	<script src="js/custom.min.js"></script>
	<script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
	<script src="js/datatables.js"></script>
	<script>
		var table;
		$(document).ready(function() {
			table = $('.table').DataTable({
				"paging": true,
				"searching": true,
				"pageLength": 10,
				"columnDefs": [	
					{ "searchable": true, "targets": 0 },
					{ "searchable": true, "targets": 1 },
					{ "searchable": true, "targets": 2 },
					{ "searchable": true, "targets": 3 },
				  ],
				"language": {
		            "lengthMenu": "Mostra _MENU_ risultati per pagina",
		            "zeroRecords": "Nessun risultato trovato",
		            "info": "Pagina _PAGE_ di _PAGES_",
		            "infoEmpty": "Nessun risultato presente",
		            "infoFiltered": "(Cercati su _MAX_ risultati totali)",
		            "paginate": {
		                "first":      "Prima",
		                "last":       "Ultima",
		                "next":       "Successiva",
		                "previous":   "Precedente"
		            }
			    },
				"initComplete" : function() {
					$(".dataTables_filter").empty();
					$(".dataTables_filter").html(
						'<div class="input-group add-on">'+
						'<input class="form-control" placeholder"Cerca" name="srch-term" id="srch-term" type="text">'+
							'<div class="input-group-btn">'+
								'<button class="btn btn-default buttonSearch">'+
									'<i class="mdi mdi-magnify"></i>'+
								'</button>'+
							'</div>'+
						'</div>');
					var input= $('.dataTables_filter input');
					self= this.api();
					$(".buttonSearch").mouseenter(function(){
						$(this).css({'background-color': '#D91A5F'});	
					})
					$(".buttonSearch").mouseleave(function(){
						$(this).css({'background-color':'#DDDDDD'});	
					})
					$(".buttonSearch").click(function(){
						var text= input.val();
						$(this).css({'outline':'none', 'box-shadow':'none'});
						$('.text-danger').remove();
						if(/^([0-9a-zA-Z\s@:./]{0,100})$/.test(text)==false){
							$('.dataTables_filter').append('<small class="text-danger">Input errato. Sono ammessi solo caratteri</small>');
						}else{
							self.search(input.val()).draw();
						}
					})
				}
					
			});
		});
		
		
	</script>
	<!-- ============================================================== -->
	<!-- This page plugins -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Style switcher -->
	<!-- ============================================================== -->
	<script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>


