# Herstelt replicatie op 21:00
$Date = [DateTime]::Today.AddDays(0).AddHours(21)
get-vm | Resume-VMReplication -Resynchronize -Verbose -ResynchronizeStartTime $Date
