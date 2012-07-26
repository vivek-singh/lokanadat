package sigma



class Book {
	

	String bookName
	Double price

    static constraints = {
    }
	
	static mapping ={
		version false
		id column : "book_id"
	}
	
	static belongsTo = [author:Author]
	
	
	
	
}
