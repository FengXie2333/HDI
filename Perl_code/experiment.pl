########produce hash of codon and protein
open INPUT, "D:/common/Bioinfomatic/encode/perl/test/second/Codon_table.txt" or die "open file error!";
my %codon;

while (<INPUT>) {
    chomp;
    my @codon2 = split;
    $codon{$codon2[0]} = $codon2[1];
    $codon{$codon2[3]} = $codon2[4];
    $codon{$codon2[6]} = $codon2[7];
    $codon{$codon2[9]} = $codon2[10];
}



#while (($key,$value) = each %codon) {
   ## print "$key => $value\n";
#}

close INPUT;


######match promoter and terminator then begin to translate
open INPUT, "D:/common/Bioinfomatic/encode/perl/test/second/sequence.fasta" or die "open file error!";
open OUTPUT, ">D:/common/Bioinfomatic/encode/perl/test/second/sequence_pro_old.fasta" or die "open file error!";


while (<INPUT>) {
    chomp;
    my @sequence = split;
    #print "$sequence[1]\n";
    #$sequence1 = $sequence[1];
    #print "$sequence1\n";
     if ($sequence[1]=~/^\s*$/)  
        {  
            next;  
        }    
        elsif($sequence[1]=~/^N*$/)  
        {  
            next;  
        }
    $_ = length($sequence[1])-2;
    #print "$_\n";
    $i = index ($sequence[1],"ATG"); #### search location of promotor;
	print OUTPUT "\n>$sequence[0] ";
    #print "$i\n";
        if ($i == -1) {
            #print "nonono\n";
            print "$i\n";
        } 
        for($i; $i<$_;$i+=3) {
            #print "$i\n";
            $sub_sequence = substr($sequence[1],$i,3);
            #print ">$sequence[0]\n$sub_sequence\n";
            ###last if substr conclude "N" or match witn terminator;
            last if ($sub_sequence =~ /N/ or $sub_sequence eq "*") ;
            $protein = $codon{$sub_sequence};
			print OUTPUT "$protein";
        }	
}

open INPUT, "D:/common/Bioinfomatic/encode/perl/test/second/sequence_pro_old.fasta" or die "open file error!";
open OUTPUT,">D:/common/Bioinfomatic/encode/perl/test/second/sequence_pro_new.fasta" or die "open file error!";

#while (<INPUT>) {
    #s/\*//g;
    #print OUTPUT;
#}


my %hash;
while (<INPUT>) {
    chomp;
    s/\*//g;
    my @sequence = split;
    ($key,$value) = ($sequence[0],$sequence[1]);
    $hash{$key}.="$value";
}

#while (($key,$value) = each %hash) {
    #print "$key => $value\n";
#}


foreach (keys %hash){
    print OUTPUT "$key $hash{$key}\n";
}

open INPUT, "D:/common/Bioinfomatic/encode/perl/test/second/sequence_pro_new.fasta" or die "open file error!";
open OUTPUT,">D:/common/Bioinfomatic/encode/perl/test/second/sequence_pro_final.fasta" or die "open file error!";

while (<INPUT>) {
    chomp;
	my @sequence = split;
    print OUTPUT "$sequence[0]\n";
    for (my $i = 0; $i < length($sequence[1]); $i += 60 ) {
			$sequence_pro = substr ($sequence[1], $i, 60);   #####将CDS序列分割成60个字符一行
			print OUTPUT "$sequence_pro\n";
    } 
}
    