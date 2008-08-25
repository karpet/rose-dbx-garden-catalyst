package Rose::DBx::Garden::Catalyst::YUI::DataTable;
use strict;
use warnings;
use Carp;
use Data::Dump qw( dump );
use base qw( CatalystX::CRUD::YUI::DataTable );
use Scalar::Util qw( blessed );

our $VERSION = '0.09_05';

=head1 NAME

Rose::DBx::Garden::Catalyst::YUI::DataTable - YUI DataTable struct

=head1 SYNOPSIS

 my $datatable = $yui->datatable( 
            results     => $results,    # CX::CRUD::Results or CX::CRUD::Object
            controller  => $controller, 
            form        => $form,
            method_name => $rel_info->{method},
            field_names => $form->field_names,
  );
  
 $datatable->data;  # returns serialized results
 $datatable->count; # returns number of data
 
=head1 METHODS

=cut

sub _serialize_results {
    my $self = shift;
    my $max_loops
        = $self->form->app->req->params->{_no_page}
        ? 0
        : (    $self->form->app->req->params->{_page_size}
            || $self->controller->page_size );
    my $counter     = 0;
    my $results     = $self->results;
    my $method_name = $self->method_name;
    my @data;

    if ( $results->isa('CatalystX::CRUD::Results') ) {
        while ( my $r = $results->next ) {

            # $r isa CatalystX::CRUD::Object

            push(
                @data,
                $self->yui->serialize(
                    {   rdbo        => $r,
                        method_name => $method_name,
                        field_names => $self->col_keys,
                        parent      => $self->form->app->stash->{object},
                        c           => $self->form->app,
                        show_related_values => $self->show_related_values,
                        takes_object_as_argument =>
                            $self->form->meta->takes_object_as_argument,
                    }
                )
            );
            last if $max_loops && ++$counter > $max_loops;
        }
    }
    else {
        croak "RDBO object iterator TODO";
        my $method   = $method_name . '_iterator';
        my $iterator = $results->$method;
        while ( my $r = $iterator->next ) {

            # $r isa Rose::DBx::Garden::Catalyst::Object

            push(
                @data,
                $self->yui->serialize(
                    {   rdbo        => $r,
                        method_name => $method_name,
                        field_names => $self->col_keys,
                        parent      => $self->form->app->stash->{object},
                        c           => $self->form->app,
                        show_related_values => $self->show_related_values,
                        takes_object_as_argument =>
                            $self->form->meta->takes_object_as_argument,
                    }
                )
            );
            last if $max_loops && ++$counter > $max_loops;
        }
    }

    $self->{count} = $counter;

    return \@data;
}

1;

__END__

=head1 AUTHOR

Peter Karman, C<< <karman at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-rose-dbx-garden-catalyst at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Rose-DBx-Garden-Catalyst>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Rose::DBx::Garden::Catalyst

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Rose-DBx-Garden-Catalyst>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Rose-DBx-Garden-Catalyst>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Rose-DBx-Garden-Catalyst>

=item * Search CPAN

L<http://search.cpan.org/dist/Rose-DBx-Garden-Catalyst>

=back

=head1 ACKNOWLEDGEMENTS

The Minnesota Supercomputing Institute C<< http://www.msi.umn.edu/ >>
sponsored the development of this software.

=head1 COPYRIGHT & LICENSE

Copyright 2008 by the Regents of the University of Minnesota.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

