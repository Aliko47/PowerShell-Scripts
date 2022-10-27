new-NetFirewallRule  `
   -Name          "MSSQL15-Queries"  `
   -DisplayName   "SQL Server 2019 - SAGEERP General Usage"  `
   -Group         "SQL Databases"  `
   -Direction     INBOUND  `
   -Description   "Microsoft SQL Server 2019 - instance SAGEERP - standard queries and DDL statements"  `
   -Protocol      "TCP"  `
   -LocalPort     10433  `
   -Program       "C:\Program Files\Microsoft SQL Server\MSSQL15.SAGEERP\MSSQL\Binn\sqlservr.exe"  `
   -Service       "MSSQL`$SAGEERP"

new-NetFirewallRule  `
   -Name          "MSSQL15-Queries-SAGEHR"  `
   -DisplayName   "SQL Server 2019 - SAGEHR General Usage"  `
   -Group         "SQL Databases"  `
   -Direction     INBOUND  `
   -Description   "Microsoft SQL Server 2019 - instance SAGEHR - standard queries and DDL statements"  `
   -Protocol      "TCP"  `
   -LocalPort     10434  `
   -Program       "C:\Program Files\Microsoft SQL Server\MSSQL15.SAGEHR\MSSQL\Binn\sqlservr.exe"  `
   -Service       "MSSQL`$SAGEHR"
 
new-NetFirewallRule  `
   -Name          "MSSQL15-Browser"  `
   -DisplayName   "SQL Server 2019 - Instance Browser"  `
   -Group         "SQL Databases"  `
   -Direction     INBOUND  `
   -Description   "Microsoft SQL Server 2019 - finding and advertising local instances"  `
   -Protocol      "UDP"  `
   -LocalPort     1434  `
   -Program       "C:\Program Files (x86)\Microsoft SQL Server\90\Shared\SQLBrowser.exe"  `
   -Service       "SQLBrowser"