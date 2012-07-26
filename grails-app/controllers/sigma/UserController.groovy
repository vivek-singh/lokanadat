package sigma

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import java.util.regex.Pattern as Pattern
import java.text.DateFormat
import java.text.SimpleDateFormat


import com.sigma.User
import com.user.UserService;

import grails.converters.JSON

class UserController {


	
	def userService
	


    def index = {
		
		def now = new Date()
		def user = new User()
		
		Map listtoMap = [:]
		session.setAttribute("username" ,params.username )
		request.setAttribute("username" ,params.username )
		//def booklist = Book.list(sort:"bookName")
		def booklist = Book.list()
		
		def authorlist = Author.list()
	
		booklist.collect { book ->
			
			listtoMap["books"] = [BookName:book.bookName,Price:book.price]
			
		}
	
       // def authorlist = Author.list(sort:"firstName")
	    authorlist.collect { author ->
			listtoMap["authors"] = [AuthorName:author.firstName,LastName:author.lastName,EmailId:author.emailId]
			
		}
		//println("================="+listtoMap["books"].BookName)
	   // flash.message = "Login successfully" */
	     render(view : "editProfile", model:[booklist:booklist,authorlist:authorlist,listtoMap:listtoMap,users:user])	
	    
		 }
	
	def updateProfile = {
		
	
		def response = [success:false]
	
	  def data
	  //String newPass = "12345623"
	 // boolean b = Pattern.matches("[a-zA-Z0-9]*", newPass);
	 
	  if(params.select == 'Add'){
	  data = userService.create(params)
	 // userService.sendNotification()
	  // response = [success:true]
	  render data as JSON
		  
	  }else if(params.select == 'Edit'){
	  data = userService.update(params)
	   response = [success:true]
	  }
	  else{
		  data = userService.delete(params)
          response = [success:true]
	  }

	 
		
	}
	
	def uploadProfileImage ={
    println("============================");
     def image = new Image()
	 image.name = params.name
	 if(request instanceof MultipartHttpServletRequest) {
		
		 
	
	 MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
	 CommonsMultipartFile file = (CommonsMultipartFile)multiRequest.getFile("image");
	 if(!file.empty){
	 String filePath = "E:/Sigma/UploadedImages/" + file.getOriginalFilename(); 
	 
	 File dest = new File(filePath);
	 dest.mkdirs();
	 file.transferTo(dest);
	 }
	 image.image = file.bytes // screenshot is the image blob field of the record
	 }
	 image.save()
	 

		render(view : "list")
	}
	
def changePassword = {

	Map postResponse = [success:false]
	def person = new Person()
	person.properties = params
	if(person.validate()){
	   person.save()
	   postResponse.success = true
	   
		}
   
   render postResponse as JSON
	
	if(!person.validate()){
		person.errors.each{
			println it
		}
	}
	else{
		person.save(flush:true)
	}
		
}

def ajaxPostNote = {
	Map postResponse = [success:false]
	def notes = new Notes()
	notes.note = params.note
	if(notes.validate()){
	   notes.save()
	   postResponse.success = true
	   postResponse.html = g.render(template : 'notes', bean :notes)
	
		}
   
   render postResponse as JSON

}

def bookForAuthor = {
	Map postResponse = [success:false]
	def book = Book.get(params.id)
	def authorlist = []
	  authorlist << book.author
	  postResponse.html = g.render(template : 'bookForAuthor', model :[authorlist:authorlist])
	  postResponse.success = true
	  // return [authorlist:authorlist]
	  render postResponse as JSON
	}

def renderJson = {
	
	def authorlist = Author.list()
	List authorList = []
	authorlist.each { author ->
		
		authorList << [FirstName:author.firstName,LastName:author.lastName,Email:author.emailId]
	}

	render authorList as JSON
}

def remoteAction = {
	def book = Book.get(params['id'])
	
	def authorlist = []
	authorlist << book.author
	
	render authorlist as JSON
	
}

def emailAvailable = {
	def model = [emailAvailable:false]
    def user = User.findByEmail(params.name)
	if(!user){
	    model = [emailAvailable:true]
	}
	
	render model as JSON
}

def ajaxUserAutocomplete = {
	def jsonData = []
	
		if (params.term?.length() > 2) {
		  def results = userService.autocompleteLookup(params.term)
	
		  for (result in results) {
			jsonData << [email: result[0], username:result[1]]
		  }
		}
	
		render text: jsonData as JSON
}
}