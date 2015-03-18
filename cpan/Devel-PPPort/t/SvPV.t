################################################################################
#
#            !!!!!   Do NOT edit this file directly!   !!!!!
#
#            Edit mktests.PL and/or parts/inc/SvPV instead.
#
#  This file was automatically generated from the definition files in the
#  parts/inc/ subdirectory by mktests.PL. To learn more about how all this
#  works, please read the F<HACKERS> file that came with this distribution.
#
################################################################################

BEGIN {
  if ($ENV{'PERL_CORE'}) {
    chdir 't' if -d 't';
    @INC = ('../lib', '../ext/Devel-PPPort/t') if -d '../lib' && -d '../ext';
    require Config; import Config;
    use vars '%Config';
    if (" $Config{'extensions'} " !~ m[ Devel/PPPort ]) {
      print "1..0 # Skip -- Perl configured without Devel::PPPort module\n";
      exit 0;
    }
  }
  else {
    unshift @INC, 't';
  }

  sub load {
    eval "use Test";
    require 'testutil.pl' if $@;
  }

  if (49) {
    load();
    plan(tests => 49);
  }
}

use Devel::PPPort;
use strict;
$^W = 1;

package Devel::PPPort;
use vars '@ISA';
require DynaLoader;
@ISA = qw(DynaLoader);
bootstrap Devel::PPPort;

package main;

my $mhx = "mhx";

ok(&Devel::PPPort::SvPVbyte($mhx), 3);

my $i = 42;

ok(&Devel::PPPort::SvPV_nolen($mhx), $i++);
ok(&Devel::PPPort::SvPV_const($mhx), $i++);
ok(&Devel::PPPort::SvPV_mutable($mhx), $i++);
ok(&Devel::PPPort::SvPV_flags($mhx), $i++);
ok(&Devel::PPPort::SvPV_flags_const($mhx), $i++);

ok(&Devel::PPPort::SvPV_flags_const_nolen($mhx), $i++);
ok(&Devel::PPPort::SvPV_flags_mutable($mhx), $i++);
ok(&Devel::PPPort::SvPV_force($mhx), $i++);
ok(&Devel::PPPort::SvPV_force_nolen($mhx), $i++);
ok(&Devel::PPPort::SvPV_force_mutable($mhx), $i++);

ok(&Devel::PPPort::SvPV_force_nomg($mhx), $i++);
ok(&Devel::PPPort::SvPV_force_nomg_nolen($mhx), $i++);
ok(&Devel::PPPort::SvPV_force_flags($mhx), $i++);
ok(&Devel::PPPort::SvPV_force_flags_nolen($mhx), $i++);
ok(&Devel::PPPort::SvPV_force_flags_mutable($mhx), $i++);

ok(&Devel::PPPort::SvPV_nolen_const($mhx), $i++);
ok(&Devel::PPPort::SvPV_nomg($mhx), $i++);
ok(&Devel::PPPort::SvPV_nomg_const($mhx), $i++);
ok(&Devel::PPPort::SvPV_nomg_const_nolen($mhx), $i++);
ok(&Devel::PPPort::SvPV_nomg_nolen($mhx), $i++);

$mhx = 42; ok(&Devel::PPPort::SvPV_nolen($mhx), 0);
$mhx = 42; ok(&Devel::PPPort::SvPV_const($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_mutable($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_flags($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_flags_const($mhx), 2);

$mhx = 42; ok(&Devel::PPPort::SvPV_flags_const_nolen($mhx), 0);
$mhx = 42; ok(&Devel::PPPort::SvPV_flags_mutable($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_force($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_force_nolen($mhx), 0);
$mhx = 42; ok(&Devel::PPPort::SvPV_force_mutable($mhx), 2);

$mhx = 42; ok(&Devel::PPPort::SvPV_force_nomg($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_force_nomg_nolen($mhx), 0);
$mhx = 42; ok(&Devel::PPPort::SvPV_force_flags($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_force_flags_nolen($mhx), 0);
$mhx = 42; ok(&Devel::PPPort::SvPV_force_flags_mutable($mhx), 2);

$mhx = 42; ok(&Devel::PPPort::SvPV_nolen_const($mhx), 0);
$mhx = 42; ok(&Devel::PPPort::SvPV_nomg($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_nomg_const($mhx), 2);
$mhx = 42; ok(&Devel::PPPort::SvPV_nomg_const_nolen($mhx), 0);
$mhx = 42; ok(&Devel::PPPort::SvPV_nomg_nolen($mhx), 0);

my $str = "";
&Devel::PPPort::SvPV_force($str);
my($s2, $before, $after) = &Devel::PPPort::SvPV_renew($str, 81, "x"x80);
ok($str, "x"x80);
ok($s2, "x"x80);
ok($before < 81);
ok($after, 81);

$str = "x"x400;
&Devel::PPPort::SvPV_force($str);
($s2, $before, $after) = &Devel::PPPort::SvPV_renew($str, 41, "x"x40);
ok($str, "x"x40);
ok($s2, "x"x40);
ok($before > 41);
ok($after, 41);

