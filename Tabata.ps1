#Original policy is Restricted
Set-ExecutionPolicy -ExecutionPolicy Bypass
$Iterations = 18

$Count = 0

$Tracking = new-object system.collections.generic.list[pscustomobject]

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
While ($Count -le 17){

    $Check = $False

    $speak.Speak("Round number $Count. Time to do 10 pushups and 10 air squats.")

    Sleep 1500

    $Check = Read-Host -Prompt "Did you complete the round?"
    
        $Tracking.add([pscustomobject]@{
            Round = $Count
            Completed = $Check
            DateTime = Get-Date
        })

    $Count ++
    Sleep 300

}


Set-ExecutionPolicy -ExecutionPolicy Restricted