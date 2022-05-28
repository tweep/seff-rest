#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use IPC::System::Simple qw(system systemx capture capturex);

get '/' => sub ($c) {
  $c->render(template => 'index');
};


# slurm?job_id=123432_2
get '/slurm' => sub {
  my $self = shift;

  my $job_id = $self->param('job_id');

  my $result = call_seff($job_id );  

  $self->render(text => $result); 
};

app->start; 


sub call_seff {  
  my ($job_id) = @_;   

  my $output = capture("seff " , $job_id);
  return $output;  
} 

__DATA__

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Janni ! Welcome to the Mojolicious real-time web framework!</h1>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
