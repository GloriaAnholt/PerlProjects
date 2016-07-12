# Learn Perl in about 2 hours 30 minutes
# 07.11.2016
# @totallygloria


# These are called "pragmas" -- strict and warnings prevent ambiguous statements
# from having unpredictable behaviors
use strict;
use warnings;

print "Hello World\n";

###################################################################################
###################################################################################
##                                                                               ##
##                              VARIABLES IN PERL                                ##
##                                                                               ##
###################################################################################
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


###################################################################################
###################################################################################
##                                                                               ##
##                           CONDITIONALS IN PERL                                ##
##                                                                               ##
###################################################################################
###################################################################################

# The three conditionals in Perl are: if, elsif, else
my $word = "antidisestablishmentarianism";
my $strlen = length $word;

if ($strlen >= 15) {
        print "'", $word, "' is a very long word. \n";
} elsif (10 <= $strlen && $strlen < 15) {
        print "'", $word, "' is a medium length word. \n";
} else {
        print "'", $word, "' is a short word. \n";
}

# The if can come second for short clauses:
print "'", $word, "is an enormous word. \n" if $strlen >= 20;

###################################################################################
# Unless / else
# Generally best avoided: Use and if/else block with a negation to make it more clear.
my $temperature = 20;
unless ($temperature > 30) {
        print $temperature, " degrees Celsius is not very hot. \n";
} else {
        print $temperature, " degrees Celsius is quite hot. \n";
}
print "Oh no it's too cold. \n" unless $temperature > 15;

###################################################################################
# The Ternary operator: ?  -- Chooses between two options, separated by a colon :
# Allows if statements to be embedded in other statements

# Canonical case is to select between singular and plural forms
my $gain = 42;
print "You gained ", $gain, " ", ($gain == 1 ? "experience point" : "experience points"), "! \n";

my $egg = 5;
print "You have ", $egg == 0 ? "no eggs. \n" :
                   $egg == 1 ? "an egg. \n" :
                   "some eggs. \n";

###################################################################################
# If statements evaluate their conditions in scalar context.

# if (@array) returns true if the array has 1 or more elements.
my @array8 = (undef);
my @array9 = ();
print "True \n" if(@array8);    # Prints: True
print "True \n" if (@array9);   # Prints: "", or false


###################################################################################
###################################################################################
##                                                                               ##
##                              LOOPS IN PERL                                    ##
##                                                                               ##
###################################################################################
###################################################################################

# Perl loops include: while, until, do, C-style for loops, Python-style foreach / for

# While loops are pretty conventional:
my $i = 0;
while ($i < scalar @array) {
        print $i, ": ", $array[$i];   # Prints: 0: print1: those2: strings3: out4: for5: me
        $i++;
}
print "\n ---------------- \n";

# Until loops are the opposite of whiles:
my $j = 0;
until ($j > scalar @array) {
        print $j, ": ", $array[$j];   # Prints: 0: print1: those2: strings3: out4: for5: me
        $j++;                         # Raises warning: Use of uninitialized value in print
}
print "\n ---------------- \n";

# Do-while/until loops are almost equivalent to until loops, but would raise a warning if the
# @array were empty, unlike the until loop
my $k = 0;
do {
        print $k, ": ", $array[$k];   # Prints: 0: print1: those2: strings3: out4: for5: me
        $k++;
} while ($k < scalar @array);
print "\n ---------------- \n";

my $k = 0;
do {
        print $k, ": ", $array[$k];   # Prints: 0: print1: those2: strings3: out4: for5: me
        $k++;                         # Raises warning: Use of uninitialized value in print
} until ($k > scalar @array);
print "\n ---------------- \n";

# Basic C-style for loops, put the my declaration inside the loop to create a temp var
for(my $i=0; $i < scalar @array; $i++) {
        print $i, ": ", $array[$i];   # Prints: 0: print1: those2: strings3: out4: for5: me
}  # $i variable no longer exists here
print "\n ---------------- \n";

# Native iteration as a for loop. In Perl, the for and foreach syntax do the same thing.
foreach my $string ( @array) {
        print $string;              # Prints: printthosestringsoutforme
}
print "\n ---------------- \n";

# For a for loop over a range / btn indicies, use .. notation
for my $i ( 0 .. $#array ) {
        print $i, ": ", $array[$i]; # Prints: 0: print1: those2: strings3: out4: for5: me
}
print "\n ---------------- \n";

# In Perl, you can only iterate over the keys of a hash, using the built-in keys method:
foreach my $key (keys %scientists) {
        print $key, ", ", $scientists{$key}, "; ";
}                                   # Prints: Darwin, Charles; Einstein, Albert; Newton, Isaac;
print "\n ---------------- \n";

# If you want the keys of a hash sorted, use the buiilt-in sort method first:
foreach my $key (sort keys %scientists) {
        print $key, ", ", $scientists{$key}, "; ";
}                                   # Prints: Darwin, Charles; Einstein, Albert; Newton, Isaac;
print "\n ---------------- \n";

# In poor style methinks, if you don't provide an iterator, Perl defaults to an underscore.
# foreach ( @array ) {
#       print $_;
# }

# You can also write super shorthand gross things:
print $_ foreach @array;            # Prints: printthosestringsoutforme
print "\n ---------------- \n";

###################################################################################

# Loop control: The keywords next and last can be used to control loops in Perl.
# In most languages, these are the same as "continue" and "break"
# loops can be labeled in ALLCAPS

CANDIDATE: for my $candidate ( 2 .. 100 ) {
        for my $divisor ( 2 .. sqrt $candidate ) {
                next CANDIDATE if $candidate % $divisor == 0;
        }
        print $candidate." is prime. ";
}
print "\n ---------------- \n";


###################################################################################
###################################################################################
##                                                                               ##
##                              ARRAY FUNCTIONS                                  ##
##                                                                               ##
###################################################################################
###################################################################################

# Perl's built-in array methods are: pop, push, shift, unshift, and the general slice
my @stack = ("Fred", "Eileen", "Denise", "Charlie");
print @stack, "\n";         # Prints: FredEileenDeniseCharlie

# Pop: removes and returns the final element of the array.
print pop @stack, "\n";     # Prints: Charlie
print @stack, "\n";         # Prints: FredEileenDenise

# Push: appends new element(s) to the end of the array.
push @stack, "Bob", "Alice";
print @stack, "\n";         # Prints: FredEileenDeniseBobAlice

# Shift: extracts and returns the _first_ element of the array.
print shift @stack, "\n";   # Prints: Fred
print @stack, "\n";         # Prints: EileenDeniseBobAlice

# Unshift: ridiculous verbage for adding to the front of an array.
unshift @stack, "Hank", "Grace";
print @stack, "\n";         # Prints: HankGraceEileenDeniseBobAlice

# Splice: removes and returns a slice from the array, with the option to replace it
print splice(@stack, 1, 4, , "<<<", ">>>"), "\n";     # Prints:  GraceEileenDeniseBob
# Leave index 0 : Hank, removes 1-4, replaces with <<<>>>, leaves index 5
print @stack, "\n";         # Prints: Hank<<<>>>Alice

###################################################################################

# Perl's built-in methods for building new arrays from old ones are:
# join, reverse, sort, map, grep, cmp (strings), <=>
# Map and Grep are used to form list comprehensions.

# Join: concatenates many strings into one
my @elements = ("Antimony", "Arsenic", "Aluminum", "Selenium");
print @elements, "\n";              # Prints: AntimonyArsenicAluminumSelenium
print "@elements", "\n";            # Prints: Antimony Arsenic Aluminum Selenium
print join(", ", @elements), "\n";  # Prints: Antimony, Arsenic, Aluminum, Selenium
                                    # Printing the join doesn't modify the array itself

# Reverse: in list-context, returns a list in reversed order; in scalar-context,
# concatenates the list into one word and returns the reversed letter order.
print reverse("Hello", "world"), "\n";      # Prints: worldHello
print reverse("HelloWorld"), "\n";          # Prints: HelloWorld
print scalar reverse("HelloWorld"), "\n";   # Prints: dlroWolleH
print scalar reverse("Hello", "World"), "\n"; # Prints: dlroWolleH

# Sort: returns the input array, sorted in ALPHABETICAL ORDER in place.
my @elevations = (19, 1, 2, 100, 3, 98, 100, 1056);
print join ", ", sort @elevations;      # Prints: 1, 100, 100, 1056, 19, 2, 3, 98 !!!!
print " \n";
my @names = ("Gloria", "Erica", "Eric", "Justin", "Jenna");
print join ", ", sort @names;           # Prints: Eric, Erica, Gloria, Jenna, Justin
print " \n";

# Map: takes an array as the input and applies an operation to every scalar in it.
# Constructs a NEW array out of the results. Operation to perform is inside {} braces.
my @capitals = ("Baton Rouge", "Indianapolis", "Columbus", "Montgomery", "Helena", "Denver", "Boise");
print join ", ", map { uc $_ } @capitals, "\n";
                    # Prints: BATON ROUGE, INDIANAPOLIS, COLUMBUS, MONTGOMERY, HELENA, DENVER, BOISE,
print join ", ", map { lc $_ } sort( @capitals ), "\n";
                    # Prints: baton rouge, boise, columbus, denver, helena, indianapolis, montgomery,

# Grep: Takes an array as an input and returns a filtered array as output.
# Similar to map, except the second argument in grep is evaluated for each member of the array:
# If the statement is evaluated as True, the element is put in the new array, otherwise skipped.
print join ", ", grep { length $_ == 6 } @capitals;             # Prints: Helena, Denver
print " \n";
print join ", ", grep { substr($_, 0, 1) eq "D" } @capitals;    # Prints: Denver
print " \n";
print scalar grep { $_ eq "Columbus" } @capitals;               # Prints: 1
print " \n";

# Comparisons are done with cmp for strings (alphabetical) and the spaceship operator <=> for numbers.
# $a and $b are inputs, Perl returns -1 if $a lt $b, 0 if $a eq $b, and 1 if $a gt $b
# cmp operator:
print join ", ", sort { $a cmp $b } @elevations;    # Prints: 1, 100, 100, 1056, 19, 2, 3, 98
print " \n";
print join ", ", sort { $a cmp $b } @capitals;  # Prints: Baton Rouge, Boise, Columbus, Denver, Helena, Indianapolis, Montgomery
print " \n";

# spaceship <=> operator: (Note: $a and $b are always scalars. You can write code for references)
# $a and $b are inputs, Perl returns -1 if $a < $b, 0 if $a == $b, and 1 if $a > $b
print join ", ", sort { $a <=> $b } @elevations;    # Prints: 1, 2, 3, 19, 98, 100, 100, 1056
print " \n";
print join ", ", sort { $a <=> $b } @capitals;  # Raises warning: Argument "Baton Rouge" isn't numeric in sort
print " \n";                                    # Prints: Baton Rouge, Indianapolis, Columbus, Montgomery, Helena, Denver, Boise

# NOTE: Like $_, $a and $b are actually global variables which are populated with a pair of
# values to be compared each time.

###################################################################################

# Perl Built-In Functions
# Common built-in functions include: print, sort, map, grep, keys, scalar, etc.
# Built-in functions are:
#    are numerous
#    are very useful
#    are extensively documented
#    vary greatly in syntax, so check the documentation
#    sometimes accept regular expressions as arguments
#    sometimes accept entire blocks of code as arguments
#    sometimes don't require commas between arguments
#    sometimes will consume an arbitrary number of comma-separated arguments and sometimes will not
#    sometimes will fill in their own arguments if too few are supplied
#    generally don't require brackets around their arguments except in ambiguous circumstances
#
# The best advice regarding built-in functions is to know that they exist and to check the docs.
# Chances are that a common and/or low-level task already has a built-in functions.

###################################################################################

