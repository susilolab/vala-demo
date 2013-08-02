enum Musim {
	HUJAN, KEMARAU;
	public bool is_hot() {
		return this == KEMARAU;
	}

	public string to_string() {
		switch(this) {
			case HUJAN:
				return "Hujan";
			case KEMARAU:
				return "Kemarau";
			default:
				assert_not_reached();
		}
	}
}

void main () {
	Musim musim = Musim.KEMARAU;
	int i = musim;

	stdout.printf("musim= %d, i=%d\n", musim, i);
	stdout.printf("musim= %s, i=%s\n", musim.to_string(), i.to_string());
}
