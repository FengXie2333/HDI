## 按MIM条目前缀统计

#!/usr/feng/document/perl -w;
use strict;

if ( ! open DIRECTORY, "D:/common/Bioinfomatic/encode/perl/test/first/omim.txt") {
    die "Can't open your file! There must be some errors!";
}

while (<DIRECTORY>) {
    chomp;
    if (/^\d{6}/) {
        push @list,$_;
        $numbers = @list;
    }
}
print "I have seen 'no symbol' $numbers times\n";
close DIRECTORY;

## 按染色体统计基因条目的分布

#!/usr/feng/document/perl -w;
use strict;
if ( ! open DIRECTORY, "D:/common/Bioinfomatic/encode/perl/test/first/mim2gene.txt") {
    die "Can't open your file! There must be some errors!";
}

while (<DIRECTORY>) {
    chomp;
    if (/(\w{1,2})(p|q)\d{2}\b/) { 
        push @list,$1;
    }  elsif (/\bmitochondria\b/) {
	    push @numbers,$_;
		$n = @numbers;
	}
}
print "@list";


my %count;
$count{$_}++ foreach (@list);


while (($key,$value) = each %count) {
    print "$key => $value\n";
}
 print "I have seen mitochondria: $n times";
 close DIRECTORY;