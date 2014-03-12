package Choice::App;
use strict;
use warnings;
use Dancer ':syntax';
use Template;

our $VERSION = '0.1';

get '/' => sub {
    template 'index';
};

get '/choix/:hash' => sub {
   "You make a choice !";
};

get '/admin/:hash?' => sub {
# si pas de hash on liste les votes en cours
   "Admin ".(param('hash')||"all")."!";
};

get '/propose' => sub {
# on crée un choix
   my @types = qw/doodle vote/;
   foreach(@types) { debug $_ }
   template 'propose', {
      'types' => \@types
   };
};

true;
