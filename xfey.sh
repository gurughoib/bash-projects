#!/bin/bash

if [ $(id -u) != "0" ]; then

      echo [ok][Check Kelengkapan!] ;
      sleep 2
      echo [ok][Check User]: $USER ;
      sleep 1
      echo [x][bukan root?]: pakailah rootnya bang! cemananya kau!;
      echo ""
   	  sleep 1
	  exit


else

   echo [!]::[Check Kelengkapan]: ;
   sleep 1
   echo [✔]::[Check User]: $USER ;

fi

  ping -c 1 google.com > /dev/null 2>&1
  if [ "$?" != 0 ]

then

    echo [✔]::[Internet Connection]: DONE!;
    echo [x]::[Peringatan]: Kau harus koneksi internet bang biar bisa main tools ini!;
    sleep 2

else

    echo [✔]::[Internet Connection]: connected!;
    sleep 2
fi
#check bettercap
	which bettercap > /dev/null 2>&1
	if [ "$?" -eq "0" ]; 
		then
		echo [ok]::"Bettercapnya udah terinstall gan!";
	else
		echo [x]::"Bettercapnya belum keinstall gan? bentar yah ku installkan!...";
		echo ""
		echo [!]::"Sabar gan, lagi proses!...."
		apt-get install bettercap
		echo ""
		sleep 2
		exit
	fi

#check netdiscovernya
	which netdiscover > /dev/null 2>&1
	if [ "$?" -eq "0" ];
		then
		echo [ok]::"Netdiscovernya udah terinstall kok gan!";
	else
		echo [x]::"Netdiscovernya belum keinstall gan? yaudah kubantu lagi installkan!..";
		echo ""
		echo [!]::"Sabar gan, masih proses!...."
		apt-get install netdiscover
		echo ""
		sleep 2
		exit
	fi
	
# check nmap if exists
      which nmap > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo [ok]::"Nmapnya udah terinstall gan!";
      echo "Allhamdulillah Kelengkapannya Lengkap ^_^";
else

   echo [x]::[warning]:this script require Nmap ;
   echo ""
   echo [!]::[please wait]: please install .... ;
   apt-get update
   apt-get install nmap
   echo ""
   sleep 2
   exit
fi
	echo "
	┌────────────────────────────────────────┐
	│                                        │
	│           ▄▄▄▄▄▄▄▄                     │
	│           ██▀▀▀▀▀▀                     │
	│ ▀██  ██▀  ██         ▄████▄   ▀██  ███ │
	│   ████    ███████   ██▄▄▄▄██   ██▄ ██  │
	│   ▄██▄    ██        ██▀▀▀▀▀▀    ████▀  │
	│  ▄█▀▀█▄   ██        ▀██▄▄▄▄█     ███   │
	│ ▀▀▀  ▀▀▀  ▀▀          ▀▀▀▀▀      ██    │
	│  v.0.1                         ███     │
	│       --Network  Pentest  Tools--      │
	=       --Author by: AngleDarknet--	 =
	└────────────────────────────────────────┘"
echo ""
echo -e "         |========================================"
echo "         |Thanks to: ALLAH. SWT"
echo "         |My Mom and Dad"
echo "         |=[-Ghoib Network-]="
echo "         |Eki, Fathur & Faris Hibatulloh"
echo -e "	 |========================================"
echo ""
echo ""
#pilihan

	echo "  [1] Netdiscover";

	echo "  [2] Sniffing";

	echo "  [3] Scan OS Version";

	echo "  [4] Scan Vulnerability";
	echo ""
	read -p "      Pilih Tools: " pil;

#kerja
	if [ $pil -eq 1 ];
	then
	echo -n "Gateway: "; read gateway
	echo -n "interface: "; read interface
	echo ""
	echo "Sabar bang...."
	netdiscover -r $gateway -i $interface
	elif [ $pil -eq 2 ];
	then
	echo "  [1]Single Sniff?"; 
	echo "  [2]Mass Sniff?";
	echo ""
	read -p "  [*]Silahkan Pilih: " pils;
	if [ $pils -eq 1 ];
	then
	echo -n "  IP Target: "; read IPtar
	echo -n "  interface: "; read interfaces
	echo ""
	echo "  Tunggu bentar bang...."
	bettercap -T $IPtar -X -I $interfaces
	elif [ $pils -eq 2 ];
	then
	echo -n "interface: "; read interface
	echo "Tunggu bentar bang...."
	bettercap -X -I $interface
fi
	elif [ $pil -eq 3 ];
	then
	echo -n "Masukan IP: "; read IP
	echo "Lagi proses bang..."
	nmap -sS -A -O $IP
	elif [ $pil -eq 4 ];
	then
	echo -n "Masukan IP: "; read ip2
	echo "Lagi proses juga bang...."
	nmap --script=vuln $ip2
fi