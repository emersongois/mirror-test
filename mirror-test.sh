#!/bin/bash 

# mirror-test.sh 
# Taken from http://www.linuxquestions.org/questions/slackware-14/how-to-select-best-mirror-for-slackpkg-4175562376/page2.html
# Originally written for Ubuntu by Lance Rushing <lance_rushing@hotmail.com> 
# Dated 01-Sep-2006 
# Taken from http://ubuntuforums.org/showthread.php?t=251398 
# This script is covered under the GNU Public License: http://www.gnu.org/licenses/gpl.txt 

# Modified for Slackware by Jeremy Brent Hansen <jebrhansen -at- gmail.com> 
# Modified 2015/11/06 


# Add or change mirrors from /etc/slackpkg/mirrors as desired (these are the US mirrors) 
MIRRORS="
`# AUSTRALIA (AU)`
ftp://ftp.cc.swin.edu.au/slackware/slackware64-14.1/
http://ftp.cc.swin.edu.au/slackware/slackware64-14.1/
ftp://ftp.iinet.net.au/pub/slackware/slackware64-14.1/
http://ftp.iinet.net.au/pub/slackware/slackware64-14.1/
ftp://mirror.aarnet.edu.au/pub/slackware/slackware64-14.1/
http://mirror.aarnet.edu.au/pub/slackware/slackware64-14.1/
ftp://mirror.as24220.net/pub/slackware/slackware64-14.1/
http://mirror.as24220.net/pub/slackware/slackware64-14.1/
ftp://mirror.internode.on.net/.pub2/slackware/slackware64-14.1/
http://mirror.internode.on.net/pub/slackware/slackware64-14.1/
http://mirror.primusdatacentre.com.au/slackware/slackware64-14.1/
`# AUSTRIA (AT)`
ftp://ftp.slackware.at/slackware64-14.1/
http://ftp.slackware.at/data/slackware64-14.1/
ftp://gd.tuwien.ac.at/opsys/linux/freesoftware.com/slackware64-14.1/
http://gd.tuwien.ac.at/opsys/linux/freesoftware.com/slackware64-14.1/
`# BELARUS (BY)`
ftp://mirror.datacenter.by/pub/slackware/slackware64-14.1/
http://mirror.datacenter.by/pub/slackware/slackware64-14.1/
`# BRAZIL (BR)`
ftp://ftp.slackware-brasil.com.br/slackware64-14.1/
http://ftp.slackware-brasil.com.br/slackware64-14.1/
`# BULGARIA (BG)`
ftp://mirrors.unixsol.org/slackware/slackware64-14.1/
http://mirrors.unixsol.org/slackware/slackware64-14.1/
`# CANADA (CA)`
ftp://mirror.csclub.uwaterloo.ca/slackware/slackware64-14.1/
http://mirror.csclub.uwaterloo.ca/slackware/slackware64-14.1/
ftp://mirror.its.dal.ca/slackware/slackware64-14.1/
http://mirror.its.dal.ca/slackware/slackware64-14.1/
`# CHINA (CN)`
http://mirror.bjtu.edu.cn/slackware/slackware64-14.1/
http://mirrors.163.com/slackware/slackware64-14.1/
http://mirrors.ustc.edu.cn/slackware/slackware64-14.1/
`# COSTA RICA (CR)`
ftp://mirrors.ucr.ac.cr/slackware/pub/slackware/slackware64-14.1/
http://mirrors.ucr.ac.cr/slackware/pub/slackware/slackware64-14.1/
`# CZECH REPUBLIC (CZ)`
http://ftp.slackware.cz/slackware/slackware64-14.1/
ftp://odysseus.linux.cz/pub/linux/slackware/slackware64-14.1/
http://odysseus.linux.cz/pub/linux/slackware/slackware64-14.1/
`# DENMARK (DK)`
ftp://mirrors.dotsrc.org/.disk1/slackware/slackware64-14.1/
http://mirrors.dotsrc.org/.disk1/slackware/slackware64-14.1/
`# FINLAND (FI)`
 ftp://elektroni.phys.tut.fi/slackware64-14.1/
`# FRANCE (FR)`
ftp://mirror.ovh.net/mirrors/ftp.slackware.com/slackware64-14.1/
http://mirror.ovh.net/mirrors/ftp.slackware.com/slackware64-14.1/
ftp://nephtys.lip6.fr/pub/linux/distributions/slackware/slackware64-14.1/
http://nephtys.lip6.fr/pub/linux/distributions/slackware/slackware64-14.1/
`# GERMANY (DE)`
ftp://ftp.fu-berlin.de/unix/linux/slackware/slackware64-14.1/
ftp://ftp.gwdg.de/pub/linux/slackware/slackware64-14.1/
http://ftp.gwdg.de/pub/linux/slackware/slackware64-14.1/
ftp://ftp.tu-chemnitz.de/.SAN0/pub/linux/slackware/slackware64-14.1/
http://ftp.tu-chemnitz.de/pub/linux/slackware/slackware64-14.1/
ftp://sunsite.informatik.rwth-aachen.de/pub/comp/Linux/slackware/slackware64-14.1/
http://sunsite.informatik.rwth-aachen.de/ftp/pub/comp/Linux/slackware/slackware64-14.1/
ftp://wrz1013.rz.uni-wuerzburg.de/pub/MIRROR/slackware/slackware64-14.1/
http://wrz1013.rz.uni-wuerzburg.de/pub/MIRROR/slackware/slackware64-14.1/
`# GREECE (GR)`
ftp://ftp.cc.uoc.gr/mirrors/linux/slackware/slackware64-14.1/
http://ftp.cc.uoc.gr/mirrors/linux/slackware/slackware64-14.1/
ftp://ftp.otenet.gr/pub/linux/slackware/slackware64-14.1/
http://ftp.otenet.gr/linux/slackware/slackware64-14.1/
ftp://patroklos.noc.ntua.gr/pub/linux/slackware/slackware64-14.1/
http://patroklos.noc.ntua.gr/pub/linux/slackware/slackware64-14.1/
`# HUNGARY (HU)`
ftp://ftp.freepark.org/pub/linux/distributions/slackware/slackware64-14.1/
http://ftp.freepark.org/pub/linux/distributions/slackware/slackware64-14.1/
`# INDONESIA (ID)`
http://kambing.ui.ac.id/slackware/slackware64-14.1/
http://repo.ukdw.ac.id/slackware/slackware64-14.1/
`# IRELAND (IE)`
ftp://ftp.heanet.ie/mirrors/ftp.slackware.com/pub/slackware/slackware64-14.1/
http://ftp.heanet.ie/mirrors/ftp.slackware.com/pub/slackware/slackware64-14.1/
`# ITALY (IT)`
ftp://mirror2.mirror.garr.it/pub/1/slackware/slackware64-14.1/
http://mirror2.mirror.garr.it/pub/1/slackware/slackware64-14.1/
`# JAPAN (JP)`
ftp://ftp.nara.wide.ad.jp/pub/Linux/slackware/slackware64-14.1/
http://ftp.nara.wide.ad.jp/pub/Linux/slackware/slackware64-14.1/
ftp://ftp-srv2.kddilabs.jp/032/Linux/packages/Slackware/slackware64-14.1/
http://ftp-srv2.kddilabs.jp/032/Linux/packages/Slackware/slackware64-14.1/
ftp://riksun.riken.go.jp/Linux/slackware/slackware64-14.1/
http://riksun.riken.go.jp/Linux/slackware/slackware64-14.1/
`# LATVIA (LV)`
ftp://perkons.linux.edu.lv/mirrors/ftp.slackware.com/slackware64-14.1/
`# NETHERLANDS (NL)`
ftp://ftp.nluug.nl/vol/4/slackware/slackware64-14.1/
http://ftp.nluug.nl/os/Linux/distr/slackware/slackware64-14.1/
ftp://mirror.nl.leaseweb.net/slackware/slackware64-14.1/
http://mirror.nl.leaseweb.net/slackware/slackware64-14.1/
http://taper.alienbase.nl/mirrors/slackware/slackware64-14.1/
`# NORWAY (NO)`
ftp://ftp1.uninett.no/slackware/slackware64-14.1/
http://ftp1.uninett.no/slackware/slackware64-14.1/
`# POLAND (PL)`
ftp://ftp.man.szczecin.pl/pub/Linux/slackware/slackware64-14.1/
ftp://ftp.pwr.wroc.pl/pub/linux/slackware/slackware64-14.1/
http://ftp.pwr.wroc.pl/pub/linux/slackware/slackware64-14.1/
ftp://ftp.slackware.pl/pub/slackware/slackware64-14.1/
http://ftp.slackware.pl/pub/slackware/slackware64-14.1/
ftp://gepard.pbone.net/mirror/ftp.slackware.com/slackware64-14.1/
ftp://piotrkosoft.net/pub/mirrors/ftp.slackware.com/pub/slackware/slackware64-14.1/
http://piotrkosoft.net/pub/mirrors/ftp.slackware.com/pub/slackware/slackware64-14.1/
ftp://sunsite.icm.edu.pl/vol/rzm1/linux-slackware/slackware64-14.1/
http://sunsite.icm.edu.pl/packages/linux-slackware/slackware64-14.1/
ftp://z-ftp.wcss.wroc.pl/pub/linux/slackware/slackware64-14.1/
http://z-ftp.wcss.wroc.pl/pub/linux/slackware/slackware64-14.1/
`# PORTUGAL (PT)`
ftp://darkstar.ist.utl.pt/pub/slackware/slackware64-14.1/
http://darkstar.ist.utl.pt/pub/slackware/slackware64-14.1/
`# RUSSIA (RU)`
http://mirror.rol.ru/slackware/slackware64-14.1/
ftp://mirror.yandex.ru/slackware/slackware64-14.1/
http://mirror.yandex.ru/slackware/slackware64-14.1/
`# SERBIA (RS)`
ftp://mirror2.etf.bg.ac.rs/slackware/slackware64-14.1/
http://mirror2.etf.bg.ac.rs/slackware/slackware64-14.1/
`# SOUTH AFRICA (ZA)`
ftp://ftp.is.co.za/mirror/ftp.slackware.com/pub/slackware64-14.1/
http://ftp.is.co.za/mirror/ftp.slackware.com/pub/slackware64-14.1/
ftp://ftp.wa.co.za/pub/slackware/slackware64-14.1/
http://ftp.wa.co.za/pub/slackware/slackware64-14.1/
ftp://slackware.mirror.ac.za/slackware64-14.1/
http://slackware.mirror.ac.za/slackware64-14.1/
`# SWEDEN (SE)`
ftp://ftp.df.lth.se/pub/slackware/slackware64-14.1/
http://ftp.df.lth.se/pub/slackware/slackware64-14.1/
ftp://ftp.sunet.se/pub/os/Linux/distributions/slackware/slackware64-14.1/
http://ftp.sunet.se/pub/os/Linux/distributions/slackware/slackware64-14.1/
`# SWITZERLAND (CH)`
ftp://mirror.switch.ch/mirror/slackware/slackware64-14.1/
http://mirror.switch.ch/ftp/mirror/slackware/slackware64-14.1/
`# TAIWAN (TW)`
ftp://ftp.isu.edu.tw/pub/Linux/Slackware/slackware64-14.1/
http://ftp.isu.edu.tw/pub/Linux/Slackware/slackware64-14.1/
ftp://ftp.twaren.net/pub/Linux/Slackware/slackware64-14.1/
http://ftp.twaren.net/Linux/Slackware/slackware64-14.1/
`# TURKEY (TR)`
ftp://ftp.linux.org.tr/slackware/slackware64-14.1/
http://ftp.linux.org.tr/slackware/slackware64-14.1/
`# UKRAINE (UA)`
ftp://mirrors.mithril.org.ua/linux/slackware/slackware64-14.1/
http://mirrors.mithril.org.ua/linux/slackware/slackware64-14.1/
`# UNITED KINGDOM (UK)`
ftp://ftp.mirrorservice.org/sites/ftp.slackware.com/pub/slackware/slackware64-14.1/
http://ftp.mirrorservice.org/sites/ftp.slackware.com/pub/slackware/slackware64-14.1/
ftp://mirror.bytemark.co.uk/slackware/slackware64-14.1/
http://mirror.bytemark.co.uk/slackware/slackware64-14.1/
`# UNITED STATES (US)`
ftp://carroll.aset.psu.edu/pub/linux/distributions/slackware/slackware64-14.1/
http://carroll.aset.psu.edu/pub/linux/distributions/slackware/slackware64-14.1/
ftp://ftp.gtlib.gatech.edu/nv/ao2/lxmirror/ftp.slackware.com/slackware64-14.1/
ftp://ftp.osuosl.org/.2/slackware/slackware64-14.1/
http://ftp.osuosl.org/.2/slackware/slackware64-14.1/
ftp://hpc-mirror.usc.edu/pub/linux/distributions/slackware/slackware64-14.1/
http://hpc-mirror.usc.edu/pub/linux/distributions/slackware/slackware64-14.1/
ftp://marmot.tn.utexas.edu/pub/slackware/slackware64-14.1/
http://marmot.tn.utexas.edu/slackware/slackware64-14.1/
ftp://mirror.cs.princeton.edu/pub/mirrors/slackware/slackware64-14.1/
http://mirror.metrocast.net/slackware/slackware64-14.1/
ftp://mirrors.easynews.com/linux/slackware/slackware64-14.1/
http://mirrors.easynews.com/linux/slackware/slackware64-14.1/
http://mirrors.kingrst.com/slackware/slackware64-14.1/
ftp://mirrors.us.kernel.org/slackware/slackware64-14.1/
http://mirrors.us.kernel.org/slackware/slackware64-14.1/
ftp://mirrors.xmission.com/slackware/slackware64-14.1/
http://mirrors.xmission.com/slackware/slackware64-14.1/
http://slackbuilds.org/mirror/slackware/slackware64-14.1/
http://slackware.cs.utah.edu/pub/slackware/slackware64-14.1/
http://slackware.mirrorcatalogs.com/slackware64-14.1/
http://slackware.mirrors.pair.com/slackware64-14.1/
ftp://slackware.mirrors.tds.net/pub/slackware/slackware64-14.1/
http://slackware.mirrors.tds.net/pub/slackware/slackware64-14.1/
ftp://slackware.virginmedia.com/mirrors/ftp.slackware.com/slackware64-14.1/
http://slackware.virginmedia.com/slackware64-14.1/
ftp://spout.ussg.indiana.edu/linux/slackware/slackware64-14.1/
http://spout.ussg.indiana.edu/linux/slackware/slackware64-14.1/
ftp://teewurst.cc.columbia.edu/pub/linux/slackware/slackware64-14.1/
http://teewurst.cc.columbia.edu/pub/linux/slackware/slackware64-14.1/" 

# Use any adequetly sized file to test the speed. This is ~7MB. 
# The location should be based on the relative location within 
# the slackware64-current tree. I originally tried a smaller  
# file (FILELIST.TXT ~1MB), but I was seeing slower speed results 
# since it didn't have time to fully max my connection. Depending 
# on your internet speed, you may want to try different sized files. 
FILE="kernels/huge.s/bzImage" 

# Number of seconds before the test is considered a failure 
TIMEOUT="5" 

# String to store results in 
RESULTS="" 

# Set color variables to make results and echo statements cleaner 
RED="\e[31m" 
GREEN="\e[32m" 
NC="\e[0m"  #No color 

for MIRROR in $MIRRORS ; do 
     
    echo -n "Testing ${MIRROR} " 
     
    URL="${MIRROR}${FILE}" 

    SPEED=$(curl --max-time $TIMEOUT --silent --output /dev/null --write-out %{speed_download} $URL) 

    if (( $(echo "$SPEED < 10000.000" | bc -l) )) ; then 
        echo -e "${RED}Fail${NC}"; 
    else  
        SPEED="$(numfmt --to=iec-i --suffix=B --padding=7 $SPEED)ps" 
        echo -e "${GREEN}$SPEED${NC}" 
        RESULTS="${RESULTS}\t${SPEED}\t${MIRROR}\n"; 
    fi 

done; 

echo -e "\nResults:" 
echo -e $RESULTS | sort -hr  