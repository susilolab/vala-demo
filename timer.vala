int main(string[] args) {
	var timer = new Timer();
	timer.start();
	while(timer.elapsed() <=5.0) {
		stdout.printf("xx");
	}
	timer.stop();
	
	stdout.printf("\n");
	return 0;
}
