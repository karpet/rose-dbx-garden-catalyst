package Rose::DBx::Garden::Catalyst::Form;
use strict;
use warnings;
use base qw( Rose::HTMLx::Form::Related::RDBO );
use Rose::DBx::Garden::Catalyst::Form::Metadata;

our $VERSION = '0.180';

=head1 NAME

Rose::DBx::Garden::Catalyst::Form - base RHTMLO Form class

=head1 DESCRIPTION

Rose::DBx::Garden::Catalyst::Form is a subclass of Rose::HTMLx::Form::Related
for using with YUI, RDBO and CatalystX::CRUD.

=head1 METHODS

See Rose::HTMLx::Form::Related.

=cut

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

