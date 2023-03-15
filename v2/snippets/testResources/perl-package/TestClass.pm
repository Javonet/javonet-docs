# <Test_Resource_All>
package TestClass::TestClass;
use strict;
use warnings FATAL => 'all';
use Moose;

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

sub multiply_by_two {
    my ($first_arg) = @_;
    return $first_arg * 2;
}

sub multiply_two_numbers {
    my ($self, $first_arg, $second_arg) = @_;
    return $first_arg * $second_arg;
}

1;
# </Test_Resource_All>