int cek_prima(int bil) {
	int bagi = 3;
	int batas = 0;

	if (bil == 1) {
		return(0);
	}else if (bil==2||bil==3) {
		return(1);
	}else if (bil % 2 == 0) {
		return(0);
	}else {
		while (batas > bagi) {
			if(bil % bagi == 0) {
				return(0);
				break;
			}
			batas = bil / bagi;
			bagi += 2;
		}
		return(1);
	}
}

void main() {
	int i;
	int prima;

	stdout.printf("Masukan rentang: ");
	int rentang = int.parse(stdin.read_line());
	for(i=1;i<=rentang; i++) {
		prima = cek_prima(i);
		if (prima == 1) {
			stdout.printf("%d, ", i);
		}
	}
	stdout.printf("\n");
}
