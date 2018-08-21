#1
my $example = "beforematchafter";

if ($example =~ /match/) {
        print "Matched: |$`<$&>$'|\n";
    } else {
        print "No matched: |$_|\n";
    }


#2
my $name = "wilma";

if ($name =~ /\w*a$/) {
        print "Matched: |$`<$&>$'|\n";
    } else {
        print "No matched: |$_|\n";
    }


#3
my $name = "wilma_Flinatone";

if ($name =~ /(\w*a$)/) {
        print "\$1 contains '$1'\n";
    } else {
        print "No matched: |$_|\n";
    }


#4
my $name = "wilma";

if ($name =~ /(?<name>\w*a$)/) {
        print "'name' contains '$+{name}'\n";
    } else {
        print "No matched: |$_|\n";
    }


#5
my $name = " I saw wilma yesterday";

if ($name =~ /(?<name1>\w*a\b)(?<name2>\w{0,5})/) {
        print "'name' contains '$+{name1}' and '$+{name2}'";
    } else {
        print "No matched: |$_|\n";
    }


#6
while <> {
    if (/\s+$/) {
        print "$_#\n";
    }
}



