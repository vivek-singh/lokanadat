<%@ page import="java.util.Date; %>
<g:set var="now" value="${new Date()}" />
<g:set var="user" value="WELCOME" />
<g:set var="username" value="${session.getAttribute('username')}" />


<html>
<head>
  <script type="text/javascript">
    contextPath = "${request.contextPath}";
    appVersion = "${grailsApplication.metadata['app.version']}";
  </script>
 
  <title>Edit Profile</title>
  <g:javascript library="application" />
  <g:javascript library="jquery" plugin="jquery"/>
 <g:javascript src="user/edit_profile.js"/>
<g:javascript src="jquery-1.7.1.js"/>
<g:javascript src="jquery-1.7.1.min.js"/>
<g:javascript src="jquery-ui-1.8.15.custom.js"/>
<g:javascript src="jquery-ui-1.8.15.custom.min.js"/>
<g:javascript src="jquery.livequery.js"/>
<g:javascript src="jquery.form.js"/>
<g:javascript src="jquery.metadata.js"/>
 <link rel="stylesheet"  href="${resource(dir: 'css/jquery/kerry-theme', file: 'jquery-ui-1.8.2.custom.css')}"/>
  <link rel="stylesheet" href="${resource(dir: 'css/jquery/thb-theme', file: 'jquery-ui-1.8.2.custom.css')}"/>



</head>
<style type="text/css">
 .changeClass {
 
  float:right;
  text-decoration: underline;
    
 }
 .changeAlign {
 float:left;
  text-decoration: none;
 }
 
 .buttonR input {
    background-color: #AFE8F7;
    background-image: url("../images/button_highlight.png");
    background-repeat: repeat-x;
    border: 1px solid #2FAECF;
    font-family: "bold Arial",Helvetica,sans-serif;
    font-size: 12px;
    font-weight: bold;
    letter-spacing: 1px;
    margin: 2px;
    padding: 2px 8px;
    text-align: center;
    text-decoration: none;
}
 .buttonR input:hover{	color: #FFFFFF; background-color:#12a7cd;}


</style>
<script type="text/javascript">

$(document).ready(function() {

    $("#email").focus().autocomplete({
      minLength: 3,
      cache: false,
      source: "${createLink(controller:'user', action: 'ajaxUserAutocomplete')}",
      focus: function( event, ui ) {
				$( "#email" ).val( ui.item.email );
				return false;
			},
			select: function( event, ui ) {
				$( "#email" ).val( ui.item.email );
				return false;
			}
    })
    .data( "autocomplete" )._renderItem = function( ul, item ) {
          return $( "<li></li>" )
            .data( "item.autocomplete", item )
            .append( "<a>" + item.username + "<br/>" + item.email + "</a>" )
            .appendTo( ul );
        };

    $("#email").blur();  // do not put focus on this field automatically

  });
  
function getId(){

  var id = $('#selectBook').val();
	${remoteFunction(action:'remoteAction',params:'\'id=\'+id+\'&string=\'+true',onSuccess:'updateAuthor(data);')};
	
}

function updateAuthor(data){

	var options = '';
	slctbox = document.getElementById('selectAuthor');
	var l = slctbox.length

	while (l > 0) { 
	l-- 
	slctbox.remove(l)
	}
	for(var i=0 ; i<data.length ; i++)
	{
	    var label = data[i]['address'];
	    var model = data[i]['emailId']; //or whatever the value you want to show
	    var opt = document.createElement('option');
	    slctbox.options.add(new Option(label, model));
	}
	

	  


}

</script>
<script type="text/javascript" charset="utf-8">
jQuery(function($){$('.dateRange').datepicker({showOn: 'both', buttonImage: '${createLinkTo(dir:'images',file:'calendar.gif')}', buttonImageOnly: true,beforeShow: customRange,dateFormat: "yy-mm-dd"});function customRange(input) {return null;}});
</script>
<body>
  <div >

  <div class="page-header"><g:message code ="user.name" args ="${[ user , username ]}" /></div>
  <g:if test="${flash.message}">
  <div><span style="color:red;">${flash.message}</span></div>
  </g:if> 
  <br/>
<div class="errors" style="display:none;"></div>
<div align = "center"> <form style="display:inline"><input type='text' name='email' id='email'/> <input type='submit' value='Switch' style="display:inline"/> </form></div>
<g:form class="personalInfoForm">

<div >
     <table>
         <tbody>
       
            <tr>
              <td valign="top" class="name"><label for='username'>username:<br/><small>(required)</small></label></td>
              <td valign="middle" class="value ${hasErrors(bean:users,field:'username','errors')}">
                <input class="easyinput" type="text" name='username' id="username" value="${users?.username}"/>
                  <g:hasErrors bean="${users}" field="username">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="username" /></div>
				</g:hasErrors>
              </td>

            </tr>
             
             <tr>
              <td valign="top" class="name"><label for='password'>password:<br/><small>(required)</small></label></td>
                 <td valign="middle" class="value ${hasErrors(bean:users,field:'password','errors')}">
                <input class="easyinput" type="text" name='password' id="password" value="${users?.password}"/>
                <g:hasErrors bean="${users}" field="password">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="password" /></div>
				</g:hasErrors>
              </td> 
            </tr>
            
            <tr>
              <td valign='top' class='name'><label for='email'>Email:<br/><small>(required)</small></label></td>
             <td valign="middle" class="value ${hasErrors(bean:user,field:'email','errors')} ">
                <input class="easyinput" id="email" type="text" name='email' value="${users?.email}" />
                      <g:hasErrors bean="${users}" field="email">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="email" /></div>
				</g:hasErrors>
				<span id = "check-email" style = "color:red" ></span>
              </td>
            </tr>
            	<tr> 
						<td valign="top" class="name"><label for="createdDate">Created Date:</label></td>
						<td valign="top">
						<div id = "datevalidError" style ="color:red" ></div>
						<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'ui.datepicker.css')}" />
						<input type="text" class="dateRange" size="15" style="width: 140px; height: 20px;" id="createdDate" name="createdDate" value="${users?.createdDate}"/>
						        <g:hasErrors bean="${users}" field="createdDate">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="createdDate" /></div>
				</g:hasErrors>
						</td>
						</tr>
            <tr>
             	<tr>
						<td valign="top" class="name"><label for="createdDate">Last Updated:</label></td>
						<td valign="top">
						<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'ui.datepicker.css')}" />
						<input type="text" class="dateRange" size="15" style="width: 140px; height: 20px;" id="lastUpdated" name="lastUpdated" value="${users?.lastUpdated}"/>
						        <g:hasErrors bean="${users}" field="lastUpdated">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="lastUpdated" /></div>
				</g:hasErrors>
						</td>
						</tr>
            <tr>
              <td valign='top'><label for='state'>State:</label></td>
             
                <td><g:select name="state" from="${sigma.State?.values()}" optionKey="key" value="${users?.state}"/>
                		        <g:hasErrors bean="${users}" field="state">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="state" /></div>
				</g:hasErrors>
              </td>
            </tr>
                   
                   
            <tr>

              <td valign='top' class='name'><label for='sex'>Sex:</label></td>
             <td>
                <g:radioGroup name="sex" labels="['Male','Female']" values="['M', 'F']" value="${users?.sex}">
                  ${it.label} ${it.radio}
                </g:radioGroup>
                		        <g:hasErrors bean="${users}" field="sex">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="sex" /></div>
				</g:hasErrors>
              </td>
            </tr>
            <tr><td valign="top" class="name"><label for="comment">Comment:<span class="required">*</span></label></td><td  valign="top">
			&nbsp;<textarea rows="5" cols="20" name="comment" style="margin-bottom: 2px; width: 153px; height:50px;">${users?.comment}</textarea>
								        <g:hasErrors bean="${users}" field="comment">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="comment" /></div>
				</g:hasErrors>
						</td></tr>
            <tr> <td>Terms And Conditions:</td><td> <g:checkBox name="terms" value ="${users?.terms}"/><g:hasErrors bean="${users}" field="terms">
					<div class="errors"><g:renderErrors bean="${users}"
						as="list" field="terms" /></div>
				</g:hasErrors></td></tr>
            </tbody>
          </table>


    </div>
  
      </g:form>
            <div class ="buttonR"><input type="button" id="Add" value ="Add" />
<input type="button" id="Edit" value ="Edit" />
<input type="button" id="Delete" value ="Delete" /></div>
<div align = "right"><g:link controller="person">click Me</g:link></div>
 
<div align ="center"><g:select id="selectBook" from="${booklist}" value=""  optionKey="id" optionValue="bookName" onchange ="getId()"></g:select></div>
<div align ="center"><g:select id="selectAuthor" from="${authorlist}" value=""  optionKey="id" optionValue="firstName"></g:select></div>
      


</div>

    <div>
 
      <g:uploadForm action='uploadProfileImage' class="profileImageForm">
       
        <div>
          <div>Change Your Avatar</div>
          <table>
            <tbody>
            
               <tr>
              <td valign="top" class="name"><label for='name'>First Name:<br/><small>(required)</small></label></td>
              <td valign="middle" class="value ">
                <input type="text" name='name' id="name" value=""/>
              </td>

            </tr>
            <tr>
              <td valign='top'  rowspan="4"><label for='avatar'>Picture:<br/><small>(jpg,gif,png, 5 MB Max)</small></label></td>
              <td valign='middle' class='value' rowspan="4">
             
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      
      </g:uploadForm>
    </div>


<button id = "dialogId" name="dialog">dialog</button>

   <div id ="styleChange" class="changeClass">
      <div class="section-header">. Select Type</div>

      <input id="rb-board-1"      type="radio" name="type" value=""/>BOARDMEETING
      <input id="rb-committee-2"  type="radio" name="type" value=""/>Committee 
      <input id="rb-other-3"      type="radio" name="type" value=""/>other


      <div class="committeeSelection" style="display:none">
        <strong>a. Select Committee:</strong>
        <select name='committee.id' id="committee_selector">
        <option value="1">
         <option value="2">
          <option value="3">
           <option value="3">
        </select>
      </div>

      <div class="meetingDescription" style="display:none">
        <strong>a. Description:</strong> <input type="text" name="name" value="">
      </div>
    </div>
        <div>

      
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
    <div style ="float:right;margin-right:100px;">
<table><tr><td><div id ="bookid"><g:select id="selectBook" from="${booklist}" value=""  optionKey="id" optionValue="bookName"></g:select></div></td>
<td><div id ="authorid"><g:select id="selectAuthor" name="authorlist" from="${authorlist}" value="" optionKey="id" optionValue="firstName" /></div></td>
</tr> 

</table>
</div>
        <div id="notes" style ="float:right;">
      <div id="existing_notes">
        <g:render template="notes" collection=""/>
      </div>
      <div id="notes_controls">
        <div><g:textArea type="text" name="noteInput" id="noteInput" rows="2" cols="26"/></div>
            <span class="caption">Notes</span>
            <button id="noteButton">Post</button>
      </div>
    </div>
     <div class=''>Date ::<vivek:fullDate date ="${now}" /></div>
</body>
</html>


