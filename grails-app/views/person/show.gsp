<html>
<title>Create Person</title>
<body>
           <g:if test="${flash.message}">
            <div class="Errortext"><li>${flash.message}</li></div>
            </g:if>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    FirstName:
                                </td>
                                <td>
                                 ${person.firstName}
                                </td>
                            </tr> 
                    
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    lastName:
                                </td>
                                <td> ${person.lastName}
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    age:
                                </td>
                                    <td>${person.age} 
                                </td>
                            </tr>
                                  <tr class="prop">
                                <td valign="top" class="name">
                                    address:
                                </td>
                                    <td>${person.address} 
                                </td>
                            </tr>  
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${person?.id}" />
                    <span class="button"><g:actionSubmit  action = "edit" value = "edit"/></span>
     
                   <!-- <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>-->
                </g:form>
            </div>
         
            </body>
            </html>