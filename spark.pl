#!/usr/bin/perl

use strict;
use warnings;
use JSON 'decode_json';
use LWP;

# Read command-line arguments.

# ./spark.pl function name arg
# ./spark.pl variable name type

my $usage = <<EOF
$0 function <name> <arg> or
$0 variable <name> <type>
  where <type> is one of BOOLEAN, STRING, DOUBLE, INT
EOF
;

print $usage and exit unless $#ARGV == 2 and
  ($ARGV[0] eq 'function' or $ARGV[0] eq 'variable');

# Read config file.

open(my $configfh, '<', 'config') or die "Couldn't open config file.";
my ($device_id, $access_token);
foreach (<$configfh>) {
  if (/DEVICE_ID=(.+)$/) {
    $device_id = $1;
  } elsif (/ACCESS_TOKEN=(.+)$/) {
    $access_token = $1;
  }
}

# Run request.

my $ua = new LWP::UserAgent();
my $response;

if ($ARGV[0] eq 'function') {
  my ($funName,$funArg) = @ARGV[1..2];
  $response = $ua->post("https://api.spark.io/v1/devices/$device_id/$funName",
    {'access_token' => $access_token, 'args' => $funArg});
} else {
  my ($varName,$varType) = @ARGV[1..2];
  $response = $ua->get("https://api.spark.io/v1/devices/$device_id/$varName" .
    "?access_token=$access_token");
}
print $response->decoded_content();
