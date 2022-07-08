# PowerShell-Graph
this repository contains stuff that is all about developing with the Microsoft Graph and PowerShell.
Most of the development is done with the native API, not with the PowerShell Graph SDK.
All scripts are intended to be tiny problem solvers in my projects where I am mainly as a consultant.

## Assign-Licenses
### assign-licenses.ps1
This script assigns Offiec 365 licenses via PowerShell SDK. It reads all members of the group **users-o365** and assigns Exchange Online Plan1.

## AzureAD Apps
This folder contains scripts that help in working with AzureAD Apps (App Registrations & Enterprise Apps)
### Get-GraphPermissionsOverview.ps1
Every AAD App needs permissions. The MS Graph is of course not storing clear-text permissions like *Mail.ReadWrite.All*, it is storing GUIDs that represent the permission. But - which permission is which GUID? This question raises when permissions must be set programatically and not via GUI.
