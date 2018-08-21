@name = qw(fred,betty,barney,dino,wilma,pebbles,bamm-bamm);
print "enter unmbers from 1 to 7, one per line, then press control+Z:\n";
chomp (@number = <STDIN>);
foreach $number (@number){
    print(@name[$number - 1]);
}

print "enter names,one per line, then press control+Z:\n";
chomp (@name = <STDIN>);
@name = sort(@name);
 