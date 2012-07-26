<html>
<title>Create Person</title>
<body>
<g:form action="save" method="post">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    FirstName:
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'firstName','errors')}">
                                    <input type="text" maxlength="30" id="firstName" name="firstName" value="${fieldValue(bean:person,field:'firstName')}"/>
                                    <g:hasErrors bean="${person}" field="firstName">
						            <div class="Errortext">
						                <g:renderErrors bean="${person}" as="list" field="firstName"/>
						            </div>
						            </g:hasErrors>
                                </td>
                            </tr> 
                    
                          <tr class="prop">
                                <td valign="top" class="name">
                                    lastName:
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:person,field:'lastName','errors')}">
                                    <input type="text" id="lastName" name="lastName" value="${fieldValue(bean:person,field:'lastName')}"/>
                                    <g:hasErrors bean="${person}" field="lastName">
						            <div class="Errortext">
						                <g:renderErrors bean="${person}" as="list" field="lastName"/>
						            </div>
						            </g:hasErrors>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    age:
                                </td>
                                    <td valign="top" class="value ${hasErrors(bean:person,field:'age','errors')}">
                                    <input type="text" maxlength="100" id="age" name="age" value="${fieldValue(bean:person,field:'age')}"/>
                                      <g:hasErrors bean="${person}" field="age">
						            <div class="Errortext">
						                <g:renderErrors bean="${person}" as="list" field="age"/>
						            </div>
						            </g:hasErrors>
                                </td>
                            </tr>
                                  <tr class="prop">
                                <td valign="top" class="name">
                                    address:
                                </td>
                                    <td valign="top" class="value ${hasErrors(bean:person,field:'address','errors')}">
                                    <input type="text" maxlength="100" id="address" name="address" value="${fieldValue(bean:person,field:'address')}"/>
                                      <g:hasErrors bean="${person}" field="address">
						            <div class="Errortext">
						                <g:renderErrors bean="${person}" as="list" field="address"/>
						            </div>
						            </g:hasErrors>
                                </td>
                            </tr>  
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
            </body>
            </html>