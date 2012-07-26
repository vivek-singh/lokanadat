package sigma

class PersonController {

	// the delete, save and update actions only accept POST requests
	def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']
	
    def index = {
		redirect(action : 'create')
		 }
	
	def create = {
		
	def person = new Person()
	person.properties = params	
	render(view: 'create', model: [person: person])
		
	}
	
	def save = {
		println("=============="+params)
		def person = new Person(params)
		if (!person.hasErrors() && person.save()) {
		  flash.message = "Person ${person.id} created"
		  redirect(action: show, id: person.id)
		}
		else {
		  render(view: 'create', model: [person: person])
		}
	}
	
	def show = {
		def person = Person.get(params.id)
		return [person:person]
	}
	
	def edit = {
		def person = Person.get(params.id)
		return [person:person]
	}
	
	def update = {
		println("=====update========="+params.id);
		def person = Person.get(params.id)
		if (person) {
		  person.properties = params
		  if (!person.hasErrors() && person.save()) {
			flash.message = "Person ${params.id} updated"
			redirect(action: show, id: person.id)
		  }
		  else {
			render(view: 'edit', model: [person: person])
		  }
		}
		else {
		  flash.message = "Person not found with id ${params.id}"
		  redirect(action: edit, id: params.id)
		}
	}
}
