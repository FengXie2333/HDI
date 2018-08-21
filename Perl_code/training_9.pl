#2
use strict;
$^I = ".out";

while <> {
    s/fred/larry/ig;
    print;
}


#3
use strict;
$^I = ".out";

while <> {
    s/fred/\n/ig;
    s/wilma/fred/ig;
    s/\n/wilma/ig;
    print;
}

#4

