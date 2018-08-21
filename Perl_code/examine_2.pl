##### 使用agp文件提供的信息，将chr13.scaffold.gff.gz文件中scaffold的位置信息转换成对应的染色体位置信息,Gene ID不变,得到chromosome_gene.gff

#!/usr/feng/document/perl -w;
use strict;
open DIRECTORY, "D:/common/Bioinfomatic/encode/perl/test/second/chr13.agp" or die "open file error!";


#my %location_first;

while (<DIRECTORY>) {
    chomp;
	my @fields = split;
	#foreach (@fields) {
        if ($fields[5] =~ /scaffold/){
		#my ($tem1,$tem2);
		#print"$fields[5]\n$fields[1]";
		#$tem1=$fields[5];
		#$tem2=$fields[1];
            $location_first{$fields[5]} = $fields[1];
			
        #}
    }
     
}
close DIRECTORY;

#my @tem1;
#@tem1=%location_first;
#print"@tem1\n";

#while (($key,$value) = each %location_first) {
   #print "$key => $value\n";
#}

#print "$location_first{scaffold266}";
#$^I = ".bak";

open DIRECTORY, "D:/common/Bioinfomatic/encode/perl/test/second/chr13.scaffold.gff" or die "open file error!";

open OUTPUT, ">chromosome_gene.gff" or die "open file error!";

while (<DIRECTORY>) {
    chomp;
	my @scaffold = split;
	$list = $_;
	#print "$scaffold[3]";
	#print "$location_first{scaffold266}"
	#print "$list";
	#print "$array[3]\n$array[0]"
	$n = $location_first{$scaffold[0]} + $scaffold[3];
	$m = $location_first{$scaffold[0]} + $scaffold[4];
	#print "$n";
    $list =~ s/$scaffold[3]/$n/g;
	$list =~ s/$scaffold[4]/$m/g;
	print OUTPUT "$list\n";
}

#print OUTPUT "$list\n";
close DIRECTORY;
close OUTPUT;




##### 根据chr13.fa的序列以及转换后的基因注释文件chromosome_gene.gff，提取其所有的基因的CDS序列，结果以fasta格式输出
#!/usr/feng/document/perl -w;
use strict;

open FILE,"D:/common/Bioinfomatic/encode/perl/test/second/chr13.fa" or die"can't open file: $!";

@text = <FILE>;
chomp(@text);
$string=join "" ,@text;
#print "$string";
close FILE;

open DIRECTORY, "D:/common/Bioinfomatic/encode/perl/test/second/chromosome_gene.gff" or die "open file error!";
open OUTPUT, ">sequence.fasta" or die "open file error!";

while (<DIRECTORY>) {
    chomp;
	my @fields = split;
    #$fields =~ s/;/\n/g;
	if ($fields[2] =~ /CDS/) {
	    #push @fasta,$fields[8];
        $length = $fields[4]-$fields[3];   
		#push @length,$length;
        my $sequence = substr ($string, $fields[3], $length);  ######提取出CDS的序列.怎么把他们分割成60个一行？？？？
		#my @sequence2 = $sequence;
		#print OUTPUT "@sequence2"; 
		print OUTPUT ">$fields[8]\n";
		for (my $i = 0; $i < length($sequence); $i += 60 ) {
			$sequence3 = substr ($sequence, $i, 60);   #####将CDS序列分割成60个字符一行
			print OUTPUT "$sequence3\n";
		}
    }
}
close OUTPUT;
close DIRECTORY;



#open INPUT, "D:/common/Bioinfomatic/encode/perl/test/second/sequence.fasta" or die "open file error!";
#$^I = ".bak";

#while (<INPUT>) {
     #chomp;
     #s/^parent=//ig;
	 #s/;//g;
	 #print;
#}




## 根据用于人类基因组注释的密码子表，将提取的基因的CDS序列翻译成氨基酸序列，结果以fasta格式输出

#!/usr/feng/document/perl -w;
use strict;
### 构建密码子与氨基酸间的哈希
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


######匹配起始密码子和终止密码子。然后根据哈希转换
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
close INPUT;
close OUTPUT;

### 把代表终止密码子的*删除，并且对相同id的氨基酸序列进行合并
open INPUT, "D:/common/Bioinfomatic/encode/perl/test/second/sequence_pro_old.fasta" or die "open file error!";
open OUTPUT,">D:/common/Bioinfomatic/encode/perl/test/second/sequence_pro_new.fasta" or die "open file error!";

my %hash;
while (<INPUT>) {
    chomp;
    s/\*//g;
    my @sequence = split;
    ($key,$value) = ($sequence[0],$sequence[1]);
    $hash{$key}.="$value";
}

while (($key,$value) = each %hash) {
    print OUTPUT "$key$value\n";
}


 
close INPUT;
close OUTPUT;


### 把fasta改成规定的格式。这里设定一行显示60个字符
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
    