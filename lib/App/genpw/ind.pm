package App::genpw::ind;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use App::genpw::wordlist ();

our %SPEC;

$SPEC{genpw} = {
    v => 1.1,
    summary => 'Generate password from combination of Indonesian words',
    description => $App::genpw::wordlist::SPEC{genpw}{description},
    args => $App::genpw::wordlist::SPEC{genpw}{args},
    examples => [
    ],
};
sub genpw {

    my %args = @_;

    App::genpw::wordlist::genpw(
        (action => $args{action})     x !!defined($args{action}),
        (num => $args{num})           x !!defined($args{num}),
        (patterns => $args{patterns}) x !!defined($args{patterns}),
        wordlists => ['ID::KBBI'],
    );
}

1;
# ABSTRACT:

=head1 SYNOPSIS

See the included script L<genpw-ind>.
