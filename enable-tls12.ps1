param
(
	[switch]$global = $false
)

if( $global )
{
	if( Test-path $profile )
	{
		if( -not ( Get-Content $profile | Select-String "enable-tls12" ) )
		{
			Add-Content $profile "`nenable-tls12"
		}
	}
	else
	{
		New-item $profile | Out-Null
		Add-Content $profile "`nenable-tls12"
	}
}
else
{
	[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
}
