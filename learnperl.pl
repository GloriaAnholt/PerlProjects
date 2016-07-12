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
#                                   SCALARS
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
#                                   ARRAYS
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
#                                   HASHES
###################################################################################

# Hash: A hash variable is a list of scalars indexed by strings. Same as a Python dict
# A hash is declared with an even number of elements, where the evens are taken as strings
# You have to use a $ when retrieving a value from an array b/c the value itself is a scalar

my %scientists = (
        "Newton" => "Isaac",
        "Einstein" => "Albert",
        "Darwin" => "Charles",
);

# Arrays are accessed with [], hashes with {}
print $scientists{"Newton"};        # Prints: Isaac
print $scientists{"Einstein"};      # Prints: Albert
print $scientists{"Darwin"}, "\n";  # Prints: Charles
print $scientists{"Kepler"};        # Prints "" and raises an uninitialized value warning

# There is no collision btn a scalar $var and a hash %var containing a scalar entry $var{"foo"}.

# You can convert a hash directly to an array with all the values as individual entries,
# hashes are not ordered, but the pairs will be adjacent values
my @scientists = %scientists;

print @scientists, "\n"; # Prints: EinsteinAlbertDarwinCharlesNewtonIsaac

###################################################################################

# Recap on Array v. Hashes
# Arrays use []  -- effectively a numerical operator, uses index (or the string equiv)
# Hashes use {}  -- effectively a string operator, uses a string (or the num equiv)

my $data = "orange";
my @data = ("purple");
my %data = ( "0" => "blue");

print $data, "\n";      # Prints: orange
print $data[0], "\n";   # Prints: purple
print $data["0"], "\n"; # Prints: purple
print $data{"0"}, "\n"; # Prints: blue
print $data{0}, "\n";   # Prints: blue
print "-------------- \n";

###################################################################################
#                                 (NOT) LISTS
###################################################################################

# Lists: In Perl, lists are *not* variables. A list is an ephemeral *value* which can
# be assigned to an array or a hash variable.
# Arrays: declared with (), uses commas as separators
# Hashes: declared with (), uses => as separators
# () is an empty list, which could declare an array or a hash, Perl has no way of knowing.

# Perl CANNOT HAVE NESTED LISTS because of this.

my @nested = (
        "apples",
        "bananas",
        (
            "here's ",
            "the ",
            "inner ",
            "list ",
        ),
        "cherries",
);

print $nested[0], "\n";
print $nested[1], "\n";
print $nested[2];           # Perl flattens this out
print $nested[3];
print $nested[4];
print $nested[5], "\n";
print $nested[6], "\n";

my %nestedhash = (
        "beer" => "yummy",
        "bananas" => (
                "green" => "wait",
                "yellow" => "good",
                "brown" => "too late",
                ),
);

# This raises a warning because it's a 7-item hash
# Creates off-by-one errors in printing b/c bananas : green
print $nestedhash{"beer"}, "\n";        # Prints: yummy
print $nestedhash{"bananas"}, "\n";     # Prints: green
print $nestedhash{"green"}, "\n";       # Prints: Uninitialized value warning
print $nestedhash{"wait"}, "\n";        # Prints: yellow
print $nestedhash{"yellow"}, "\n";      # Prints: Uninitialized value warning
print $nestedhash{"good"}, "\n";        # Prints: brown
print $nestedhash{"brown"}, "\n";       # Prints: Uninitialized value warning
print $nestedhash{"too late"}, "\n";    # Prints: Uninitialized value warning


###################################################################################
#                                   CONTEXT
###################################################################################

# Every statement in Perl is evaluated in scalar-context or list-context
my $scalar = "Mendeleev";           # Scalar context
my @array3 = ("A", "B", "C", "G");   # List context
my %hash = ("A" => "B", "C" => "G"); # List context

# A scalar expression evaluated in a list-context is converted into a single-element list
my @singlearray = "Mendeleev";  # Same as my @array = ("Mendeleev");
print $singlearray[0], "\n";

# An array evaluated in a scalar-context returns the length of the array
print @array3, "\n";         # Prints: ABCG
my $otherscalar = @array3;   # Make a scalar out of an array
print $otherscalar, "\n";   # Prints: 4 (the length of thr array)

# A list evaluated in a scalar-context returns the last element of the list
my $scalarlist = ("Apples", "Bananas", "Cherries", "Durian");   # Error: Useless use of a constant
print $scalarlist, "\n";    # Prints: Durian  <= that's weird.

my @a1 = ("Alpha", "Beta", "Gamma");
my $s1 = "-X-";
print @a1, "\n";            # Prints: AlphaBetaGamma
print $s1, @a1, 98, "cheese", "\n";     # Prints: -X-AlphaBetaGamma98cheese

# Contest is REALLY IMPORTANT for built-in functions.
# In list-context, reverse will return the list in reversed order
# In scalar-contest, reverse concatenates it into one word, and then returns the reversed word
print reverse "hello world";            # Prints: hello world
my $strng = reverse "hello world";
print $strng, "\n";                     # Prints: dlrow olleh


###################################################################################
#                       References & Nested Data Structures
###################################################################################

# Hashes and arrays cannot contain other hashes or arrays, they can only contain scalars.
my @outer = ("sun ", "mercury ", "venus ", undef, "mars ", "jupiter ", "saturn ", "uranus ", "neptune ");
my @inner = ("earth ", "moon ");

# Arrays must have scalars as elements, so it takes the scalar value of @inner, which is its length (2)
$outer[3] = @inner;
print @outer, "\n";         # Prints: sun mercury earth 2mars jupiter saturn uranus neptune
print @outer[3], "\n";      # Prints: 2

# HOWEVER, a scalar variable can contain a reference to any variable, including an array or hash
# This is how Perl does nested structures.
# References are created using a backslash, are accessed with {}:
my $color = "indigo";
my $scalarref = \$color;
print $color, "\n";         # Prints: indigo
print $scalarref, "\n";     # Prints: SCALAR(0xf2d8a0)
print ${ $scalarref}, "\n"; # Prints: indigo
# As long as the reference isn't ambiguous, you can omit the {}
print $$scalarref, "\n";    # Prints: indigo

# References with arrays:
my @colorlist = ("red", "orange", "yellow", "green", "blue", "violet");
my $refarray = \@colorlist;
print @colorlist[0], "\n";      # Prints: red
print ${ $refarray}[0], "\n";   # Prints: red
print $refarray->[0], "\n";     # Prints: red

# References with hashes:
my %atomicWeights = ("Hydrogen" => 1.008, "Helium" => 4.003, "Manganese" => 54.94);
my $hashRef = \%atomicWeights;
print %atomicWeights{"Helium"}, "\n";   # Prints: Helium4.003  --> use $ not %
print $atomicWeights{"Helium"}, "\n";   # Prints: 4.003
print ${ $hashRef}{"Helium"}, "\n";     # Prints: 4.003
print $hashRef->{"Helium"}, "\n";       # Prints: 4.003


# Nested Data Structures in Perl, the long way
my %user1 = (
        "name" => "Gloria",
        "DOB" => "10071982",
);

my %user2 = (
        "name" => "Eric",
        "DOB" => "04281983",
);

my @users = (\%user1, \%user2);

my %account = (
        "number" => "012345",
        "opened" => "07112016",
        "users" => \@users,
);

print $user1{"name"}, "\n";     # Prints: Gloria
print @users, "\n";             # Prints: HASH(0x25cd3c0)HASH(0x25cd348)

# A quicker was to write this is to use "anonymous arrays", which is how nesting is done.
# Nested arrays use square brackets [] instead of parenthesis ()
# Nested hashes use curly braces {} instead of parenthesis ()
my %account = (                             # Standard hash, uses ()
        "number" => "012345",
        "opened" => "07112016",
        "users" => [                        # Nested array, uses []
                {                           # Nested hash, uses {}
                    "Name" => "Santa Claus",
                    "DOB" => "12251700",
                },
                {
                    "Name" => "Jesus H. Christ",
                    "DOB" => "12250000",
                },
        ],
);

# To get at any of the information, you have to manually un-do the nesting OR use ->
print $account{"number"}, "\n";     # Prints: 012345
my @users = @{ $account{"users"} };
my %user1 = %{ $users[0]};
my %user2 = %{ $users[1]};
print %user1, "\n";                 # Prints: NameSanta ClausDOB12251700
print $user1{"Name"}, "\n";         # Prints: Santa Claus

print $account{"users"}->[0]->{"Name"}, "\n";   # Prints: Santa Claus
print $account{"users"}->[1]->{"DOB"}, "\n";    # Prints: 12250000

# References do strange things.
# This array has five elements:
my @array6 = (1, 2, 3, 4, 5);
print @array6, "\n";            # Prints: 12345
my @array7 = [1, 2, 3, 4, 5];
print @array7, "\n";            # Prints: ARRAY(0x236c040)
my $array6ref = [1, 2, 3, 4, 5];
print $array6ref, "\n";         # Prints: ARRAY(0x2048190)
print @{ $array6ref}, "\n";     # Prints: 12345
print @$array6ref, "\n";        # Prints: 12345

# To recap, references to things are done as follows:
#        $scalarref = \$foo;
#        $arrayref  = \@ARGV;
#        $hashref   = \%ENV;
#        $coderef   = \&handler;
#        $globref   = \*foo;