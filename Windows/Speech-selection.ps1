#requires -Version 2.0
Add-Type -AssemblyName System.Speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$ssml = '
<speak version="1.0" xmlns="http://www.w3.org/2001/10/synthesis" 
    xml:lang="en-US">
    <voice xml:lang="en-US">
    <prosody rate="1">
        <p>Holy shit</p>
    </prosody>
    </voice>
    <voice xml:lang="en-US">
    <prosody rate="0">
        <p>...you make me so tired.</p>
    </prosody>
    </voice>
</speak>
'

$speak.SpeakSsml($ssml)