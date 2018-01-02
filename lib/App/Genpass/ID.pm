package App::Genpass::ID;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use App::Genpass::WordList ();

our %SPEC;

$SPEC{genpass} = {
    v => 1.1,
    summary => 'Generate password from combination of Indonesian words',
    description => $App::Genpass::WordList::SPEC{genpass}{description},
    args => {
        num => {
            schema => ['int*', min=>1],
            default => 1,
            cmdline_aliases => {n=>{}},
        },
        %App::Genpass::WordList::arg_patterns,
    },
    examples => [
    ],
};
sub genpass {

    my %args = @_;

    App::Genpass::WordList::genpass(
        (num => $args{num})           x !!defined($args{num}),
        (patterns => $args{patterns}) x !!defined($args{patterns}),
        wordlists => ['ID::KBBI'],
    );
}

1;
# ABSTRACT:

=head1 SYNOPSIS

See the included script L<genpass-id>.
