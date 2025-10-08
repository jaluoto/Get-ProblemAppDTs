# Get-ProblemAppDTs

Script to troubleshoot ConfigMgr Applications with missing Deployment Types on client side.

Idea for this originated from the oneliner in https://github.com/engrit-illinois/Get-CMAppDepTypeData documentation.

This is intended to be run as a 'Run Script' with ConfigMgr on a large collection of Windows devices.

The script enumerates all applications in the device's WMI database and then lists those problematic ones that don't have a Deployment Type.

It is assumed that all assigned applications should have at least one Deployment Type that is valid.

Return value contains a number of identified problem applications (in sortable format) and then a list of the names of those applications.