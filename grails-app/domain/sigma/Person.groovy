package sigma

class Person {
  
	String firstName
	String lastName
	String age
	String address
	static constraints = {
		firstName(blank:false)
		lastName(nullable:false)
		age(blank:false)
		address(blank:false)
	}
	
	
}
