class MyThread
{
	private string name;
	private int count = 0;

	public MyThread(string name) {
		this.name = name;
	}

	public void* thread_func() {
		while(true) {
			stdout.printf("%s: %i\n", this.name, this.count);
			this.count++;
			Thread.usleep(Random.int_range(0, 200000));
		}
	}
}

int main() {
	if(!Thread.supported()) {
		stderr.printf("Cannot run without thread support.\n");
		return 1;
	}

	var thread_a_data = new MyThread("A");
	var thread_b_data = new MyThread("B");
	try {
		unowned Thread<void*> thread_a = Thread.create<void*> (thread_b_data.thread_func, true);
		unowned Thread<void*> thread_b = Thread.create<void*> (thread_a_data.thread_func, true);

		thread_a.join();
		thread_b.join();

	}catch(Error e) {
		stderr.printf("%s\n", e.message);
		return 1;
	}
	return 0;
}