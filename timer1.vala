int main(string[] args) {
	var timer = new Timer();
	timer.start();
	
	for(double x = 0.0; x <= 5.0;) {
		x = timer.elapsed();
		print(@"time: $x\n");
	}
	timer.stop();
	
	return 0;
}
