package sigma

class Author {
	
	String firstName
	String lastName 
	String address
	String emailId
	
	

    static constraints = {
		firstName size:1..15
    }
	static mapping = {
		version false
		id column : 'author_id'
	}
	
	static hasMany = [book:Book]
	
	def getName(){
		
	}
	
}
