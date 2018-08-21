#1
%name = (
    "fred" => "flintstone",
    "barney" => "rubble",
    "wilma" => "flintstone",
    );

print "$name{fred}";

#2
chomp (@names = <STDIN>);

foreach $name (@names) {
        $value {$name} += 1;
    }

foreach $name (keys %value) {
    if ($value{$name}) {
        print "$name has appered $value{$name} times.\n"
    }
}

#附加题
chomp (@names = <STDIN>);

foreach $names (@names) {
        $value {$names} += 1;
} 

foreach $name (sort keys %value) {
    if ($value{$name}) {
        print "$name has appered $value{$name} times.\n"
    }
}


#3
my $longest = 0;
foreach $keys (keys %ENV) {
    my $length = length ($keys);
    if ($length > $longest) {
        $longest = $length;
    }
}

foreach $keys (sort keys %ENV) {
    printf "%-${longest}s %s\n" , $keys, %ENV{$keys} ;
}