package com.sigma



class User {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked  = false
	boolean passwordExpired = false
	String email
	String comment
	String state
	String sex
	String terms
	Date createdDate
	Date lastUpdated

	static constraints = {
		username blank:false, unique: true
		email blank:false ,email:true
		password blank: false
		comment blank: false
		state blank: false
		sex blank: false
		terms nullable:false
		createdDate blank: false
		lastUpdated blank:true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
