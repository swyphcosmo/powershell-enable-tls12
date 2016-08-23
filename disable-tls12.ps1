param
(
	[switch]$global = $false
)

if( $global )
{
	if( Test-path $profile )
	{
		if( Get-Content $profile | Select-String "enable-tls12" )
		{
			Get-Content $profile | Select-String "enable-tls12" -notmatch | Out-File $profile
		}
	}
}
else
{
	[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -band ( -bnot [Net.SecurityProtocolType]::Tls12 )
}



