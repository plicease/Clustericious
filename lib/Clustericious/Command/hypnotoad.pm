=head1 NAME

Clustericious::Command::Hypnotoad

=head1 DESCRIPTION

Start a hypnotoad webserver.

Configuration for the server is taken directly from the
"hypnotoad" entry in the config file, and turned into
a config file for hypnotoad.  The location of the file
can be controllled by setting HYPNOTOAD_CONFIG.

=head1 EXAMPLE

 start_mode : "hypnotoad"
 hypnotoad:
    workers : 1
    listen : [ "http://*:3000" ]
    inactivity_timeout : 50
    pid_file : /tmp/minionrelay.pid


=head1 SEE ALSO

Mojo::Server::Hypnotoad

=cut

package Clustericious::Command::hypnotoad;
use Clustericious::Log;

use Clustericious::App;
use Clustericious::Config;
use Mojo::Server::Hypnotoad;
use Data::Dumper;
use Cwd qw/getcwd abs_path/;
use base 'Mojo::Command';

use strict;
use warnings;

__PACKAGE__->attr(description => "Start a hypnotad web server.\n");

__PACKAGE__->attr(usage => <<EOT);
Usage $0: hypnotoad
No options are available.  The 'hypnotoad' entry in the config file
is used for configuration.
EOT

sub run {
    my $self = shift;
    my $conf = Clustericious::Config->new($ENV{MOJO_APP})->hypnotoad;
    my %conf = %$conf;
    my $conf_string = Data::Dumper->Dump([\%conf],["conf"]);
    DEBUG "Config : $conf_string";
    DEBUG "Running hypnotoad : $ENV{MOJO_EXE}";
    $ENV{HYPNOTOAD_EXE} = "$0 hypnotoad";
    my $sentinel = '/no/such/file/because/these/are/deprecated';
    if ( $ENV{HYPNOTOAD_CONFIG} && $ENV{HYPNOTOAD_CONFIG} ne $sentinel ) {
        WARN "HYPNOTOAD_CONFIG value $ENV{HYPNOTOAD_CONFIG} will be ignored";
    }
    # During deprecation, this value must be defined but not pass the -r test
    # to avoid warnings.
    my $pid = fork();
    if (!defined($pid)) {
        LOGDIE "Unable to fork";
    }

    unless ($pid) {
        DEBUG "Child process $$";
        local $ENV{HYPNOTOAD_CONFIG} = $sentinel;
        my $toad = Mojo::Server::Hypnotoad->new;
        $toad->run($ENV{MOJO_EXE});
        WARN "hypnotoad exited";
        exit;
    }
    sleep 1;
    return 1;
}

1;

