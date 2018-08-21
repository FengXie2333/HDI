
print "Hello, world\n";
$age = 20;
$age += 3;
print $age . "\n";

$what = "egg";
$n = 3;
$name = Florent;
print "$name ate $n ${what}s";



$count = 0;
while ($count < 10) {
    $count +=2;
    print "count is now $count\n";
}

$n = 1;
while ($n < 10) {
    $sum +=2;
    $n += 2;
}
print "The total was $sum.\n";
$r = 12.5;
$PI = 3.14;
$c = 2 * $PI * $r;
print "$c";

($rock[0],$rock[1],$rock[2],$rock[3]) = qw/talc mica feldspar quartz/;
$fred = pop (@rock);
print $fred;

foreach $rock (qw/bedrock slate lava/) {
    print "one rock is $rock . \n";
}

@rocks = qw/bedrock slate lava/;
foreach $rocks (@rocks) {
    $rocks = "\t$rocks";
    $rocks .= "\n"; 
}
print "The rocks are:\n",@rocks;

$r = <STDIN>;
$PI = 3.14;
$c = 2 * $PI * $r;
print "$c";


$line = <STDIN>;
if ($line eq "\n") {
    print "That was just a blank line!\n";
} esle {
    print "That line of input was: $line";
}