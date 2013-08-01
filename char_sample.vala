void main()
{
	string s = "1234567890 ۱۲۳٤٥٦۷۸۹۰ ACEGIKMOQSUWY BDFHJLNPRTVXZ acegikmoqsuwy bdfhjlnprtvxz ‫أتثحدرسصطعفكمهي‬";
	for(unowned string it = s; it.get_char() != 0; it.next_char() ) {
		unichar c = it.get_char();
		UnicodeType type = c.type();

		stdout.printf("'%s' is", c.to_string());
		switch(type) {
			case UnicodeType.UPPERCASE_LETTER:
				stdout.printf("UPPERCASE_LETTER\n");
				break;

			case UnicodeType.LOWERCASE_LETTER:
				stdout.printf("LOWERCASE_LETTER");
				break;

			case UnicodeType.OTHER_LETTER:
				stdout.printf("OTHER_LETTER\n");
				break;

			case UnicodeType.DECIMAL_NUMBER:
				stdout.printf("OTHER_NUMBER\n");
				break;

			case UnicodeType.SPACE_SEPARATOR:
				stdout.printf("SPACE_SEPARATOR\n");
				break;
		}
	}
}
