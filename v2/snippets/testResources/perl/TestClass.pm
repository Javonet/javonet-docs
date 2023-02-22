package PerlTestClass::PerlTestClass;
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


1;