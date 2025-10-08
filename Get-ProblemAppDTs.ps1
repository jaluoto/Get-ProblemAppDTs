# List all applications that do not have any AppDTs associated with them
# jaakko.luoto@tuni.fi

$wmi_apps = Get-WmiObject -Namespace "root\ccm\clientsdk" -ClassName "CCM_Application" | Select-Object -ExpandProperty "__PATH"
$problem_apps = @()
ForEach ($wmi_app in $wmi_apps) {
    $app = [wmi]$wmi_app
    $app_dts = $app | Select-Object -ExpandProperty AppDTs
    
    If (-not $app_dts) {
        $problem_apps += $app
    }
}

# Return a list of strings: 
# - Problem apps' count, with leading zeroes to make it sortable. Maximum of 999 apps is assumed.
# - Sorted list of problematic apps' names
# - If none were found, return nothing
If ($problem_apps) {
    "$($problem_apps.Count.ToString("D3"))"
    $problem_apps.Name | Sort-Object
}
