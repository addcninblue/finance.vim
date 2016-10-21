use 5.24.0;
use warnings;
use strict;

my $month = "october";
# my $month = `date +%B`;
my $totalMoney = 0;
my $personal = 0;
my $necessities = 0;
my $gifts = 0;

while(<>){
    print if !/Total/;
    if (/Total/) {next;}
    if(/\$([0-9]+)/){
        $totalMoney += $1;
        my $currentMoney = $1;
        if(/\|\spersonal\s/i){$personal += $currentMoney;}
        # if(/necessities/i){$necessities += $currentMoney;}
        if(/\|\snecessities\s/i){$necessities += $currentMoney;}
        if(/\|\sgifts\s/i){$gifts += $currentMoney;}
    }
}

my $personalPercentage = $personal / $totalMoney;
my $necessitiesPercentage = $necessities / $totalMoney;
my $giftsPercentage = $gifts / $totalMoney;

my @getPicture = qq#curl -o ${month}.png "http://chart.apis.google.com/chart?cht=p&chd=t:${personalPercentage},${necessitiesPercentage},${giftsPercentage}&chs=600x300&chl=Personal:${personal}|Necessities:${necessities}|Gifts:${gifts}" > /dev/null 2>&1#;
system(@getPicture);

print "Total | \$$totalMoney | - | -";
