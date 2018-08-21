#1
chomp (@line = <STDIN>);

if (/fred/) {
    print;
}

#2
chomp (@line = <STDIN>);

if (/(f|F)red/) {
    print;
}

#3
while (<>) {
    if (/\./) {
        print;
    }
}

#4
while (<>) {
    if (/[A-Z][a-z]+/) {
        print;
    }
}

#5
while (<>) {
    if (/[^\s]\1/) {
        print;
    }
}

#6
while (<>) {
    if (/wilma.*fred|fred.*wilma/) {
        print;
    }
}