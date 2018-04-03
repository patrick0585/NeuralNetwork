use strict;
use warnings;
use Test::More tests => 10;

use Modules::Tools qw(normalize count_matrix_rows_cols matrix_multiply);

print ".. testing the normalize function!\n";

#
#	Dataset 8, 10, 15, 20 in Range [0,1]
#

ok( normalize(8, 8, 20, 0, 1) == 0.00, 'normalized value for x=8  in range [0,1] is 0.00');
ok( normalize(10, 8, 20, 0, 1) == 0.17, 'normalized value for x=10 in range [0,1] is 0.17');
ok( normalize(15, 8, 20, 0, 1) == 0.58, 'normalized value for x=15 in range [0,1] is 0.58');
ok( normalize(20, 8, 20, 0, 1) == 1.00, 'normalized value for x=20 in range [0,1] is 1.00');


#
#	Testing row- and col count for a matrix
#
print "\n.. testing row and col count function!\n";
my $matrix = [
    [1,2,3],
    [4,5,6]
];
my ($row_count, $col_count) = count_matrix_rows_cols($matrix);
ok( $row_count == 2, 'Row count for matrix is 2');
ok( $col_count == 3, 'Col count for matrix is 3');


#
#	Testing a matrix multiplication
#
print "\n.. testing matrix multiplication function!\n";
$matrix = [
    [0,2],
    [-1, 9]
];

use Data::Dumper;
my $new_m = matrix_multiply($matrix, 2);
ok( $$new_m[0][0] == 0, 'result for matrix multiplication in [0][0] is 0');
ok( $$new_m[0][1] == 4, 'result for matrix multiplication in [0][1] is 4');
ok( $$new_m[1][0] == -2, 'result for matrix multiplication in [1][0] is -2');
ok( $$new_m[1][1] == 18, 'result for matrix multiplication in [1][1] is 18');
