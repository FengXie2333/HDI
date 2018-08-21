#1
chomp (@numbers = <STDIN>);

my @sorted_number = sort { $a <=> $b} @nambers;

printf @numbers;

#2
my %last_name = qw{
    fred flinstone wilma flinstone bsrney rubble
    betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
    };

my @sort_hash = sort {
    "\L$last_name{$a}" cmp "\L$last_name{$b}" or
    "\L$a" cmp "\L$b"
} keys %last_name;

foreach (@sort_hash) {
    print "$last_name{$_},$_\n";
}


#3
print "please print your test";
$test = (<STDIN>);
print "please print your substring";
$substring = (<STDIN>);

for ($where = -1; ; ) {
    $where = index ($test,$substring,$where +1);
    last if $where = -1;
    push @numbers, $where;
} 

print "The posts of $test are @numbers"; 
 