# Learn Perl in about 2 hours 30 minutes
# 07.11.2016
# @totallygloria


# These are called "pragmas" -- strict and warnings prevent ambiguous statements
# from having unpredictable behaviors
use strict;
use warnings;

print "Hello World\n";


###################################################################################

# Perl has three types of variables, which are declared with the "my" keyword:
# scalars, marked with $
# arrays, marked with @
# hashes, marked with %

###################################################################################

# Scalars: None, all numbers, strings, and references

# This is the same as Python's None
my $undef = undef;
print $undef;       # Prints the empty string "" and raises a warning

# Undefineds can be implicit
my $undef2;
print $undef2;      # Prints "" and raises the same warning

# Scalars can be numbers -- no distinction between floats and ints
my $num = 4050.2;
print $num, "\n";

# Scalars can be strings, which are concatenated with the . operator (like PHP)
my $string = "world";
print "Hello ".$string, "\n";


# Booleans: Perl doesn't have any. If's evaluate to false for:
# undef, number 0, empty string "", string "0"
# Functions that return True generally return 1; return False is generally ""

# Weak typing: Perl can't distinguish strings and numbers because they're either
# depending on the situation

my $str1 = "4G";
my $str2 = "4H";

print $str1 . $str2, "\n";  # Prints 4H4G
print $str1 + $str2, "\n";  # Prints 8, with 2 warnings Argument "4H" isn't numeric in addition (+)
print $str1 eq $str2, "\n"; # Prints "" (empty string, eg False)
print $str1 == $str2, "\n"; # Prints 1, why are these considered equal?

print "yes" == "no", "\n";  # Prints 1 (True), with warning Argument isn't numeric

# Numerical things use numerical operators!
# <, >, <=, >=, ==, !=, <=>, +, -, *, /, % (mod)   (what about subtraction or division?)
# Binary "<=>" returns -1, 0, or 1 depending on whether the left argument is
# numerically less than, equal to, or greater than the right argument.
# You should never (I mean it!) compare floating point numbers for equality bc internal rounding

# Strings use string operators
# lt, gt, le, ge, eq, ne, cmp, ., x
# Binary "cmp" returns -1, 0, or 1 depending on whether the left argument is
# stringwise less than, equal to, or greater than the right argument.

###################################################################################

# Arrays: An array variable is a list of scalars indexed by integers beginning at 0.
# In Python this is known as a list
my @array = (
        "print",
        "those",
        "strings",
        "out",
        "for",
        "me",      # trailing comma is ok
);

# You have to use a $ when retrieving a value from an array b/c the value itself is a scalar
print $array[0];
print $array[1];
print $array[2];
print $array[3];
print $array[4];
print $array[5], "\n";
print $array[6];    # returns undef, prints "" and raises a warning

# You can use negative indexes to start at the end and move backwards
print $array[-1];
print $array[-2];
print $array[-3];
print $array[-4];
print $array[-5];
print $array[-6], "\n";

# There is no collision btn a scalar $var and an array @var containing a scalar entry $var[0].

# To get an array's length:
print "This array has ".(scalar @array)." elements \n"; # Prints: This array has 6 elements
print "The last populated index is ".$#array, "\n";     # Prints: The last populated index is 5

# Perl interpolates strings
print "Hello $string \n";   # Prints: Hello world
print "@array \n";          # Prints: print those strings out for me

# You can avoid interpolation with escapes or single quotes
print "\@array \n";         # Escape characters work, prints: @array
print 'Hello $string \n', "\n";   # Prints: Hello $string \n

###################################################################################

# Hash: A hash variable is a list of scalars indexed by strings. Python dict

