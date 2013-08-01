void main()
{
	int64 timestamp = 1234151912;
	var time = new DateTime.from_unix_utc(timestamp);
	assert(time.to_unix() == timestamp);
	
	time = new DateTime.utc(2010, 10, 22, 9, 22, 0);
	var now = new DateTime.now_local();
	print("Is daylight savings time: %s\n", now.is_daylight_savings()? "yes": "no");
	print("The timezone abbreviation is: %s\n", now.get_timezone_abbreviation());

	string date_string = now.to_string();
	print("Current time in RFC 3339 format: %s\n", date_string);
	
	print("According to the current locale: %s\n", now.format("%x %X"));
	
	print("Day of month: %d\n", now.get_day_of_month());
	print("Week of year: %d\n", now.get_week_of_year());
	
	var future = now.add_days(1).add_hours(3).add_minutes(5);
	print(@"Plus one day, three hours and five minutes: $future\n");
}
