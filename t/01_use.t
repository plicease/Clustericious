use strict;
use warnings;
use Test::More tests => 47;

BEGIN { eval 'use EV' }

require_ok('Clustericious');
require_ok('Clustericious::Config::Helpers');
require_ok('Clustericious::Config::Plugin');
require_ok('Clustericious::Config');
require_ok('Clustericious::HelloWorld');
require_ok('Clustericious::Controller');
require_ok('Clustericious::RouteBuilder');
require_ok('Clustericious::Client::Object');
require_ok('Clustericious::Client::Command');
require_ok('Clustericious::Client::Meta');
require_ok('Clustericious::Client::Meta::Route');
require_ok('Clustericious::Client::Object::DateTime');
require_ok('Clustericious::Client::Object::Params');
require_ok('Clustericious::Commands');
require_ok('Clustericious::App');
require_ok('Clustericious::Command::lighttpd');
require_ok('Clustericious::Command::start');
require_ok('Clustericious::Command::stop');
require_ok('Clustericious::Command::generate');
require_ok('Clustericious::Command::hypnotoad');
require_ok('Clustericious::Command::status');
require_ok('Clustericious::Command::apache');
require_ok('Clustericious::Command::configdebug');
require_ok('Clustericious::Command::configtest');
require_ok('Clustericious::Command::configure');
require_ok('Clustericious::Command::plackup');
require_ok('Clustericious::Command::nginx');
require_ok('Clustericious::Command::configpath');
require_ok('Clustericious::Command::generate::client');
require_ok('Clustericious::Command::generate::mbd_app');
require_ok('Clustericious::Command::generate::app');
require_ok('Clustericious::Command');
require_ok('Clustericious::Renderer');
require_ok('Clustericious::RouteBuilder::Proxy');
require_ok('Clustericious::RouteBuilder::Search');
require_ok('Clustericious::RouteBuilder::CRUD');
require_ok('Clustericious::RouteBuilder::Common');
require_ok('Clustericious::Plugin::PlugAuth');
require_ok('Clustericious::Plugin::AutodataHandler');
require_ok('Clustericious::Client');
require_ok('Clustericious::HelloWorld::Client');
require_ok('Clustericious::Log');
require_ok('Clustericious::Templates');
require_ok('Test::Clustericious');
require_ok('Test::Clustericious::Command');
require_ok('Test::Clustericious::Config');
require_ok('Test::Clustericious::Log');
