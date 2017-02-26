#!/usr/bin/perl

use strict;
use warnings;

=encoding UTF8
=head1 SYNOPSYS
Шифр Цезаря https://ru.wikipedia.org/wiki/%D0%A8%D0%B8%D1%84%D1%80_%D0%A6%D0%B5%D0%B7%D0%B0%D1%80%D1%8F
=head1 encode ($str, $key)
Функция шифрования ASCII строки $str ключем $key.
Пачатает зашифрованную строку $encoded_str в формате "$encoded_str\n"
Пример:
encode('#abc', 1) - печатает '$bcd'
=cut

sub encode {
    # Алгоритм шифрования
    my ($str, $key) = @_;
    my $encoded_str = '';
    my @mas_str = split //, $str;
    while (@mas_str) {
        my $letter = shift @mas_str;
        my $number = ord($letter) + $key % 127;
        $number -= 127
        if ( $number  > 122 ) || ( 90 < $number && $number < 97 );
        $encoded_str .= chr($number);
    }

    print "$encoded_str\n";
}

=head1 decode ($encoded_str, $key)
Функция дешифрования ASCII строки $encoded_str ключем $key.
Пачатает дешифрованную строку $str в формате "$str\n"
Пример:
=cut

# decode('$bcd', 1);
 # - печатает '#abc'
sub decode {
    # Алгоритм дешифрования
    my ($encoded_str, $key) = @_;
    my $str = '';
    my @mas_encod = split //, $encoded_str;
    while (@mas_encod) {
        my $letter = shift @mas_encod;
        my $number = ord ($letter) - $key % 127;
        $number += 127
        if ( $number  > 122 ) || ( 90 < $number && $number < 97 );
        $str .= chr($number);
    }

    print "$str\n";
}
# my $encoded = join '', map { decode_($_,$key)} split //, $encoded_str;
1;
