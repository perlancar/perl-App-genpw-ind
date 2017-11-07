package App::Genpass::ID;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our %SPEC;

$SPEC{genpass} = {
    v => 1.1,
    summary => 'Generate Indonesian password',
    args => {
        num => {
            schema => ['int*', min=>1],
            default => 1,
            cmdline_aliases => {n=>{}},
        },
    },
    examples => [
    ],
};
sub genpass {
    require App::wordlist;

    my %args = @_;

    my $num = $args{num} // 1;

    my $res = App::wordlist::wordlist(
        wordlists => ['ID::KBBI'],
        random    => 1,
        num       => 2*$num,
        min_len   => 6,
    );
    return $res unless $res->[0] == 200;

    my @pass;
    for my $i (1..$num) {
        my $w1 = shift @{$res->[2]};
        my $w2 = shift @{$res->[2]};
        my $num1 = 1000 + int(9000*rand());
        push @pass, $w1 . $num1 . $w2;
    }

    [200, "OK", \@pass];
}

1;
# ABSTRACT:

=head1 SYNOPSIS

See the included script L<genpass-id>.
