package sigma

class Image {
	
	String name
	byte[] image

    static constraints = {
		image(nullable:true,maxSize:5000000)
		    }
}
