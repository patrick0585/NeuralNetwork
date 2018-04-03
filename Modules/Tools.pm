package Modules::Tools {

        use strict;
        use Exporter 'import';

        our $VERSION     = 1.10;
        our @ISA         = qw();
        our @EXPORT      = qw();
        our @EXPORT_OK   = qw(normalize count_matrix_rows_cols matrix_multiply matrix_dot_product);
        our %EXPORT_TAGS = ( DEFAULT => [qw()],
                             Both    => [qw()]);

        #
        #	( x - MinVal )
        #	--------------	* ( maxRange - minRange) + minRange
        #	MaxVal - MinVal
        #
        sub normalize {
            my ($x, $minVal, $maxVal, $minRange, $maxRange) = @_;            
            return sprintf("%.2f", ( ( $x - $minVal ) / ( $maxVal - $minVal ) ) * ( $maxRange - $minRange ) + $minRange);
        }
        
        #
        #  count rows and cols from a matrix
        #
        sub count_matrix_rows_cols {
            my $matrix = shift;
            my $num_rows = @$matrix;
            my $num_cols = @{$matrix->[0]};
            return ($num_rows, $num_cols);
        }


        #
        #	Matrix Multiplication
        #
        #	2 x [0,2]    ->   [0,4]
        #	    [-1,9]	  [-2,18]]
        #        
        sub matrix_multiply {
            my ($matrix, $x) = @_;
            my $mul_matrix;
            my $row_length = @$matrix;
            
            for (my $i=0;$i<$row_length; $i++) {
                my $col_length = @{$$matrix[$i]};
                for (my $j=0;$j<$col_length; $j++) {
                    $$mul_matrix[$i][$j] = $$matrix[$i][$j] * $x;
                }
            }
            return $mul_matrix;            
        }

        #
        #	Matrix dot product
        #
        #	          [13,9,7,15]
        #	[3,4,2]	* [8,7,4,6]	= [83, 63, 37, 75]
        #		  [6,4,0,3]
        #        
        sub matrix_dot_product {
            my ($matrix1, $matrix2) = @_;
            my ($r1, $c1) = count_matrix_rows_cols($matrix1);
            my ($r2, $c2) = count_matrix_rows_cols($matrix2);
            my $product;
            
            if ($c1 != $r2) {
                die "matrix 1 has $c1 columns and matrix 2 has $r2 rows!\n";
            }
            for (my $i=0;$i<$r1;$i++) {
                for(my $j=0;$j<$c2;$j++) {
                    my $sum = 0;
                    for (my $z=0;$z<$c1;$z++) {
                        $sum += $$matrix1[$i][$z]*$$matrix2[$z][$j];
                    }
                    $$product[$i][$j] = $sum;
                }
            }
            return $product;
        }        
};

1;