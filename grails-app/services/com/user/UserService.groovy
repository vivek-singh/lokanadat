package com.user

import com.sigma.AjaxPostResponse
import org.springframework.mail.MailSender
import org.springframework.mail.javamail.JavaMailSenderImpl

import java.text.DateFormat
import java.text.SimpleDateFormat
import com.sigma.User


class UserService  {
	
	def grailsApplication

    static transactional = true
	private int result = 0;

    def serviceMethod() {

    }
	
	
	def preparePostResponse(domainInstance) {
	  def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
	  def postResponse = new AjaxPostResponse(domainObject: domainInstance)
	  if (domainInstance.hasErrors()) {
		g.eachError(bean: domainInstance) {
		  postResponse.errors."${it.field}" = g.message(error: it)
		}
		postResponse.success = false
		postResponse.message = "There was an error"
	  } else {
		postResponse.success = true
		postResponse.message = "Success"
	  }
	  return postResponse
	}
	
	
  def create(def params ){
	
	  
	  def user = new User();
	  
	  SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd")

	  
	  
	  // handle the special case params
	  params.createdDate   = params.createdDate ? format.parse(params.createdDate) : null
	  params.terms   = params.terms ? 'Y' : null
	  user.properties = params
	  
	  if(!user.validate()){
		  def g = grailsApplication.mainContext.getBean('org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib')
		  def postResponse = new AjaxPostResponse(domainObject: user)
		  if (user.hasErrors()) {
			  g.eachError(bean: user) {
				postResponse.errors."${it.field}" = g.message(error: it)
				
			  }
			  postResponse.success = false
			  postResponse.message = "There was an error"
			} else {
			  postResponse.success = true
			  postResponse.message = "Success"
			}
			return postResponse
	      }
	       else{
	  user.save();
	  }
	  
  }
 
   def update(def params)	{
	  
	   
	  return User.executeUpdate("""Update User u set u.firstName='${params.firstName}',u.lastName ='${params.lastName}',
                                   u.email= '${params.email}',u.state ='${params.state}',u.sex ='${params.sex}'   
			                       where u.id = '${params.id}' """)

   }
   
   def delete(def params){
	  
	   return User.executeUpdate("""delete from User u where u.id = '${params.id}'""")
   }

   def getDateInTimeZone(Date currentDate) {
	   
	Calendar cal = Calendar.getInstance();
	
		 }
   
   def autocompleteLookup (String term) {
	   String searchFor = "%${term.toLowerCase()}%"
	   return User.executeQuery("SELECT DISTINCT u.email, u.username " +
	   "FROM User u " +
	   "WHERE LOWER(u.email) LIKE :name " +
		 "OR LOWER(u.username) LIKE :realName " +
	   "ORDER BY u.username ",
	   [name: searchFor, realName: searchFor],
	   [max: 100])
   
	 }


}
