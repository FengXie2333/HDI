use strict;


sub sum_of_fred_and_barney {
    print "Hey, you called the sum_of_fred_and_barney subroutine!\n";
    $fred + $barney;
}
$fred = 3;
$barney = 4;
$wilma = &sum_of_fred_and_barney;
print "\$wilma is $wilma.\n";
$betty = 3 * &sum_of_fred_and_barney;
print "\$betty is $betty.\n";




sub max {
    if ($_[0] > $_[1]) {
        $_[0];
    } else {
        $_[1];
    }
}

$n = &max(10,15);
print "$n";




sub max {
    my ($max_so_far) = shift @_;
    foreach (@_) {
        if ($_ > $max_so_far) {
            $max_so_far = $_;
        }
    }
    $max_so_far;
}
@_ = qw(3,5,10,4,6);

$n = &max(@_);
print"$n"





sub max {
    my ($max_so_far) = shift @_;
    foreach (@_) {
        if ($_ > $max_so_far) {
            $max_so_far = $_;
        }
    }
    $max_so_far;
}

@fred = qw(3 4 7 5 9 10 2);
$maximum = &max(@fred); 
print"$maximum";



sub list_from_fred_to_barney {
    if ($fred < $barney) {
        $fred..$barney;
    } else {
       reverse $barney..$fred;
    }
}
$fred = 11;
$barney = 4;
@n = &list_from_fred_to_barney;
print "@n";




