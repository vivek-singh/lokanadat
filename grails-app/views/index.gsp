<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
        <style type="text/css">
        
         .tableClass {
         border: 1px Solid;
         width: 40%;
         
         }
        </style>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'ui.all.css')}"/>

        


        

   
    </head>
    <body>
     <div id ="login" style="margin-left:500px;">
      <form id="login-form" action = "user/index" method="Post">
       <table cellspaceing ="5px" cellpadding ="5px" class ="tableClass">
       <tr>
       <td>UserName:</td>
       <td><g:textField name="username"></g:textField></td>
       </tr>
         <tr>
       <td>Password:</td>
       <td><g:passwordField name="password"></g:passwordField></td>
       </tr>
       <tr><td>Date:</td><td><input id="logindate" type="textbox" name = "logindate"/></td></tr>
       <tr>
       <td></td>
       <td><g:submitButton name="login"></g:submitButton></td></tr>
       
       </table>
      </form>
      </div>
      <form>

	

</form>

	  <link rel="stylesheet" href="${resource(dir: 'css', file: 'ui.datepicker.css')}"/>

	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.7.1.js')}"></script>


	
	<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.datepicker.js')}"></script>

	<script type="text/javascript">$(document).ready(function(){

		$("#logindate").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: 'images/icon_cal.png',dateFormat: "yy-mm-dd" });

	});


	</script>
      
      
      

	
	<form>
</form>
   
   </body>
</html>