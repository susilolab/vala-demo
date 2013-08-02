public class PrayTime : Object
{
	public static short jafari  = 0; // Ithna Ashari
	public static short karachi = 1; // University of Islam Sciences, Karachi
	public static short isna    = 2; // Islam Society of North America (ISNA)
	public static short mwl     = 3; // Muslim World League (MWL)
	public static short makkah  = 4;
	public static short egypt   = 5;
	public static short custom  = 6;
	public static short tehran  = 7;
	
	public static short shafii  = 0;
	public static short hanafi  = 1;
	
	public static short none        = 0;
	public static short mid_night   = 1;
	public static short one_seventh = 2;
	public static short angle_based = 3;
	
	// Time Formats
	public static short time24      = 0;
	public static short time12      = 1;
	public static short time12NS    = 2;
	public static short floats      = 3;

	public static string[] time_names = {
		"Fajr",
		"Sunrise",
		"Dhuhr",
		"Asr",
		"Sunset",
		"Magrib",
		"Isha"
	};
	
	public static string invalid_time = "-----";
	
	// Global variable
	public short calc_method = 0;
	public short asr_juristic = 0;
	public short dhuhr_minutes = 0;
	public short adjust_high_lats = 1;
	public short time_format = 0;
	public short lat;
	public short lng;
	public short time_zone;
	public short jdate;
	
	public short num_iterations = 1;
	public long[] method_params;
	
	private int[] times;
	
	public PrayTime(int method_id = 0) {
		this.method_params[this.jafari] = {16, 0, 4, 0, 14};
		this.method_params[this.karachi] = {18, 1, 0, 0, 18};
        this.method_params[this.isna]      = {15, 1, 0, 0, 15};
        this.method_params[this.mwl]       = {18, 1, 0, 0, 17};
        this.method_params[this.makkah]    = {18.5f, 1, 0, 1, 90};
        this.method_params[this.egypt]     = {19.5f, 1, 0, 0, 17.5f};
        this.method_params[this.tehran]    = {17.7f, 0, 4.5f, 0, 14};
        this.method_params[this.custom]    = {18, 1, 0, 0, 17};
	}
	
	public string[] get_prayer_times(int year, int month, int day, ) {
	
	}
}
