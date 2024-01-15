package Tie::Array::ArrayData;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub TIEARRAY {
    require Module::Load::Util;

    my $class = shift;
    my $arraydata = @_;

    die "Please specify an ArrayData module to instantiate (string or 2-element array)" unless $arraydata;
    my $adobj = Module::Load::Util::instantiate_class_with_optional_args({ns_prefix=>"ArrayData"}, $arraydata);

    return bless {
        _adobj => $adobj,
    }, $class;
}

sub FETCH {
    my ($self, $index) = @_;
    $self->{_adobj}->get_item_at_pos($index);
}

sub STORE {
    my ($self, $index, $value) = @_;
    die "Not supported";
}

sub FETCHSIZE {
    my $self = shift;
    $self->{_adobj}->get_item_count;
}

sub STORESIZE {
    my ($self, $count) = @_;
    die "Not supported";
}

# sub EXTEND this, count

# sub EXISTS this, key

# sub DELETE this, key

sub PUSH {
    my $self = shift;
    die "Not supported";
}

sub POP {
    my $self = shift;
    die "Not supported";
}

sub UNSHIFT {
    my $self = shift;
    die "Not supported";
}

sub SHIFT {
    my $self = shift;
    die "Not supported";
}

sub SPLICE {
    my $self   = shift;
    die "Not supported";
}

1;
# ABSTRACT: Access ArrayData object as a tied array

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Tie::Array::ArrayData;

 tie my @ary, 'Tie::Array::ArrayData', 'Sample::DeNiro'   ; # access rows as arrayref

 # get the second row
 my $title = $ary[1];


=head1 DESCRIPTION


=head1 SEE ALSO

L<ArrayData>

=cut
