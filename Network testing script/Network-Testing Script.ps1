cls
write-host -BackgroundColor Blue "##########################"
write-host "User creation script"     
write-host "`n"
write-host "Made by:"
write-host "`n"
Write-Host "Lev Leiderman for more info
            `n Please contact me at levl@LeiderTech.co.il
            `n and dont forget to visit my blog at: 
            `n WWW.LeiderTech.co.il"
write-host "`n"
write-host -BackgroundColor Blue "##########################"


write-host -BackgroundColor Gray "What this thing do?"
write-host "`n"
write-host "This script will 'Ping' each computer for 2 times 
            `n and write the result in a colorable answer"

write-host "`n"

write-host "Have fun"

write-host "`n"

                                   

#ask user for the computer names or ip's

$mypcs = (Read-Host -Prompt "Please write the computer names of the pc's you want to check, with comma seporated (you can combine IP's and pc's to: 192.168.2.1,pc-01 etc..)").split(',') |
             ForEach-Object {$_.trim()}



#start the foreach loop

         foreach ($pc in $mypcs) {

#The "if" quastion:
          if (Test-Connection -computername $pc -Count 2 -Quiet) {

          Write-Progress -BackgroundColor green -ForegroundColor Blue "`nThe connection to ->$pc<- is OK :) !!!" 
 
 #The "Then" condition

            }else { write-host -BackgroundColor Red -ForegroundColor DarkYellow "`nThe Connection to ->$pc<- is not good :( !! "

            }Write-Progress

                                    }
        

          write-host "`n"
          
          pause