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
close INPUT;
close OUTPUT;