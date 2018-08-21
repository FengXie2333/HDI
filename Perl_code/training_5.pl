#1
print reverse <>;

#2
say "please enter lines, then enter control+D : ";
chomp (my @lines = <STDIN>);

say "1234567890" x 7;

foreach (@lines) {
    printf "%20s\n","$_";
}

#3
say "please enter lines, then enter control+D :";
chomp (my @lines = <STDIN>);

say "please enter numbers that you want to show, then enter control+D :"
chomp ($n = <STDIN>);

say "1234567890" x 7;

foreach (@lines) {
    printf "%{$n}s\n","$_";
}

#4
say "please enter lines, then enter control+D :";
chomp (my @lines = <STDIN>);  ###chomp 不能少！！！！！

say "please enter numbers that you want to show, then enter control+D :"
chomp (my $n = <STDIN>);

say "1234567890" x "($n + 9)/10";

foreach (@lines) {
    printf "%{$n}s\n","$_";
}
