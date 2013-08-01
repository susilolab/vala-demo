using GLib;
class Kelas: Object
{
	struct array_2d {
		public int NX;
		public int NY;
		private int[] storage;
		
		public array_2d(int NX, int NY);
		public int get(int x, int y);
		public set(int x, int y, int value);
		public void resize(int NNX, int NNY);
	}
	
	private array_2d[][] method_params;
	public int custom = 6;
	
	public Kelas() {
		this.method_params[custom][] = {18, 1, 0, 0, 17};
	}

	public void run() {
		
	}
			
	static void main() {
		var k = new Kelas();
		k.run();
	}
}
