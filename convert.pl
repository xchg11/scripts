#!/usr/bin/perl
### by fire 2014 fire@fire7.ru
use Digest::SHA;
use Math::BigInt;
use Time::HiRes qw(gettimeofday tv_interval);
use POSIX qw/strftime/;
sub HexToBinary{
  my(%h)=('0'=>'0000','1'=>'0001','2'=>'0010','3'=>'0011','4'=>'0100','5'=>'0101','6'=>'0110','7'=>'0111','8'=>'1000','9'=>'1001',
  'A'=>'1010','B'=>'1011','C'=>'1100','D'=>'1101','E'=>'1110','F'=>'1111');
  $_=uc $_[0];
  s/([0-9A-F])/$h{$1}/g;
  return $_;
   };
#
#
if (@ARGV == 0)
{
print "convert bin-dec-hex\nfire 2014 fire@fire7.ru\nprimer\t ./convert.pl hex FFF\n\t\t\tdec 129393\n\t\t\tbin 10100101\n\t\t\ttimestamp 1212934884\n";
}
if (uc($ARGV[0]) eq "HEX")
{
$n1=uc($ARGV[1]);
$a1=Math::BigInt->from_hex($n1);
print "HEX:= ",$n1,"\n","BIN:= ",HexToBinary($n1),"\n","DEC:= ",$a1->as_int(),"\n";
}
if (uc($ARGV[0]) eq "DEC")
{
$n1=uc($ARGV[1]);
$a1=Math::BigInt->new($n1);
$bin1=HexToBinary(substr(($a1->as_hex),2,length($a1->as_hex)-2));
print "HEX:= ",uc(substr(($a1->as_hex(),2,length($a1->as_hex)-2))),"\n","BIN:= ",$bin1," siz=",length($bin1),"\n","DEC:= ",$a1->as_int(),"\n";
}
#
if (uc($ARGV[0]) eq "BIN")
{
$n1=uc($ARGV[1]);
$a1=Math::BigInt->from_bin($n1);
$h1=uc(substr($a1->as_hex(),2,length($a1->as_hex)-2));
print "HEX:= ",$h1,"\n","BIN:= ",$ARGV[1],"\n","DEC:= ",$a1->as_int(),"\n";
}
if (uc($ARGV[0]) eq "TIMESTAMP")
{
if ((length($ARGV[1])>10) || (length($ARGV[1])<9)) { print "error timestamp....\n";exit;}
my $dt = strftime("%Y-%m-%d %H:%M:%S", localtime($ARGV[1]));
print "timestamp: ",$dt,"\n";
}
#
#
exit(0);
