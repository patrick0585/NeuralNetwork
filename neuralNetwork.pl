#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use lib qw(Modules);
use Modules::Tools qw(normalize matrix_multiply matrix_dot_product);

#print Modules::Tools::normalize(10, 8, 20, 0, 1)."\n";

my $matrix = [
  [4,0],
  [1,-9]
];

my ($r, $c) = count_matrix_rows_cols($matrix);
print "r: $r\n";
print "c: $c\n";

sub count_matrix_rows_cols {
    my $matrix = shift;
    my $num_rows = @$matrix;
    my $num_cols = @{$matrix->[0]};
    return ($num_rows, $num_cols);
}

print Dumper($matrix);
print Dumper(matrix_multiply($matrix, 2));


my $m1 = [
  [3,4,2]
];
my $m2 = [
  [13,9,7,15],
  [8,7,4,6],
  [6,4,0,3]
];

#count_matrix_rows_cols($m1);

print Dumper(matrix_dot_product($m1, $m2));

exit;
foreach my $i ( @$matrix ) {
  foreach my $j ( @$i ) {
    my $j_ = $j;
    $j = $j_ * 2;
  }
}

print Dumper($matrix);