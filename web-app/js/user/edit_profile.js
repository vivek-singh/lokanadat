$(function() {
	
	
	 $('#styleChange').removeClass('changeClass').addClass('changeAlign');


		  $('#rb-committee-2').click(function() {
		
		    // show the committee selection
		    $(this).siblings(".committeeSelection").show();
		    $(this).siblings(".meetingDescription").hide();
		   
		  });

		  $('#rb-other-3').click(function() {
			
		    $(this).siblings(".committeeSelection").hide();
		    $(this).siblings(".meetingDescription").show();
		    
		  });
		  
		  
		  
	$('#changePasswordBtn').click(function(){
	
		$('.passwordForm').ajaxSubmit({
            dataType:'json',
            success: function(data){
            	var obj = data;
                if (obj.success) {
                   
          
                } else {
                
                }
            }
        });
		return false;
	});	
	
	
	
	
	$('#dialogId').click(function(ev){
		 ev.preventDefault();
		
	    var $dialog = $('<div id="gen_report" style="display:none"></div>').appendTo('body');
	   // $("#message-dialog").html("<p style='text-align: center;'>Allowable image types are: JPG, PNG, GIF</p>");
	      // display the dialog
	      $dialog.dialog({
	        title: 'Report',
	        modal : true,
	        height:   300,
	        width:    300,
	        resizable: true,
	        buttons: {
                "OK" : function() {
                	
                    $.post(contextPath + '/user/renderJson', function(jsonData) {
        		        if (jsonData) {
        		        	$.each(jsonData, function(i, jsonData) { 
        		        		  $('#gen_report').append("<div style ='color:red;font-size:25px;margin-left:20px;margin-top:50px;'>" + '<a href ="#">' + jsonData.FirstName + ""  + jsonData.LastName + '</a>' + "</div>");
        		        		}); 
        		          
        		        } else {
        		           
        		        }
        		      });	
                   
                },
	            "close" : function() {
                  $(this).dialog('close');
          }
            }
	    

	      });
	});
	
	  $("#noteButton").click(function(ev) {
		    ev.preventDefault();
		    var note = $('#noteInput').val()
		    
		    if ($.trim(note) != '') {
		   /* 	$.ajax({
		    	  url: 'user/ajaxPostNote',
		    	  data:{'note':note},
		    	  success: function(data) {
		    		   if (data.success) {
		 		          // clear the old note:
		 		          $('#noteInput').val('');
		 		          
		 		          // add the note item to the list (avoids another round trip to reload the list)
		 		          var $newNote = $(data.html);
		 		          
		 		          $('#existing_notes').append($newNote);
		    	  }
		    		   else{
		    			   alert("=======error========="); 
		    		   }
		    	  }
		    	});*/
		    	
		      $.post(contextPath + '/user/ajaxPostNote', {note:note}, function(jsonData) {
		        if (jsonData.success) {
		          // clear the old note:
		          $('#noteInput').val('');
		          
		          // add the note item to the list (avoids another round trip to reload the list)
		          var $newNote = $(jsonData.html);
		          
		          $('#existing_notes').append($newNote);
		          
		        } else {
		           
		        }
		      });

		    }

		  })
	
	//$("#dialodId").dialog({ autoOpen: false })
		  
		  
 $('#selectBook').change(function(){
	 var id = $(this).val()
	 
	  $.ajax({
	  url: '../user/bookForAuthor',
	  data:{'id':id},
	  success: function(data) {
		if(data.success){
		$('#authorid').html(data.html)
		}
	  }
	});
	 
 })	
 $('#selectAuthor').change(function(){
	 alert($(this).val());
	 
 })	
 
 
 $("#button_Import").button().click(function(ev) {
 
 
 });
	  function showErrors(errors, element) {
		    var errorList = $("<ul>");
		    for (field in errors) {
		      errorList.append("<li>" + errors[field] + "</li>")
		      $('input[name=' + field + ']').addClass('error');
		    }
		    if (!element) {
		      $(".errors").html("").append(errorList).show(500);
		    } else {
		      $(element).html("").append(errorList).show(500);
		    }
		  }
	  
	  
	  
	  
	  
	  
	  $("input[type=button]").click(function(){
             var id = $(this).attr("id");
            // alert($(this).attr("value"));
			$('.personalInfoForm').ajaxSubmit({
	            dataType:'json',
	            url: '../user/updateProfile',
	            data:{'select':id},
	            success: function(response){
	                if (response.success) {
	                   alert("User Updated");
	          
	                } else {
	                	showErrors(response.errors);
	                }
	            }
	        });
			return false;
		  
             
          });
	  
	  $('#email').livequery("blur",function(el) {
		    var curName = $('#email').val()
		    if (curName.trim() != '' && curName.trim().toLowerCase() != el.target.defaultValue.toLowerCase()) {
		      $.getJSON(contextPath + '/user/emailAvailable', {name: curName}, function (data) {
		        var resEl = $('#check-email');
		        if (!data.emailAvailable) {
		          resEl.html('<span style="color:red">Not Available</span>')
		        }
		      });
		    }
		  });
      
	  $('#email').livequery("keydown", function(el) {
		  $("#check-email").empty();
		  });
	  
	  
	 $('.dateRange').livequery("change", function(ev){
	  var fromdate = $('#createdDate').val().trim() 
	  var todate = $('#lastUpdated').val().trim()
	  if(parseDate(todate) >= parseDate(fromdate)){
		    $('#datevalidError').css("display", "none");
	  }else{
		  $('#datevalidError').css("display", "block");
		     $('#datevalidError').html("Invalid date range"); 
	  }
	 }) 
	  
		  
});


function parseDate(input) {
	var parts = input.match(/(\d+)/g);
    return new Date(parts[0], parts[1]-1, parts[2]); // months are 0-based
}
/*function openDialog(){
	alert("----------------------------------")
	$('#dialodId').dialog('open')
	
}*/


    	
    	
    	
        
   


