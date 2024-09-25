package TestClass::TestClass;
use strict;
use warnings FATAL => 'all';
use Moose;

# <Fields>
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
# </Fields>

# <Methods>
sub multiply_by_two {
	my ($a) = @_;
	return $a * 2;
}

sub multiply_two_numbers {
	my ($self, $a, $b) = @_;
	return $a * $b;
}
# </Methods>

# <Arrays>
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
# </Arrays>

# <Exceptions>
sub divide_by {
	return divide_by_second(@_);
}

sub divide_by_second {
	return divide_by_third(@_);
}

sub divide_by_third {
	my ($x, $y) = @_;
	return $x / $y;
}
# </Exceptions>

# <Empty>
# empty
# </Empty>

# <PassingNull>
sub pass_null {
	my ($arg) = @_;
	if (!defined $arg) {
		return "Method called with null";
	} else {
		return "Method not called with null";
	}
}

sub pass_null_2 {
	my ($arg1, $arg2) = @_;
	if (!defined $arg2) {
		return "Method2 called with null";
	} else {
		return "Method2 not called with null";
	}
}
# </PassingNull>

# <ReturningNull>
sub return_null {
	return undef;
}
# </ReturningNull>

1;