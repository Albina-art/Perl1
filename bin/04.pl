#!/usr/bin/perl

use strict;
use warnings;

=encoding UTF8
=head1 SYNOPSYS

Поиск номера первого не нулевого бита.

=head1 run ($x)

Функция поиска первого не нулевого бита в 32-битном числе (кроме 0).
Пачатает номер первого не нулевого бита в виде "$num\n"

Примеры: 

run(1) - печатает "0\n".

run(4) - печатает "2\n"

run(6) - печатает "1\n"

=cut
# run(2147483648);
sub run {
    my $x = shift;
    my $flag = 1;
    my $num = 1 << 31;
    my $coun = 32;
    while ($flag == 1) {
    	$coun--;
    	$flag = 0 if (($num & $x)>0 || $num < 1);
    	$num >>=1;
    }
	print $coun,"\n";
}

1;
