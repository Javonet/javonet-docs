package TestClass::TestClass;
use strict;
use warnings FATAL => 'all';
use Moose;

#<Fields>
our $static_value = 3;

sub new {
    my $class = shift;
    my $self =
        {
            public_value  => 1,
            private_value => 2,
        };
    return bless $self, $class;
}
#</Fields>

#<Methods>
sub multiply_by_two {
    my ($first_arg) = @_;
    return $first_arg * 2;
}

sub multiply_two_numbers {
    my ($self, $first_arg, $second_arg) = @_;
    return $first_arg * $second_arg;
}
#</Methods>

#<Arrays>
sub get_1d_array {
    return ["one", "two", "three", "four", "five"];
}

sub add_number_to_1d_array {
    my ($self, $myArray, $myDouble) = @_;
    for(@$myArray) {
        $_ = $_ + $myDouble;
    }
    return $myArray;
}
#</Arrays>



#<Empty>
#</Empty>

1;