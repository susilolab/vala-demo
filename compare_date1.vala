int main (string[] args) {
    DateTime d1 = new DateTime.local(2013, 1, 24, 1, 10, 20);
    stdout.printf("%s\n", d1.to_string());

    DateTime d2 = new DateTime.local(2013, 1, 24, 1, 10, 20);
    stdout.printf("%s\n", d2.to_string());

    stdout.printf("%d\n", d1.compare(d2));

    stdout.printf("\n");
    return 0;
}