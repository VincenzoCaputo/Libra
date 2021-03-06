<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


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
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Libra</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- chartist CSS -->
    <link href="assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
    <link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <link href="assets/plugins/css-chart/css-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/red.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.2.min.js"></script>





 

</head>


<body>



<script type="text/javascript">
$(document).ready(function() {

  $("#bottoneSubmit").click(function(){
	  	var semaforo = false;  
	
	    var nome = $('#nome').val();
		var cognome = $('#cognome').val();
		var matricola = $('#matricola').val();
		var email = $('#email').val();
		var password = $('#password').val();
		var password1 = $('#password1').val();
		var dataNascita = $('#dataNascita').val();
		var indirizzo = $('#indirizzo').val();
		var telefono = $('#telefono').val();

		
			
		if(verificaStringa(nome)){
			if(verificaStringa(cognome)){
				if(controllo_data(dataNascita)){
					if(verificaEmail(email)){
							if(matricola!=""&&matricola.length==10){
								if(verificaFormatoMatricola(matricola)){
									if(verificaFormatoPassword(password)){
											if(password==password1){
														semaforo = true;
											}
											else{
												alert("Le due password inserite non coincidono");
												}
											}	
										}
					
					else{
							alert("La matricola puo' iniziare con i seguenti prefissi:05121,05225,05122");
						}
							}
							else{
								alert("La matricola deve contenere 10 caratteri numerici");
								}
						}
					else{
						alert("Formato e-mail non corretto");
						}
				}
				else{
					alert("Inserire una data corretta");
			
					}
			}
  }

		
		
		
if(semaforo==true){
    $.ajax({

      type: 'POST',

      url: 'registrazione',

      data: "nome= "+ nome + "&cognome=" + cognome + "&matricola=" + matricola + "&email="+ email+"&password="+password+"&dataNascita="+dataNascita+"&indirizzo="+indirizzo+"&telefono="+telefono,

	  async:false,

      complete: function(r)
      {
    	  alert(r.responseText);
    	  if(r.responseText.includes("successo")){
    	 	 window.location.href = "home.jsp";
    	  }
    	  $('#nome').val("");
    	  $('#cognome').val("");
    	  $('#matricola').val("");
    	  $('#email').val("");
    	  $('#password').val("");
    	  $('#password1').val("");
    	  $('#dataNascita').val("");
    	  $('#indirizzo').val("");
    	  $('#telefono').val("");
      }
      
    });
}
  });
  
});


function verificaStringa(nome){
	return (nome!=""&&nome.length>1&&nome.length<21);
	}

function verificaEmail(email){
	return (email!=""&&email.includes("@")&&email.length>19&&email.lastIndexOf("@")<email.length);
	}

function verificaFormatoMatricola(matricola){
	return (matricola.substring(0,5)=="05121"||matricola.substring(0,5)=="05225"||matricola.substring(0,5)=="05122");
	}

function verificaFormatoPassword(password){
	return (password!=""&&password.length>7&&password.length<21&&password1!="");
	}
	
function controllo_data(stringa){
		if(stringa!=""){
			var annoInput = parseInt(stringa.substr(0,4));
			var meseInput = parseInt(stringa.substr(5,7));
			var giornoInput = parseInt(stringa.substr(8,10));

			var data = new Date();
			var dataInput = new Date(stringa);

			if(data>=dataInput){
				return true;
				}
			else{
				return false;
				}
		}else{
			return false;
		}
    }
</script>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
 
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <section id="wrapper" class="login-register login-sidebar"  style="background-image:url(assets/images/background/sfondo.jpg);">
  <div class="login-box card">
    <div class="card-block">
      <form class="form-horizontal form-material" id="registrazione" >
        <a href="javascript:void(0)" class="text-left db"><img src="assets/images/logo-icon.png" alt="" width="15%" height="20%" class="dark-logo"  /></a> 
        <h3 class="box-title m-t-40 m-b-0">REGISTRATI</h3><small>Benvenuto su Libra</small> 
        <div class="row">
          <div class="col">
          <br>
            <input class="form-control" type="text" required=""  placeholder="Nome" id="nome" name="nome" maxlength="20" minlength="2">
          </div>
          <div class="col">
          <br>
            <input class="form-control" type="text" required="" placeholder="Cognome" id="cognome" name="cognome"   maxlength="20" minlength="2">
          </div>
        </div>
        <br>
        <div class="form-group ">
          <div class="col-xs-12">
            <input class="form-control" type="date" required="" placeholder="Data nascita" id="dataNascita" name="dataNascita">
          </div>
        </div>
        <div class="form-group ">
          <div class="col-xs-12">
            <input class="form-control" type="email" required="" placeholder="E-mail" id="email" name="email" maxlength="50" minlength="19">
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-12">
            <input class="form-control" type="number" required="" placeholder="Matricola" id="matricola" name="matricola">
          </div>
        </div>
        
        <div class="row ">
          <div class="col">
            <input class="form-control" type="password" required="" placeholder="Password" id="password" name="password" maxlength="20" minlength="8" pattern="[A-Za-z0-9]{8,20}$">
          </div>
          <div class="col">
            <input class="form-control" type="password" required="" placeholder="Confirm Password" id="password1" name="password1"  pattern="[A-Za-z0-9]{8,20}$">
          </div>
        </div>
        <br>
        
         <div class="form-group ">
          <div class="col-xs-12">
            <input class="form-control" type="text"  placeholder="Indirizzo" id="indirizzo" name="indirizzo">
          </div>
        </div>
         <div class="form-group ">
          <div class="col-xs-12">
            <input class="form-control" type="number" placeholder="Telefono" id="telefono" name="telefono" length="10">
          </div>
        </div>
        
        
        <div class="form-group text-center m-t-20">
          <div class="col-xs-12">
            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" id="bottoneSubmit">Sign Up</button>
          </div>
        </div>
        <div class="form-group m-b-0">
          <div class="col-sm-12 text-center">
            <p>Hai gi� un account? <a href="home.jsp" class="text-info m-l-5"><b>Accedi</b></a></p>
          </div>
        </div>
      </form>
    </div>
  </div>
</section>
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
</body>


</html>


