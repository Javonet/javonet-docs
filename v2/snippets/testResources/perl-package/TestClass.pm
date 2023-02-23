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

sub get_private_value{
    my ($self) = @_;
    return $self->{private_value};}

sub get_public_value{
    my ($self) = @_;
    return $self->{public_value};}

sub set_private_value{
    my ($self, $value) = @_;
    if (@_ == 2) {
        $self->{private_value} = $value;
    }
    return $self->{private_value};
}

sub set_public_value{
    my ($self, $value) = @_;
    if (@_ == 2) {
        $self->{public_value} = $value;
    }
    return $self->{public_value};
}

sub multiply_by_two {
    my ($first_arg) = @_;
    return $first_arg * 2;
}

sub multiply_two_numbers {
    my ($self, $first_arg, $second_arg) = @_;
    return $first_arg * $second_arg;
}

sub get_1d_array {
    return ["one", "two", "three", "four", "five"];
}

sub add_number_to_1D_array {
    my ($self, $myArray, $myDouble) = @_;
    for(@$myArray) {
        $_ = $_ + $myDouble;
    }
    return $myArray;
}


1;