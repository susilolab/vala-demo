int main (string[] args) {
    DateTime d1 = new DateTime.now_local();
    stdout.printf("%s\n", d1.to_string());

    DateTime d2 = new DateTime.local(2013, 1, 24, 1, 10, 20);
    stdout.printf("%s\n", d2.to_string());

    DateTime d3 = new DateTime.local(2013, 1, 24, 1, 10, 20);
    stdout.printf("%s\n", d3.to_string());
    // Jika d2 < d3  => -1
    // Jika d2 == d3 => 0
    // Jika d2 > d3  => 1
    // d2 > d1 = 1, d2.compare(d1)
    stdout.printf("%d\n", d1.compare(d2));

    stdout.printf("\n");
    return 0;
}