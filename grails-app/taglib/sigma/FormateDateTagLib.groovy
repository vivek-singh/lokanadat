package sigma

class FormateDateTagLib {
	
	static namespace = 'vivek'


final String BOT_FULL_DATE_FORMAT = 'MMMM d, yyyy'


     def fullDate = { attrs ->
	Date date = attrs.date
	out << date.format(BOT_FULL_DATE_FORMAT)
  }
	 
	 
}