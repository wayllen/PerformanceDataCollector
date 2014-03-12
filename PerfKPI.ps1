
# Get the build number from file.
$buildNumber = Get-Content "\\10.175.8.244\autoinstall\buildnum.txt"

# Define the performance data export file.
$vbcCpuFile = "C:\perfdata\vbc-cpu.txt"
$vbcCpuFileMax = "C:\perfdata\vbc-cpu-max.txt"
$vbcCpuFileMin = "C:\perfdata\vbc-cpu-min.txt"
$vbcMemFile = "C:\perfdata\vbc-mem.txt"
$vbcMemFileMax = "C:\perfdata\vbc-mem-max.txt"
$vbcMemFileMin = "C:\perfdata\vbc-mem-min.txt"

$concCpuFile = "C:\perfdata\conc-cpu.txt"
$concCpuFileMax = "C:\perfdata\conc-cpu-max.txt"
$concCpuFileMin = "C:\perfdata\conc-cpu-min.txt"
$concMemFile = "C:\perfdata\conc-mem.txt"
$concMemFileMax = "C:\perfdata\conc-mem-max.txt"
$concMemFileMin = "C:\perfdata\conc-mem-min.txt"

$transCpuFile = "C:\perfdata\trans-cpu.txt"
$transCpuFileMax = "C:\perfdata\trans-cpu-max.txt"
$transCpuFileMin = "C:\perfdata\trans-cpu-min.txt"
$transMemFile = "C:\perfdata\trans-mem.txt"
$transMemFileMax = "C:\perfdata\trans-mem-max.txt"
$transMemFileMin = "C:\perfdata\trans-mem-min.txt"

# Collect Component CPU and Memory info

# VBC CPU Average
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(vbc)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Average).average)| Out-File C:\perfdata\vbc-cpu.txt }
# VBC CPU Max 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(vbc)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Maximum).Maximum)| Out-File C:\perfdata\vbc-cpu-max.txt }
# VBC CPU Min
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(vbc)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Minimum).Minimum)| Out-File C:\perfdata\vbc-cpu-min.txt } 

# VBC Memory Average 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(vbc)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Average).average /1mb) | Out-File C:\perfdata\vbc-mem.txt}
# VBC Memory Max
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(vbc)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Maximum).Maximum /1mb) | Out-File C:\perfdata\vbc-mem-max.txt}
# VBC Memory Min 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(vbc)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Minimum).Minimum /1mb) | Out-File C:\perfdata\vbc-mem-min.txt}
 
# Conc CPU Average
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(conc)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Average).average) | Out-File C:\perfdata\conc-cpu.txt} 
# Conc CPU Max
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(conc)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Maximum).Maximum) | Out-File C:\perfdata\conc-cpu-max.txt} 
# Conc CPU Min
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(conc)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Minimum).Minimum) | Out-File C:\perfdata\conc-cpu-min.txt} 

# Conc Memory Average
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(conc)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Average).average /1mb) | Out-File C:\perfdata\conc-mem.txt}
# Conc Memory Max
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(conc)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Maximum).Maximum /1mb) | Out-File C:\perfdata\conc-mem-max.txt}
# Conc Memory Min
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(conc)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Minimum).Minimum /1mb) | Out-File C:\perfdata\conc-mem-min.txt} 

# Trans CPU Average 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(abstran)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Average).average) | Out-File C:\perfdata\trans-cpu.txt}
# Trans CPU Max 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(abstran)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Maximum).Maximum) | Out-File C:\perfdata\trans-cpu-max.txt}
# Trans CPU Min 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(abstran)\% Processor Time" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Minimum).Minimum) | Out-File C:\perfdata\trans-cpu-min.txt}

# Trans Memory Average 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(abstran)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Average).average /1mb) | Out-File C:\perfdata\trans-mem.txt}
# Trans Memory Max 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(abstran)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Maximum).Maximum /1mb) | Out-File C:\perfdata\trans-mem-max.txt} 
# Trans Memory Min 
 Start-Job -ScriptBlock { "{0:N2}" -f ((get-counter  -Counter "\Process(abstran)\Working Set" -SampleInterval 1 -MaxSamples 1800 |
 select -ExpandProperty countersamples | select -ExpandProperty cookedvalue | Measure-Object -Minimum).Minimum /1mb) | Out-File C:\perfdata\trans-mem-min.txt} 


# Wait for job finish.
 sleep -s 2000
 
 Get-Job | % { Receive-Job $_.Id; Remove-Job $_.Id -ErrorAction SilentlyContinue }


# Get value from every single file.
$vbcCpu = Get-Content $vbcCpuFile
$vbcCpuMax = Get-Content $vbcCpuFileMax
$vbcCpuMin = Get-Content $vbcCpuFileMin
$vbcMem = Get-Content $vbcMemFile
$vbcMemMax = Get-Content $vbcMemFileMax
$vbcMemMin = Get-Content $vbcMemFileMin

$concCpu = Get-Content $concCpuFile
$concCpuMax = Get-Content $concCpuFileMax
$concCpuMin = Get-Content $concCpuFileMin
$concMem = Get-Content $concMemFile
$concMemMax = Get-Content $concMemFileMax
$concMemMin = Get-Content $concMemFileMin

$transCpu = Get-Content $transCpuFile
$transCpuMax = Get-Content $transCpuFileMax
$transCpuMin = Get-Content $transCpuFileMin
$transMem = Get-Content $transMemFile
$transMemMax = Get-Content $transMemFileMax
$transMemMin = Get-Content $transMemFileMin


# Generate XML fle for output.
$xml = "<PERFKPI>"

# VBC CPU usage
    $xml += "<Component>"
        $xml += "<ProductName>" + "VBC" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Average Usage %" + "</KPIName>"
            $xml += "<Value>" + $vbcCpu + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "VBC" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Max Usage %" + "</KPIName>"
            $xml += "<Value>" + $vbcCpuMax + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>" 
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "VBC" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Min Usage %" + "</KPIName>"
            $xml += "<Value>" + $vbcCpuMin + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"      

# VBC Memory usage
    $xml += "<Component>"
        $xml += "<ProductName>" + "VBC" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Average Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $vbcMem + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"

    $xml += "<Component>"
        $xml += "<ProductName>" + "VBC" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Max Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $vbcMemMax + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "VBC" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Min Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $vbcMemMin + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"  

# Conc CPU usage    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Conc" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Average Usage %" + "</KPIName>"
            $xml += "<Value>" + $concCpu + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Conc" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Max Usage %" + "</KPIName>"
            $xml += "<Value>" + $concCpuMax + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>" 
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Conc" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Min Usage %" + "</KPIName>"
            $xml += "<Value>" + $concCpuMin + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"          

# Conc Memory usage
    $xml += "<Component>"
        $xml += "<ProductName>" + "Conc" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Average Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $concMem + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"   
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Conc" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Max Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $concMemMax + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"   
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Conc" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Min Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $concMemMin + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"            

# Trans CPU usage    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Trans" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Average Usage %" + "</KPIName>"
            $xml += "<Value>" + $transCpu + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Trans" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Max Usage %" + "</KPIName>"
            $xml += "<Value>" + $transCpuMax + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"    
  
    $xml += "<Component>"
        $xml += "<ProductName>" + "Trans" + "</ProductName>"
            $xml += "<KPIName>" + "CPU Min Usage %" + "</KPIName>"
            $xml += "<Value>" + $transCpuMin + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"       

# Trans Memory usage
    $xml += "<Component>"
        $xml += "<ProductName>" + "Trans" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Average Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $transMem  + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"  
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Trans" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Max Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $transMemMax  + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"    
    
    $xml += "<Component>"
        $xml += "<ProductName>" + "Trans" + "</ProductName>"
            $xml += "<KPIName>" + "Memory Min Usage(MB)" + "</KPIName>"
            $xml += "<Value>" + $transMemMin  + "</Value>"
            $xml += "<Build>" + $buildNumber + "</Build>"

    $xml += "</Component>"        


$xml += "</PERFKPI>"

$xml | Out-File -FilePath "C:\perfdata\AbsPerfData-$buildNumber.xml"



# Define send-mail function.
function Send-SMTPmail($to, $from, $subject, $smtpserver, $body, $attach) {
	$mailer = new-object Net.Mail.SMTPclient($smtpserver)
	$msg = new-object Net.Mail.MailMessage($from,$to,$subject,$body)
    if ($attach) {
    $att = new-object Net.Mail.Attachment($attach)
    }
    if ($att) {
    $msg.Attachments.Add($att)
    }
	$msg.IsBodyHTML = $true
	$mailer.send($msg)
    if ($att) {
    $att.Dispose()
    }
}

$EmailTo = "me@163.com"
$EmailFrom = "Adv-PERF-Monitor@163.com"
$SMTPSRV = "Server IP"
$body = "Performance Data for Build $buildNumber"
$attach = "C:\perfdata\AbsPerfData-$buildNumber.xml"

# Send email.
send-SMTPmail $EmailTo $EmailFrom "Advantage-PerformanceData-$buildNumber" $SMTPSRV $body $attach
