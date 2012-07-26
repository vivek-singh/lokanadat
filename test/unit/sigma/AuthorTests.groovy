package sigma

import grails.test.*

class AuthorTests extends GrailsUnitTestCase {
	def user
    protected void setUp() {
        super.setUp()
		mockForConstraintsTests(Author)
		
		 user = new User(firstName: 'test')
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {

    }
	
	void testFirstName(){
		user = new User(firstName: 'test')

	assertTrue user.validate()
	}
}
