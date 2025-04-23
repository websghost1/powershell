cls
write-host -BackgroundColor Blue "##########################"
write-host "Mac Adress Retriving Script"     
write-host "Made by:"
write-host "`n"
Write-Host "Lev Leiderman for more info
            `n Please contact me at levl@LeiderTech.co.il
            `n and dont forget to visit my blog at: 
            `n WWW.LeiderTech.co.il"
write-host "`n"
write-host -BackgroundColor Gray "What this thing do?"
write-host "`n"
write-host "This script will quary each computer for MAC Adress  
            `n and will show the result in a table with the following info: Computer name, Description and Mac Adress"

write-host "`n"

write-host "Have fun"

write-host "`n"

try {

$cred =$Host.ui.PromptForCredential("Domain Network credential are needed", "Please enter your Domain User Name and password 
            `n (example: domain\username)", "", "NetBiosUserName")


$mypcs =(Read-Host -Prompt "Please insert the computer names of the computers you want to retrieve the MAC Address, with comma separated
`n (you can combine IP's and pc's to: 192.168.2.1,pc-01 etc..)").split(',') | ForEach-Object {$_.trim()}



foreach ($pc in $mypcs) {


        Get-WmiObject -class Win32_NetworkAdapterConfiguration -ComputerName $pc -ErrorAction Stop |
        Where-Object IpEnabled -EQ "True" |
        Select-Object PSComputerName, description,MACAddress |
        Format-Table -AutoSize 
                           }

    }

catch {
write-host "`n"
Write-Warning  "Sorry, I can't reach to $pc, please check connectivity"

      }
write-host "`n"
Pause