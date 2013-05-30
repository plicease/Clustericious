package Clustericious::Command::generate;

use strict;
use warnings;

use Mojo::Base 'Mojolicious::Command::generate';

our $VERSION = '0.9921';

has namespaces =>
      sub { [qw/Clustericious::Command::generate
                Mojolicious::Command::generate
                Mojo::Command::generate/] };

1;
