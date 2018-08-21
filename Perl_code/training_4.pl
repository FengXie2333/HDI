# 1.
sub total {
    my $sum;
    foreach (@_){
        $sum += $_;
    }
    $sum;
}

#2
@numbers = 1..1000;
print "@numbers.\n";
$all = &total (@numbers);
print "$all.\n";

#3
sub average {
    my $sum;
    my $counts = @_;
    foreach (@_) {
        $sum += $_;
    }
    $ad = $sum / $counts;

}
@numbers = 1..1000;
$ad = &average(@numbers);
print"$ad";

sub above_average {
    foreach(@_) {
        if ($_ > $ad) {
           push @list, $_ ; #### 创建数组 push
        }
    }
    @list;  ###这一行不能没有
}

@list = &above_average(@numbers);
print "@list";


#4
use 5.010;  ###state这个是在perl 5.0.10里面提供的功能,需要指明才能用

greet ("Fred");

greet ("Barney");

sub greet {
    state $last_name;
    $name = shift;
    if (defined ($last_name)) {
        print "Hi,$name! $last_name is also here!.\n";
    } else {
        print "Hi,$name! You are the first one here!,\n";
    }
    $last_name = $name;
}

#5
use 5.010;

greet ("Fred");
greet ("Barney");
greet ("Wilma");
greet ("Betty");

sub greet {
    state $last_name;
    $name = shift;
    if (defined ($last_name)) {
        print "Hi,$name! I have seen: @names.\n";
    } else {
        print "Hi,$name! You are the first one here!,\n";
    }
    $last_name = $name;
    push @names,$last_name;
}
