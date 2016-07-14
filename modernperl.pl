# Modern Perl
# 07.12.2016
# @totallygloria

#!/usr/bin/env perl

use Modern::Perl '2015';
use autodie;


# CONTEXT

my $numeric_x =  0 + $x;  # forces numeric context
my $stringy_x = '' . $x;  # forces string  context
my $boolean_x =    !!$x;  # forces boolean context