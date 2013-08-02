enum Musim {
	HUJAN, KEMARAU;
	public bool is_hot() {
		return this == KEMARAU;
	}
}

void main () {
	Musim musim = Musim.KEMARAU;
	int i = musim;

	stdout.printf("musim= %d, i=%d\n", musim, i);
	stdout.printf("musim= %s, i=%s\n", musim.to_string(), i.to_string());
}
