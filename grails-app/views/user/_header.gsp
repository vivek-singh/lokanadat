<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>da</title>
		
		 <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-1.7.3.custom.css')}"/>
		 	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.7.1.min.js')}"></script>
		 	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-ui-1.8.15.custom.min.js')}"></script>
		 <div style ="margin-top:-50px;">	  <img src="${resource(dir: 'images', file: 'CloudBanner.jpg')}" /></div>
          <div style="margin-left:-50px;margin-top:-60px;">  <img src="${resource(dir: 'images', file: 'surgery.png')}" /></div>
          
		<script type="text/javascript">
			$(function(){

				// Tabs
				$('#tabs').tabs();



			});
		</script>
		<style type="text/css">
			/*demo page css*/
			body{ font: 62.5% "Trebuchet MS", sans-serif; margin: 50px;}
			.demoHeaders { margin-top: 2em; }
			#dialog_link {padding: .4em 1em .4em 20px;text-decoration: none;position: relative;}
			#dialog_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
			ul#icons {margin: 0; padding: 0;}
			ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
			ul#icons span.ui-icon {float: left; margin: 0 4px;}
			.tabs {
			width:1315px;
			}
			.back {
			border :0px;
			background:none;
			}
		</style>
	</head>
	<body>
	

		
	
		<div id="tabs" class ="tabs back">
			<ul>
				<li><a href="#tabs-1">First</a></li>
				<li><a href="#tabs-2">Second</a></li>
				<li><a href="#tabs-3">Third</a></li>
			</ul>
			<div id="tabs-1">
			 <g:form action='changePassword' class="passwordForm">
   

        <div>
         
          <table>
            <tbody>
            
            <tr>
              <td valign='top' class='name'><label for='username'>Username:<br/><small>(required)</small></label></td>
             <td>
              <input name="username" id="username" type="text" style="width:198px;"/>
              </td>

            </tr>
            <tr>
            <td valign='top' class='name'><label for='password'>Password:<br/><small>(required)</small></label></td>
             <td> <input class="easyinput" type="password" id="password" name='password' style="width:198px;"/>
            </td>
            
            </tr>
          </table>
      
        </div>
      </g:form>
			
			
			
			
			
			</div>
			<div id="tabs-2">2x</div>
			<div id="tabs-3">3</div>
		</div>

	

	</body>
</html>


