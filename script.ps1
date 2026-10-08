#Requires -RunAsAdministrator
# Add-Type -AssemblyName System.Windows.Forms
# Add-Type -AssemblyName System.Drawing
Write-Output "Intitializing..."

#### NEEDED FILES ####
# We encode files in base 64 so we can easily copy and paste them into the script, so we don't need to download them.
# These files (unless otherwise specified) are base64 UTF-8.
# They are stored for your refrence in our dev folder.

# goodsecpol.cgf
$goodsecpol = "W1VuaWNvZGVdDQpVbmljb2RlPXllcw0KW1N5c3RlbSBBY2Nlc3NdDQpNaW5pbXVtUGFzc3dvcmRBZ2UgPSAwDQpNYXhpbXVtUGFzc3dvcmRBZ2UgPSA2MA0KTWluaW11bVBhc3N3b3JkTGVuZ3RoID0gOA0KUGFzc3dvcmRDb21wbGV4aXR5ID0gMQ0KUGFzc3dvcmRIaXN0b3J5U2l6ZSA9IDI0DQpMb2Nrb3V0QmFkQ291bnQgPSAxMA0KUmVzZXRMb2Nrb3V0Q291bnQgPSAzMA0KTG9ja291dER1cmF0aW9uID0gMzANClJlcXVpcmVMb2dvblRvQ2hhbmdlUGFzc3dvcmQgPSAwDQpGb3JjZUxvZ29mZldoZW5Ib3VyRXhwaXJlID0gMA0KTmV3QWRtaW5pc3RyYXRvck5hbWUgPSAiQWRtaW5pc3RyYXRvciINCk5ld0d1ZXN0TmFtZSA9ICJHdWVzdCINCkNsZWFyVGV4dFBhc3N3b3JkID0gMA0KTFNBQW5vbnltb3VzTmFtZUxvb2t1cCA9IDANCkVuYWJsZUFkbWluQWNjb3VudCA9IDANCkVuYWJsZUd1ZXN0QWNjb3VudCA9IDANCltFdmVudCBBdWRpdF0NCkF1ZGl0U3lzdGVtRXZlbnRzID0gMA0KQXVkaXRMb2dvbkV2ZW50cyA9IDANCkF1ZGl0T2JqZWN0QWNjZXNzID0gMA0KQXVkaXRQcml2aWxlZ2VVc2UgPSAwDQpBdWRpdFBvbGljeUNoYW5nZSA9IDANCkF1ZGl0QWNjb3VudE1hbmFnZSA9IDANCkF1ZGl0UHJvY2Vzc1RyYWNraW5nID0gMA0KQXVkaXREU0FjY2VzcyA9IDANCkF1ZGl0QWNjb3VudExvZ29uID0gMA0KW1JlZ2lzdHJ5IFZhbHVlc10NCk1BQ0hJTkVcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cU2V0dXBcUmVjb3ZlcnlDb25zb2xlXFNlY3VyaXR5TGV2ZWw9NCwwDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzIE5UXEN1cnJlbnRWZXJzaW9uXFNldHVwXFJlY292ZXJ5Q29uc29sZVxTZXRDb21tYW5kPTQsMA0KTUFDSElORVxTb2Z0d2FyZVxNaWNyb3NvZnRcV2luZG93cyBOVFxDdXJyZW50VmVyc2lvblxXaW5sb2dvblxDYWNoZWRMb2dvbnNDb3VudD0xLCIxMCINCk1BQ0hJTkVcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cV2lubG9nb25cRm9yY2VVbmxvY2tMb2dvbj00LDANCk1BQ0hJTkVcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cV2lubG9nb25cUGFzc3dvcmRFeHBpcnlXYXJuaW5nPTQsNQ0KTUFDSElORVxTb2Z0d2FyZVxNaWNyb3NvZnRcV2luZG93cyBOVFxDdXJyZW50VmVyc2lvblxXaW5sb2dvblxTY1JlbW92ZU9wdGlvbj0xLCIwIg0KTUFDSElORVxTb2Z0d2FyZVxNaWNyb3NvZnRcV2luZG93c1xDdXJyZW50VmVyc2lvblxQb2xpY2llc1xTeXN0ZW1cQ29uc2VudFByb21wdEJlaGF2aW9yQWRtaW49NCwyDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzXEN1cnJlbnRWZXJzaW9uXFBvbGljaWVzXFN5c3RlbVxDb25zZW50UHJvbXB0QmVoYXZpb3JVc2VyPTQsMA0KTUFDSElORVxTb2Z0d2FyZVxNaWNyb3NvZnRcV2luZG93c1xDdXJyZW50VmVyc2lvblxQb2xpY2llc1xTeXN0ZW1cRG9udERpc3BsYXlMYXN0VXNlck5hbWU9NCwwDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzXEN1cnJlbnRWZXJzaW9uXFBvbGljaWVzXFN5c3RlbVxFbmFibGVJbnN0YWxsZXJEZXRlY3Rpb249NCwxDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzXEN1cnJlbnRWZXJzaW9uXFBvbGljaWVzXFN5c3RlbVxFbmFibGVMVUE9NCwxDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzXEN1cnJlbnRWZXJzaW9uXFBvbGljaWVzXFN5c3RlbVxFbmFibGVTZWN1cmVVSUFQYXRocz00LDENCk1BQ0hJTkVcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVtXEVuYWJsZVVJQURlc2t0b3BUb2dnbGU9NCwwDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzXEN1cnJlbnRWZXJzaW9uXFBvbGljaWVzXFN5c3RlbVxFbmFibGVWaXJ0dWFsaXphdGlvbj00LDENCk1BQ0hJTkVcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVtXExlZ2FsTm90aWNlQ2FwdGlvbj0xLCIiDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzXEN1cnJlbnRWZXJzaW9uXFBvbGljaWVzXFN5c3RlbVxMZWdhbE5vdGljZVRleHQ9NywNCk1BQ0hJTkVcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVtXFByb21wdE9uU2VjdXJlRGVza3RvcD00LDANCk1BQ0hJTkVcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVtXFNjRm9yY2VPcHRpb249NCwwDQpNQUNISU5FXFNvZnR3YXJlXE1pY3Jvc29mdFxXaW5kb3dzXEN1cnJlbnRWZXJzaW9uXFNob3Rkb3duV2l0aG91dExvZ29uPTQsMQ0KTUFDSElORVxTb2Z0d2FyZVxNaWNyb3NvZnRcV2luZG93c1xDdXJyZW50VmVyc2lvblxQb2xpY2llc1xTeXN0ZW1cVW5kb2NrV2l0aG91dExvZ29uPTQsMQ0KTUFDSElORVxTb2Z0d2FyZVxNaWNyb3NvZnRcV2luZG93c1xDdXJyZW50VmVyc2lvblxQb2xpY2llc1xTeXN0ZW1cVmFsaWRhdGVBZG1pbkNvZGVTaWduYXR1cmVzPTQsMA0KTUFDSElORVxTb2Z0d2FyZVxQb2xpY2llc1xNaWNyb3NvZnRcV2luZG93c1xTYWZlclxDb2RlSWRlbnRpZmllcnNcQXV0aGVudGljb2RlRW5hYmxlZD00LDANCk1BQ0hJTkVcU3lzdGVtXEN1cnJlbnRDb250cm9sU2V0XENvbnRyb2xcTHNhXEF1ZGl0QmFzZU9iamVjdHM9NCwwDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxDb250cm9sXExzYVxDcmFzaE9uQXVkaXRGYWlsPTQsMA0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcQ29udHJvbFxMc2FcRGlzYWJsZURvbWFpbkNyZWRzPTQsMA0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcQ29udHJvbFxMc2FcRXZlcnlvbmVJbmNsdWRlc0Fub255bW91cz00LDANCk1BQ0hJTkVcU3lzdGVtXEN1cnJlbnRDb250cm9sU2V0XENvbnRyb2xcTHNhXEZJUFNBYWdvcml0aG1Qb2xpY3lFRW5hYmxlZD00LDANCk1BQ0hJTkVcU3lzdGVtXEN1cnJlbnRDb250cm9sU2V0XENvbnRyb2xcTHNhXEZvcmNlR3Vlc3Q9NCwwDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxDb250cm9sXExzYVxGdWxsUHJpdmlsZWdlQXVkaXRpbmc9MywwDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxDb250cm9sXExzYVxMaW1pdEJsYW5rUGFzc3dvcmRVc2U9NCwxDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxDb250cm9sXExzYVxNU1YxXzBcTlRMTU1pbkNsaWVudFNlYz00LDUzNjg3MDkxMg0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcQ29udHJvbFxMc2FcTVNWMV8wXE5UTE1NaW5TZXJ2ZXJTZWM9NCw1MzY4NzA5MTINCk1BQ0hJTkVcU3lzdGVtXEN1cnJlbnRDb250cm9sU2V0XENvbnRyb2xcTHNhXE5vTE1IYXNoPTQsMQ0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcQ29udHJvbFxMc2FcUmVzdHJpY3RBbm9ueW1vdXM9NCwwDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxDb250cm9sXExzYVxSZXN0cmljdEFub255bW91c1NBTT00LDENClN5c21vblxQcm92aWRlcnNcTGFuTWFuIFByaW50IFNlcnZpY2VzXFNlcnZlcnNcQWRkUHJpbnRlckRyaXZlcnM9NCwwDQpTeXN0ZW1cUHJvdmlkZXJzXExhbk1hblNlcnZlclxQYXJhbWV0ZXJzXEF1dG9EaXNjb25uZWN0PTQsMTUNCk1BQ0hJTkVcU3lzdGVtXEN1cnJlbnRDb250cm9sU2V0XFNlcnZpY2VzXExhbk1hblNlcnZlclxQYXJhbWV0ZXJzXEVuYWJsZUZvcmNlZExvZ09mZj00LDENClN5c3RlbVxQcm92aWRlcnNcTGFuTWFuIFNlcnZlclxQYXJhbWV0ZXJzXEVuYWJsZVNlY3VyaXR5U2lnbmF0dXJlPTQsMA0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcU2VydmljZXNcTGFuTWFuU2VydmVyXFBhcmFtZXRlcnNcTnVsbFNlc3Npb25QaXBlcz03DQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxTZXJ2aWNlc1xMYW5tYW5TZXJ2ZXJcUGFyYW1ldGVyc1xSZXF1aXJlU2VjdXJpdHlTaWduYXR1cmU9NCwwDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxTZXJ2aWNlc1xMYW5tYW5Xb3Jrc3RhdGlvblxQYXJhbWV0ZXJzXEVuYWJsZVBsYWluVGV4dFBhc3N3b3JkPTQsMA0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcU2VydmljZXNcTGFubWFuV29ya3N0YXRpb25cUGFyYW1ldGVyc1xFbmFibGVTZWN1cml0eVNpZ25hdHVyZT00LDENClN5c3RlbVxQcm92aWRlcnNcTGFuTWFuIFNlcnZlclxQYXJhbWV0ZXJzXEVuYWJsZVNlY3VyaXR5U2lnbmF0dXJlPTQsMA0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcU2VydmljZXNcTERBUFxMREFQQ2xpZW50SW50ZWdyaXR5PTQsMQ0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcU2VydmljZXNcTmV0bG9nb25cUGFyYW1ldGVyc1xEaXNhYmxlUGFzc3dvcmRDaGFuZ2U9NCwwDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxTZXJ2aWNlc1xOZXRsb2dvblxQYXJhbWV0ZXJzXE1heGltdW1QYXNzd29yZEFnZT00LDMwDQpNQUNISU5FXFN5c3RlbVxDdXJyZW50Q29udHJvbFNldFxTZXJ2aWNlc1xOZXRsb2dvblxQYXJhbWV0ZXJzXFJlcXVpcmVTaWduT3JTZWFsPTQsMQ0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcU2VydmljZXNcTmV0bG9nb25cUGFyYW1ldGVyc1xSZXF1aXJlU3Ryb25nS2V5PTQsMQ0KTUFDSElORVxTeXN0ZW1cQ3VycmVudENvbnRyb2xTZXRcU2VydmljZXNcTmV0bG9nb25cUGFyYW1ldGVyc1xTZWFsU2VjdXJlQ2hhbm5lbD00LDENCk1BQ0hJTkVcU3lzdGVtXEN1cnJlbnRDb250cm9sU2V0XFNlcnZpY2VzXE5ldGxvZ29uXFBhcmFtZXRlcnNcU2lnblNlY3VyZUNoYW5uZWw9NCwxDQpbUHJpdmlsZWdlIFJpZ2h0c10NClNlTmV0d29ya0xvZ29uUmlnaHQgPSAqUy0xLTEtMCwqUy0xLTUtMzItNTQ0LCpTLTEtNS0zMi01NDUsKlMtMS01LTMyLTU1MQ0KU2VCYWNrdXBQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ0LCpTLTEtNS0zMi01NTENClNlQ2hhbmdlTm90aWZ5UHJpdmlsZWdlID0gKlMtMS0xLTAsKlMtMS01LTE5LCpTLTEtNS0yMCwqUy0xLTUtMzItNTQ0LCpTLTEtNS0zMi01NDUsKlMtMS01LTMyLTU1MQ0KU2VTeXN0ZW10aW1lUHJpdmlsZWdlID0gKlMtMS01LTE5LCpTLTEtNS0zMi01NDQNClNlQ3JlYXRlUGFnZWZpbGVQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ0DQpTZURlYnVnUHJpdmlsZWdlID0gKlMtMS01LTMyLTU0NA0KU2VSZW1vdGVTaHV0ZG93blByaXZpbGVnZSA9ICpTLTEtNS0zMi01NDQNClNlQXVkaXRQcml2aWxlZ2UgPSAqUy0xLTUtMTksKlMtMS01LTIwDQpTZUluY3JlYXNlUXVvdGFQcml2aWxlZ2UgPSAqUy0xLTUtMTksKlMtMS01LTIwLCpTLTEtNS0zMi01NDQNClNlSW5jcmVhc2VCYXNlUHJpb3JpdHlQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ0DQpTZUxvYWREcml2ZXJQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ0DQpTZUJhdGNoTG9nb25SaWdodCA9ICpTLTEtNS0zMi01NDQsKlMtMS01LTMyLTU1MSwqUy0xLTUtMzItNTU5LCpTLTEtNS0zMi01NjgNClNlU2VydmljZUxvZ29uUmlnaHQgPSAqUy0xLTUtODAtMA0KU2VJbnRlcmFjdGl2ZUxvZ29uUmlnaHQgPSBHdWVzdCwqUy0xLTUtMzItNTQ0LCpTLTEtNS0zMi01NDUsKlMtMS01LTMyLTU1MQ0KU2VTZWN1cml0eVByaXZpbGVnZSA9ICpTLTEtNS0zMi01NDQNClNlU3lzdGVtRW52aXJvbm1lbnRQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ0DQpTZVByb2ZpbGVTaW5nbGVQcm9jZXNzUHJpdmlsZWdlID0gKlMtMS01LTMyLTU0NA0KU2VTeXN0ZW1Qcm9maWxlUHJpdmlsZWdlID0gKlMtMS01LTMyLTU0NCwqUy0xLTUtODAtMzEzOTE1Nzg3MC0yOTgzMzkxMDQ1LTM2Nzg3NDc0NjYtNjU4NzI1NzEyLTE4MDkzNDA0MjANClNlQXNzaWduUHJpbWFyeVRva2VuUHJpdmlsZWdlID0gKlMtMS01LTE5LCpTLTEtNS0yMA0KU2VSZXN0b3JlUHJpdmlsZWdlID0gKlMtMS01LTMyLTU0NCwqUy0xLTUtMzItNTUxDQpTZVNodXRkb3duUHJpdmlsZWdlID0gKlMtMS01LTMyLTU0NCwqUy0xLTUtMzItNTQ1LCpTLTEtNS0zMi01NTENClNlVGFrZU93bmVyc2hpcFByaXZpbGVnZSA9ICpTLTEtNS0zMi01NDQNClNlRGVueU5ldHdvcmtMb2dvblJpZ2h0ID0gR3Vlc3QNClNlRGVueUludGVyYWN0aXZlTG9nb25SaWdodCA9IEd1ZXN0DQpTZVVuZG9ja1ByaXZpbGVnZSA9ICpTLTEtNS0zMi01NDQsKlMtMS01LTMyLTU0NQ0KU2VNYW5hZ2VWb2x1bWVQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ0DQpTZVJlbW90ZUludGVyYWN0aXZlTG9nb25SaWdodCA9ICpTLTEtNS0zMi01NDQsKlMtMS01LTMyLTU1NQ0KU2VJbXBlcnNvbmF0ZVByaXZpbGVnZSA9ICpTLTEtNS0xOSwqUy0xLTUtMjAsKlMtMS01LTMyLTU0NCwqUy0xLTUtMzItNTY4LCpTLTEtNS02DQpTZUNyZWF0ZUdsb2JhbFByaXZpbGVnZSA9ICpTLTEtNS0xOSwqUy0xLTUtMjAsKlMtMS01LTMyLTU0NCwqUy0xLTUtNg0KU2VJbmNyZWFzZVdvcmtpbmdTZXRQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ1DQpTZVRpbWVab25lUHJpdmlsZWdlID0gKlMtMS01LTE5LCpTLTEtNS0zMi01NDQsKlMtMS01LTMyLTU0NQ0KU2VDcmVhdGVTeW1ib2xpY0xpbmtQcml2aWxlZ2UgPSAqUy0xLTUtMzItNTQ0DQpTZURlbGVnYXRlU2Vzc2lvblVzZXJJbXBlcnNvbmF0ZVByaXZpbGVnZSA9ICpTLTEtNS0zMi01NDQNCltWZXJzaW9uXQ0Kc2lnbmF0dXJlPSIkQ0hJQ0FHTyQiDQpSZXZpc2lvbj0xDQo="

if (!
    #current role
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    #is admin?
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    #elevate script and exit current non-elevated runtime
    Start-Process `
        -FilePath 'powershell' `
        -ArgumentList (
            #flatten to single array
            '-File', $MyInvocation.MyCommand.Source, $args `
            | %{ $_ }
        ) `
        -Verb RunAs
    exit
}
$ProgressPreference = 'SilentlyContinue'
Clear-Host

# Thanks to https://stackoverflow.com/a/55776100
Function Parse-SecPol($CfgFile){ 
    secedit /export /cfg "$CfgFile" | out-null
    $obj = New-Object psobject
    $index = 0
    $contents = Get-Content $CfgFile -raw
    [regex]::Matches($contents,"(?<=\[)(.*)(?=\])") | %{
        $title = $_
        [regex]::Matches($contents,"(?<=\]).*?((?=\[)|(\Z))", [System.Text.RegularExpressions.RegexOptions]::Singleline)[$index] | %{
            $section = new-object psobject
            $_.value -split "\r\n" | ?{$_.length -gt 0} | %{
                $value = [regex]::Match($_,"(?<=\=).*").value
                $name = [regex]::Match($_,".*(?=\=)").value
                $section | add-member -MemberType NoteProperty -Name $name.tostring().trim() -Value $value.tostring().trim() -ErrorAction SilentlyContinue | out-null
            }
            $obj | Add-Member -MemberType NoteProperty -Name $title -Value $section
        }
        $index += 1
    }
    return $obj
}

Function Set-SecPol($Object, $CfgFile){
   $SecPool.psobject.Properties.GetEnumerator() | %{
        "[$($_.Name)]"
        $_.Value | %{
            $_.psobject.Properties.GetEnumerator() | %{
                "$($_.Name)=$($_.Value)"
            }
        }
    } | out-file $CfgFile -ErrorAction Stop
    secedit /configure /db c:\windows\security\local.sdb /cfg "$CfgFile" /areas SECURITYPOLICY
}



function Update-Application() {
    param (
        [string]$AppName,
        [string]$ProcessName,
        [string]$DownloadUrl,
        [string]$InstallArgs
    )
    Write-Output "Updating $AppName..."
    $appProcess = Get-Process | Where-Object { $_.ProcessName -eq $ProcessName }
    if ($appProcess) {
        Write-Output "$AppName is running, closing..."
        $appProcess | Stop-Process -Force
    }
    Write-Output "Downloading $AppName..."
    Invoke-WebRequest -O ("$env:temp/$ProcessName"+"Setup.exe") $DownloadUrl
    Write-Output "Installing $AppName..."
    Start-Process -Wait -FilePath ("$env:temp/$ProcessName"+"Setup.exe") -ArgumentList $InstallArgs
    Write-Output "$AppName updated!"
}

function Update-Applications() {
    Write-Output "Updating applications..."
    if ((Test-Path -Path "C:\Program Files\Mozilla Firefox") -or (Test-Path -Path "C:\Program Files (x86)\Mozilla Firefox")) {
        Update-Application -AppName "Firefox" -ProcessName "firefox" -DownloadUrl "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" -InstallArgs "/S"
    } else {
        "Firefox not installed, ignoring..."
    }
    if ((Test-Path -Path "C:\Program Files\Mozilla Thunderbird") -or (Test-Path -Path "C:\Program Files (x86)\Mozilla Thunderbird")) {
        Update-Application -AppName "Thunderbird" -ProcessName "thunderbird" -DownloadUrl "https://download.mozilla.org/?product=thunderbird-latest&os=win64&lang=en-US" -InstallArgs "/S"
    } else {
        "Thunderbird not installed, ignoring..."
    }
    if ((Test-Path -Path "C:\Program Files\Google\Chrome\") -or (Test-Path -Path "C:\Program Files (x86)\Google\Chrome\")) {
        Update-Application -AppName "Google Chrome" -ProcessName "chrome" -DownloadUrl "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -InstallArgs "/S"
    } else {
        "Google Chrome not installed, ignoring..."
    }
    if ((Test-Path -Path "C:\Program Files\Notepad++") -or (Test-Path -Path "C:\Program Files (x86)\Notepad++")) {
        # Get the latest Notepad++ download URL
        $notepadURL = (Invoke-WebRequest "https://notepad-plus-plus.org/update/getDownloadUrl.php?version=8&param=x64").Content | Select-Xml -XPath "/GUP/Location" | Select-Object -ExpandProperty Node | Select-Object -ExpandProperty InnerText
        Update-Application -AppName "Notepad++" -ProcessName "notepad++" -DownloadUrl $notepadURL -InstallArgs "/S"
    } else {
        "Notepad++ not installed, ignoring..."
    }
    if ((Test-Path -Path "C:\Program Files\GIMP 2") -or (Test-Path -Path "C:\Program Files (x86)\GIMP 2") -or (Test-Path -Path "$env:localappdata\Programs\GIMP 2")) {
        # Get the latest GIMP download URL
        $gimpURL = (Invoke-WebRequest "https://www.gimp.org/downloads/" -UseBasicParsing).Links | Where-Object { $_.href -like "*windows*" -and $_.href -like "*exe" } | Select-Object -First 1 -ExpandProperty href
        Update-Application -AppName "GIMP" -ProcessName "gimp" -DownloadUrl $gimpURL -InstallArgs "/S"
    } else {
        "GIMP not installed, ignoring..."
    }
    Write-Output "Applications updated!"
}

function Update-Windows() {
    $choice = Read-Host "Would you like to check for and install Windows updates? (Y/N)"
    if ($choice -notmatch '^(?i)y(?:es)?$') {
        Write-Output "Windows Update skipped."
        return
    }

    Write-Output "Checking for Windows updates..."
    Set-Service -Name wuauserv -StartupType Automatic
    Start-Service -Name wuauserv

    try {
        $session = New-Object -ComObject Microsoft.Update.Session
        $session.ClientApplicationID = "CyberPatriot Windows Update"
        $searcher = $session.CreateUpdateSearcher()
        $searchResult = $searcher.Search("IsInstalled=0 and IsHidden=0 and Type='Software'")

        if ($searchResult.Updates.Count -eq 0) {
            Write-Output "Windows is up to date."
            return
        }

        $updates = New-Object -ComObject Microsoft.Update.UpdateColl
        foreach ($update in $searchResult.Updates) {
            Write-Output "Found: $($update.Title)"
            if (-not $update.EulaAccepted) {
                $update.AcceptEula()
            }
            [void]$updates.Add($update)
        }

        Write-Output "Downloading $($updates.Count) Windows update(s)..."
        $downloader = $session.CreateUpdateDownloader()
        $downloader.Updates = $updates
        [void]$downloader.Download()

        $installableUpdates = New-Object -ComObject Microsoft.Update.UpdateColl
        foreach ($update in $updates) {
            if ($update.IsDownloaded) {
                [void]$installableUpdates.Add($update)
            }
        }

        if ($installableUpdates.Count -eq 0) {
            Write-Output "No Windows updates were downloaded successfully."
            return
        }

        Write-Output "Installing $($installableUpdates.Count) Windows update(s)..."
        $installer = $session.CreateUpdateInstaller()
        $installer.Updates = $installableUpdates
        $installResult = $installer.Install()

        if ($installResult.RebootRequired) {
            Write-Output "Windows updates installed. A restart is required."
        } else {
            Write-Output "Windows updates installed."
        }
    } catch {
        Write-Output "Windows Update failed: $($_.Exception.Message)"
    }
}

function Disable-SimpleTcpServices() {
    $service = Get-Service -Name "simptcp" -ErrorAction SilentlyContinue
    if (-not $service) {
        Write-Output "Simple TCP/IP Services is not installed."
        return
    }

    $choice = Read-Host "Disable Simple TCP/IP Services? (Y/N)"
    if ($choice -notmatch '^(?i)y(?:es)?$') {
        Write-Output "Simple TCP/IP Services skipped."
        return
    }

    Write-Output "Disabling Simple TCP/IP Services..."
    if ($service.Status -eq "Running") {
        Stop-Service -Name "simptcp" -Force
    }
    Set-Service -Name "simptcp" -StartupType Disabled
    Write-Output "Simple TCP/IP Services stopped and disabled."
}

function Disable-UsersShare() {
    $share = Get-SmbShare -Name "USERS$" -ErrorAction SilentlyContinue
    if (-not $share) {
        Write-Output "The hidden USERS$ share does not exist."
        return
    }

    $choice = Read-Host "Stop sharing USERS$? (Y/N)"
    if ($choice -notmatch '^(?i)y(?:es)?$') {
        Write-Output "USERS$ share skipped."
        return
    }

    Write-Output "Stopping the USERS$ share..."
    Remove-SmbShare -Name "USERS$" -Force
    Write-Output "The hidden USERS$ share was removed."
}

function Security-Config() {
    # Enable the firewall
    Write-Output "Enabling the firewall..."
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    Enable-NetFirewallRule
    # Enable Windows Defender
    Write-Output "Enabling Windows Defender..."
    Set-MpPreference -DisableRealtimeMonitoring $false
    Set-MpPreference -DisableIOAVProtection $false
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "Real-Time Protection" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableBehaviorMonitoring" -Value 0 -PropertyType DWORD -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableOnAccessProtection" -Value 0 -PropertyType DWORD -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableScanOnRealtimeEnable" -Value 0 -PropertyType DWORD -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 0 -PropertyType DWORD -Force
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name "EnableSmartScreen" -Value 1
    start-service WinDefend
    start-service WdNisSvc
    # Disable auto-login
    Write-Output "Disabling auto-login..."
    $RegKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
    ForEach ($subkey in "AutoAdminLogon", "DefaultPassword")
    {
    if (Get-ItemProperty -Name $subkey -path $RegKey -ErrorAction SilentlyContinue)
    {
    Remove-ItemProperty -Path $RegKey -Name $subkey
    }
    }
    # Disable SMBv1
    Write-Output "Disabling SMBv1..."
    Set-SmbServerConfiguration -EnableSMB1Protocol $false  -Force
    Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
    # Disable guest account
    Write-Output "Disabling guest account..."
    net user guest /active:no
    # # Disable remote desktop NOTE: This could be a required service
    # Write-Output "Disabling remote desktop..."
    # Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 1
    # Disable remote assistance
    Write-Output "Disabling remote assistance..."
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Remote Assistance' -Name "fAllowToGetHelp" -Value 0

    # Disable autorun
    Write-Output "Disabling autorun..."
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Name "NoDriveTypeAutoRun" -Value 255
    # Enable Windows Update
    Write-Output "Enabling Windows Update..."
    Set-Service -Name wuauserv -StartupType Automatic
    Start-Service -Name wuauserv
    # Enable Automatic Updates
    Write-Output "Enabling Automatic Updates..."
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update' -Name "AUOptions" -Value 4

    # Configure local security policies
    Write-Output "Configuring local security policies..."
    secedit /export /cfg $env:temp\bkpsecpol.cgf | out-null # just in case
    [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($goodsecpol)) | Out-File -Encoding "Unicode" $env:temp\goodsecpol.cgf
    Start-Sleep -Milliseconds 1000 # Wait for the file to be written
    secedit /configure /db c:\windows\security\local.sdb /cfg $env:temp\goodsecpol.cgf /areas SECURITYPOLICY user_rights

    # This is commented out, as we have switched to importing a preprepared security policy. Don't have the guts to remove this tho.

    # # Configure account security policies
    # Write-Output "Configuring account security policies..."
    # $SecPool = Parse-SecPol -CfgFile $env:temp\pol.cgf
    # $SecPool.'System Access'.PasswordComplexity = 1
    # $SecPool.'System Access'.MinimumPasswordLength = 8
    # $SecPool.'System Access'.MinimumPasswordAge = 0
    # $SecPool.'System Access'.MaximumPasswordAge = 60
    # $SecPool.'System Access'.PasswordHistorySize = 24
    # $SecPool.'System Access'.LockoutBadCount = 10
    # $SecPool.'System Access'.ClearTextPassword = 0
    # Set-SecPol -Object $SecPool -CfgFile $env:temp\pol.cgf

    # # Enable enumeration of SAM accounts
    # Write-Output "Enabling enumeration of SAM accounts..."
    # Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name "RestrictAnonymous" -Value 0
    # # Limit local use of blank passwords to console only
    # Write-Output "Limiting local use of blank passwords to console only..."
    # Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name "LimitBlankPasswordUse" -Value 1

    # Enable auditing
    # Note: Theoretically, most of this should be done by the security policy import, but it it looks like it doesn't, so we do it again.
    Write-Output "Enabling auditing..."
    auditpol /set /subcategory:"Logon" /success:enable /failure:enable
    auditpol /set /subcategory:"Logoff" /success:enable /failure:enable
    auditpol /set /subcategory:"Account Lockout" /success:enable /failure:enable
    auditpol /set /subcategory:"IPsec Driver" /success:enable /failure:enable
    auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable
    auditpol /set /subcategory:"Special Logon" /success:enable /failure:enable
    auditpol /set /subcategory:"Credential Validation" /success:enable /failure:enable

    # Enable UAC
    Write-Output "Enabling UAC..."
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name "EnableLUA" -Value 1
    # I think this is UAC? I previously set it to Create account security policy, but google says it's UAC related.
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "LocalAccountTokenFilterPolicy" -Value 1 -PropertyType DWORD -Force

    # Configure account lockout policies
    Write-Output "Configuring account lockout policies..."
    net accounts /lockoutduration:30
    net accounts /lockoutwindow:30
    

    # RDP Security Layer set to SSL
    Write-Output "Setting RDP Security Layer to SSL..."
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "SecurityLayer" -Value 2
    # RDP Encryption Level set to High
    Write-Output "Setting RDP Encryption Level to High..."
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "UserAuthentication" -Value 1
    # Disable anonymous access to named pipes and shares
    Write-Output "Disabling anonymous access to named pipes and shares..."
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name "NullSessionPipes" -Value ""
    # Behavior of the elevation prompt for administrators in Admin Approval Mode configured to prompt
    Write-Output "Configuring behavior of the elevation prompt for administrators in Admin Approval Mode to prompt..."
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name "ConsentPromptBehaviorAdmin" -Value 2
    # Behavior of the elevation prompt for standard users configured to automatically deny elevation requests
    Write-Output "Configuring behavior of the elevation prompt for standard users to automatically deny elevation requests..."
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name "ConsentPromptBehaviorUser" -Value 0
    # Start the event log service
    Write-Output "Starting the event log service..."
    Set-Service "eventlog" -startuptype automatic
    Start-Service -Name "eventlog"
}
function Remove-Hacking-Tools {
    Write-Output "Removing hacking tools..."
    # Remove hacking tools
    # Remove Wireshark
    if ((Test-Path -Path "C:\Program Files\Wireshark") -or (Test-Path -Path "C:\Program Files (x86)\Wireshark")) {
        Write-Output "Removing Wireshark..."
        Remove-Item -Path "C:\Program Files\Wireshark" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\Wireshark" -Recurse -Force
    } else {
        Write-Output "Wireshark not installed, ignoring..."
    }
    # Remove Nmap
    if ((Test-Path -Path "C:\Program Files\Nmap") -or (Test-Path -Path "C:\Program Files (x86)\Nmap")) {
        Write-Output "Removing Nmap..."
        Remove-Item -Path "C:\Program Files\Nmap" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\Nmap" -Recurse -Force
    } else {
        Write-Output "Nmap not installed, ignoring..."
    }
    # Remove Npcap
    if ((Test-Path -Path "C:\Program Files\Npcap") -or (Test-Path -Path "C:\Program Files (x86)\Npcap")) {
        Write-Output "Removing Npcap..."
        Remove-Item -Path "C:\Program Files\Npcap" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\Npcap" -Recurse -Force
    } else {
        Write-Output "Npcap not installed, ignoring..."
    }
    # Remove Metasploit
    if ((Test-Path -Path "C:\Program Files\Metasploit") -or (Test-Path -Path "C:\Program Files (x86)\Metasploit")) {
        Write-Output "Removing Metasploit..."
        Remove-Item -Path "C:\Program Files\Metasploit" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\Metasploit" -Recurse -Force
    } else {
        Write-Output "Metasploit not installed, ignoring..."
    }
    # Remove Ophcrack
    if ((Test-Path -Path "C:\Program Files\Ophcrack") -or (Test-Path -Path "C:\Program Files (x86)\Ophcrack")) {
        Write-Output "Removing Ophcrack..."
        Remove-Item -Path "C:\Program Files\Ophcrack" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\Ophcrack" -Recurse -Force
    } else {
        Write-Output "Ophcrack not installed, ignoring..."
    }
        # Check to see if netcat is running
        $netcatProcess = Get-Process | Where-Object { $_.ProcessName -eq "nc" }
        if ($netcatProcess) {
            Write-Output "Netcat is running, we've been backdoored, closing..."
            $path = $netcatProcess.Path
            $netcatProcess | Stop-Process -Force
            Start-Sleep -Milliseconds 1000 # Wait for the process to close
            # Remove the netcat exectuable from where it is running from
            Remove-Item -Path $path -Force
        }
    # Remove netcat
    if ((Test-Path -Path "C:\Program Files\Netcat") -or (Test-Path -Path "C:\Program Files (x86)\Netcat")) {
        Write-Output "Removing Netcat..."
        Remove-Item -Path "C:\Program Files\Netcat" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\Netcat" -Recurse -Force
    } else {
        Write-Output "Netcat not installed, ignoring..."
    }
    # Remove John the Ripper
    if ((Test-Path -Path "C:\Program Files\John the Ripper") -or (Test-Path -Path "C:\Program Files (x86)\John the Ripper")) {
        Write-Output "Removing John the Ripper..."
        Remove-Item -Path "C:\Program Files\John the Ripper" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\John the Ripper" -Recurse -Force
    } else {
        Write-Output "John the Ripper not installed, ignoring..."
    }
    # Remove hashcat
    if ((Test-Path -Path "C:\Program Files\Hashcat") -or (Test-Path -Path "C:\Program Files (x86)\Hashcat")) {
        Write-Output "Removing Hashcat..."
        Remove-Item -Path "C:\Program Files\Hashcat" -Recurse -Force
        Remove-Item -Path "C:\Program Files (x86)\Hashcat" -Recurse -Force
    } else {
        Write-Output "Hashcat not installed, ignoring..."
    }

}

function Handle-Accounts() {
    # For accounts, we get a convient list of all accounts, and if they are an administrator.
    # It looks like:
    # Authorized Administrators:
    # ashepard (you)
    #     password: Cyb3rCont3st
    # ygagarin
    #     password: dawn
    # vkomarov
    #     password: v4l3nT!NA

    # Authorized Users:

    # timon
    # zazu
    # ed
    # banzai
    # scar
    
    # We need to get this list, and parse the list.
    # We need to:
    # 1. Check if there are any users that are not authorized on our system, and delete them.
    # 2. Check if there are any users that are authorized, but not on our system, and create them.
    # 3. Check if there are any users that are labeled as administrators, but are not on our system, and add them to the administrators group.
    # 4. Check if there are any users who are labeled as just users, but are in the administrators group, and remove them from the administrators group.
    # 5. Reset everyone's password (including ours) to S3cureP@ssw0rd!123
    # Parse the account list
    Read-Host "Please copy the authorized administrators & users, then press enter. Do not paste it"
    # $accountList = 
    $lines = Get-Clipboard
    $adminSection = $false
    $userSection = $false
    $hasSeenAdmins = $false
    $hasSeenUsers = $false
    $admins = @{}
    $users = @()
    # We need to ignore system users
    $systemUsers = @("Administrator", "DefaultAccount", "Guest", "WDAGUtilityAccount")


    foreach ($line in $lines) {
        if ($line -match "Authorized Administrators:") {
            $adminSection = $true
            $userSection = $false
            $hasSeenAdmins = $true
            continue
        }
        if ($line -match "Authorized Users:") {
            $adminSection = $false
            $userSection = $true
            $hasSeenUsers = $true
            continue
        }
        if ($adminSection -and $line -match "^\s*(\w+)\s*(\(you\))?\s*$") {
            $username = $matches[1]
            $password = $lines[$lines.IndexOf($line) + 1] -replace "^\s*password:\s*", ""
            $admins[$username] = $password
        }
        if ($userSection -and $line -match "^\s*(\w+)\s*$") {
            $users += $matches[1]
        }
    }

    if (-not $hasSeenAdmins -or -not $hasSeenUsers) {
        Write-Output "WARNING!! Invalid account list. Recopy the list and try again."
        Handle-Accounts
        return
    }

    # Get current system users
    $currentUsers = Get-LocalUser | Select-Object -ExpandProperty Name

    # 1. Delete unauthorized users
    foreach ($user in $currentUsers) {
        if (-not $admins.ContainsKey($user) -and -not $users.Contains($user) -and -not $systemUsers.Contains($user)) {
            Write-Output "Removing unauthorized user $user..."
            Remove-LocalUser -Name $user
        }
    }

    # 2. Create missing authorized users
    foreach ($admin in $admins.Keys) {
        if (-not $currentUsers.Contains($admin)) {
            Write-Output "Creating authorized admin $user..."
            New-LocalUser -Name $admin -Password (ConvertTo-SecureString "S3cureP@ssw0rd!123" -AsPlainText -Force)
        }
    }
    foreach ($user in $users) {
        if (-not $currentUsers.Contains($user)) {
            Write-Output "Creating authorized user $user..."
            New-LocalUser -Name $user -Password (ConvertTo-SecureString "S3cureP@ssw0rd!123" -AsPlainText -Force)
        }
    }

    # 3. Add missing administrators to the administrators group
    foreach ($admin in $admins.Keys) {
        if (((-not ((Get-LocalGroupMember -Group "Administrators" | Select-Object -ExpandProperty Name) -split "\\" -Contains $admin))) -and -not $systemUsers.Contains($admin)) {
            Write-Output "Adding administator $admin to the Administrator group..."
            Add-LocalGroupMember -Group "Administrators" -Member $admin
        }
    }

    # 4. Remove unauthorized administrators from the administrators group
    foreach ($user in $users) {
        if (((Get-LocalGroupMember -Group "Administrators" | Select-Object -ExpandProperty Name) -split "\\" -Contains $user) -and -not $systemUsers.Contains($user)) {
            Write-Output "Removing non-admin user $user from the Administrator group..."
            Remove-LocalGroupMember -Group "Administrators" -Member $user
        }
    }

    # 5. Reset everyone's password
    Write-Output "Resetting everyone's password..."

    # Get current system users
    $currentUsers = Get-LocalUser | Select-Object -ExpandProperty Name

    foreach ($user in $currentUsers) {
        if (-not $systemUsers.Contains($user)) {
            Write-Output "Resetting password for $user..."
            Set-LocalUser -Name $user -Password (ConvertTo-SecureString "S3cureP@ssw0rd!123" -AsPlainText -Force)
        }
    }
}

function Service-Disabler {
    # Disable services and applications
    Write-Output "Disabling services and applications..."
    
    $services = @(
        @{ Alias = "Remote Registry"; Name = "RemoteRegistry"; ToBeDisabled = $true },
        @{ Alias = "RDP"; Name = "TermService"; ToBeDisabled = $true },
        @{ Alias = "Telnet"; Name = "Telnet"; ToBeDisabled = $true },
        @{ Alias = "FTP"; Name = "FTP"; ToBeDisabled = $true },
        @{ Alias = "Web Server"; Name = "W3SVC"; ToBeDisabled = $true }
        @{ Alias = "IIS Admin"; Name = "IISAdmin"; ToBeDisabled = $true }
        @{ Alias = "IIS WAS"; Name = "WAS"; ToBeDisabled = $true }
        @{ Alias = "SSHD"; Name = "sshd"; ToBeDisabled = $true }
        @{ Alias = "SSH-Agent"; Name = "ssh-agent"; ToBeDisabled = $true }
        @{ Alias = "Telnet"; Name = "tlntsvr"; ToBeDisabled = $true }
        @{ Alias = "FTP (#2)"; Name = "ftpsvc"; ToBeDisabled = $true }
        @{ Alias = "MySQL"; Name = "mysql"; ToBeDisabled = $true }
        @{ Alias = "PostgreSQL"; Name = "postgresql"; ToBeDisabled = $true }
        @{ Alias = "MongoDB"; Name = "MongoDB"; ToBeDisabled = $true }
        @{ Alias = "Redis"; Name = "Redis"; ToBeDisabled = $true }
        @{ Alias = "Memcached"; Name = "Memcached"; ToBeDisabled = $true }
        @{ Alias = "Elasticsearch"; Name = "Elasticsearch"; ToBeDisabled = $true }
        @{ Alias = "RabbitMQ"; Name = "RabbitMQ"; ToBeDisabled = $true }
        @{ Alias = "Apache"; Name = "Apache2.4"; ToBeDisabled = $true }
        @{ Alias = "Nginx"; Name = "nginx"; ToBeDisabled = $true }
        @{ Alias = "Tomcat"; Name = "Tomcat"; ToBeDisabled = $true }
        @{ Alias = "Jenkins"; Name = "Jenkins"; ToBeDisabled = $true }
    )
    
    $applications = @(
        # Remote Access Tools
        @{ Alias = "TeamViewer"; ProcessName = "TeamViewer"; Directories = @("C:\Program Files\TeamViewer", "C:\Program Files (x86)\TeamViewer"); ToBeDisabled = $true }
        @{ Alias = "AnyDesk"; ProcessName = "AnyDesk"; Directories = @("C:\Program Files\AnyDesk", "C:\Program Files (x86)\AnyDesk"); ToBeDisabled = $true }
        @{ Alias = "VNC"; ProcessName = "vncserver"; Directories = @("C:\Program Files\RealVNC\VNC Server", "C:\Program Files\RealVNC\VNC Viewer"); ToBeDisabled = $true }
        @{ Alias = "LogMeIn"; ProcessName = "LogMeIn"; Directories = @("C:\Program Files\LogMeIn", "C:\Program Files (x86)\LogMeIn", "C:\Program Files\LogMeIn Central"); ToBeDisabled = $true }
        @{ Alias = "OpenVPN"; ProcessName = "openvpn"; Directories = @("C:\Program Files\OpenVPN", "C:\Program Files (x86)\OpenVPN"); ToBeDisabled = $true }
        @{ Alias = "SoftEther VPN"; ProcessName = "vpnserver"; Directories = @("C:\Program Files\SoftEther VPN Server", "C:\Program Files\SoftEther VPN Client", "C:\Program Files (x86)\SoftEther VPN Server", "C:\Program Files (x86)\SoftEther VPN Client"); ToBeDisabled = $true }
        @{ Alias = "WireGuard"; ProcessName = "wireguard"; Directories = @("C:\Program Files\WireGuard", "C:\Program Files (x86)\WireGuard"); ToBeDisabled = $true }

        # Servers
        @{ Alias = "TFTP Server"; ProcessName = "tftpd64"; Directories = @("C:\Program Files (x86)\Tftpd64"); ToBeDisabled = $true }
        @{ Alias = "OpenTFTPServer"; ProcessName = "OpenTFTPServerMT"; Directories = @("C:\Program Files\OpenTFTPServer", "C:\Program Files (x86)\OpenTFTPServer"); ToBeDisabled = $true }
        @{ Alias = "FileZilla Server"; ProcessName = "filezilla-server"; Directories = @("C:\Program Files\FileZilla Server"); ToBeDisabled = $true }
        @{ Alias = "Apache"; ProcessName = "httpd"; Directories = @("C:\Apache24", "C:\Program Files\Apache Software Foundation\Apache2.4"); ToBeDisabled = $true }
        @{ Alias = "MySQL"; ProcessName = "mysqld"; Directories = @("C:\Program Files\MySQL\MySQL Server 8.0", "C:\Program Files\MySQL\MySQL Server 5.7"); ToBeDisabled = $true }
        @{ Alias = "PostgreSQL"; ProcessName = "postgres"; Directories = @("C:\Program Files\PostgreSQL\13", "C:\Program Files\PostgreSQL\14"); ToBeDisabled = $true }
        @{ Alias = "VSCode"; ProcessName = "Code"; Directories = @("C:\Program Files\Microsoft VS Code"); ToBeDisabled = $true }
        @{ Alias = "NodeJS"; ProcessName = "node"; Directories = @("C:\Program Files\nodejs"); ToBeDisabled = $true }
        @{ Alias = "XAMPP"; ProcessName = "xampp-control"; Directories = @("C:\xampp"); ToBeDisabled = $true }
        @{ Alias = "Docker"; ProcessName = "Docker Desktop"; Directories = @("C:\Program Files\Docker\Docker"); ToBeDisabled = $true }

        # Torrent Clients
        @{ Alias = "qBittorrent"; ProcessName = "qbittorrent"; Directories = @("C:\Program Files\qBittorrent", "C:\Program Files (x86)\qBittorrent", "$env:APPDATA\qBittorrent"); ToBeDisabled = $true }
        @{ Alias = "uTorrent"; ProcessName = "utorrent"; Directories = @("C:\Program Files\uTorrent", "C:\Program Files (x86)\uTorrent", "$env:APPDATA\uTorrent"); ToBeDisabled = $true }
        @{ Alias = "BitTorrent"; ProcessName = "bittorrent"; Directories = @("C:\Program Files\BitTorrent", "C:\Program Files (x86)\BitTorrent", "$env:APPDATA\BitTorrent"); ToBeDisabled = $true }
        @{ Alias = "Vuze"; ProcessName = "azureus"; Directories = @("C:\Program Files\Vuze", "C:\Program Files (x86)\Vuze", "$env:APPDATA\Vuze"); ToBeDisabled = $true }
        @{ Alias = "Deluge"; ProcessName = "deluge"; Directories = @("C:\Program Files\Deluge", "C:\Program Files (x86)\Deluge", "$env:APPDATA\Deluge"); ToBeDisabled = $true }
        @{ Alias = "Transmission"; ProcessName = "transmission-qt"; Directories = @("C:\Program Files\Transmission", "C:\Program Files (x86)\Transmission", "$env:APPDATA\Transmission"); ToBeDisabled = $true }        

        # Media (because why would you want to enjoy your job?)
        @{ Alias = "Kodi"; ProcessName = "kodi"; Directories = @("C:\Program Files\Kodi", "C:\Program Files (x86)\Kodi", "$env:APPDATA\Kodi"); ToBeDisabled = $true }
        @{ Alias = "Plex"; ProcessName = "Plex Media Server"; Directories = @("C:\Program Files (x86)\Plex\Plex Media Server", "$env:LOCALAPPDATA\Plex Media Server"); ToBeDisabled = $true }
        @{ Alias = "Emby"; ProcessName = "EmbyServer"; Directories = @("C:\Program Files\Emby Server", "$env:APPDATA\Emby-Server"); ToBeDisabled = $true }
        @{ Alias = "Jellyfin"; ProcessName = "jellyfin"; Directories = @("C:\Program Files\Jellyfin", "$env:PROGRAMDATA\Jellyfin"); ToBeDisabled = $true }
        @{ Alias = "VLC"; ProcessName = "vlc"; Directories = @("C:\Program Files\VideoLAN\VLC", "C:\Program Files (x86)\VideoLAN\VLC"); ToBeDisabled = $true }
        @{ Alias = "K-Lite Codec Pack"; ProcessName = "klcp_update"; Directories = @("C:\Program Files\K-Lite Codec Pack", "C:\Program Files (x86)\K-Lite Codec Pack"); ToBeDisabled = $true }
        @{ Alias = "iTunes"; ProcessName = "iTunes"; Directories = @("C:\Program Files\iTunes", "C:\Program Files (x86)\iTunes"); ToBeDisabled = $true }
        @{ Alias = "Spotify"; ProcessName = "Spotify"; Directories = @("$env:APPDATA\Spotify"); ToBeDisabled = $true }        
        
        # System Care Junk
        @{ Alias = "Advanced SystemCare"; ProcessName = "ASCTray"; Directories = @("C:\Program Files (x86)\IObit\Advanced SystemCare", "C:\Program Files\IObit\Advanced SystemCare"); ToBeDisabled = $true }
        @{ Alias = "CCleaner"; ProcessName = "CCleaner64"; Directories = @("C:\Program Files\CCleaner", "C:\Program Files (x86)\CCleaner"); ToBeDisabled = $true }
        @{ Alias = "Glary Utilities"; ProcessName = "Integrator"; Directories = @("C:\Program Files\Glary Utilities 5", "C:\Program Files (x86)\Glary Utilities 5"); ToBeDisabled = $true }
        @{ Alias = "Wise Care 365"; ProcessName = "WiseCare365"; Directories = @("C:\Program Files\Wise\Wise Care 365", "C:\Program Files (x86)\Wise\Wise Care 365"); ToBeDisabled = $true }
        @{ Alias = "Ashampoo WinOptimizer"; ProcessName = "WOTray"; Directories = @("C:\Program Files\Ashampoo\Ashampoo WinOptimizer", "C:\Program Files (x86)\Ashampoo\Ashampoo WinOptimizer"); ToBeDisabled = $true }
        @{ Alias = "System Mechanic"; ProcessName = "SystemMechanic"; Directories = @("C:\Program Files (x86)\iolo\System Mechanic", "C:\Program Files\iolo\System Mechanic"); ToBeDisabled = $true }
        @{ Alias = "TuneUp Utilities"; ProcessName = "TuneUpUtilitiesApp64"; Directories = @("C:\Program Files (x86)\AVG\AVG PC TuneUp", "C:\Program Files\AVG\AVG PC TuneUp"); ToBeDisabled = $true }
        @{ Alias = "SlimCleaner"; ProcessName = "SlimCleanerPlus"; Directories = @("C:\Program Files\SlimCleaner Plus", "C:\Program Files (x86)\SlimCleaner Plus"); ToBeDisabled = $true }
        @{ Alias = "PC Optimizer Pro"; ProcessName = "PCOptimizerPro"; Directories = @("C:\Program Files\PC Optimizer Pro", "C:\Program Files (x86)\PC Optimizer Pro"); ToBeDisabled = $true }
        @{ Alias = "WebCompanion"; ProcessName = "WebCompanion"; Directories = @("C:\Program Files (x86)\Lavasoft\Web Companion", "C:\Program Files\Lavasoft\Web Companion"); ToBeDisabled = $true }       
        @{ Alias = "Helpsoft PC Cleaner"; ProcessName = "PCCleaner"; Directories = @("C:\Program Files\Helpsoft PC Cleaner", "C:\Program Files (x86)\Helpsoft PC Cleaner"); ToBeDisabled = $true } 

        # Antivirus (I assume most of them are using Windows Defender, but hey, that's why you can disable it.)
        # Also I doubt it's that bad to just let me willy nilly delete it's program files, so I'll probably just disable it.
        @{ Alias = "Malwarebytes"; ProcessName = "mbamtray"; Directories = @("C:\Program Files\Malwarebytes\Anti-Malware", "C:\Program Files (x86)\Malwarebytes\Anti-Malware"); ToBeDisabled = $true }
        @{ Alias = "Spybot"; ProcessName = "SDTray"; Directories = @("C:\Program Files\Spybot - Search & Destroy 2", "C:\Program Files (x86)\Spybot - Search & Destroy 2"); ToBeDisabled = $true }
        @{ Alias = "AdwCleaner"; ProcessName = "AdwCleaner"; Directories = @("C:\AdwCleaner"); ToBeDisabled = $true }
        @{ Alias = "Avast"; ProcessName = "AvastUI"; Directories = @("C:\Program Files\AVAST Software\Avast", "C:\Program Files (x86)\AVAST Software\Avast"); ToBeDisabled = $true }
        @{ Alias = "AVG"; ProcessName = "avgui"; Directories = @("C:\Program Files\AVG\Antivirus", "C:\Program Files (x86)\AVG\Antivirus"); ToBeDisabled = $true }
        @{ Alias = "Avira"; ProcessName = "avira"; Directories = @("C:\Program Files (x86)\Avira\Launcher", "C:\Program Files\Avira\Launcher"); ToBeDisabled = $true }
        @{ Alias = "Bitdefender"; ProcessName = "bdagent"; Directories = @("C:\Program Files\Bitdefender Antivirus Free", "C:\Program Files (x86)\Bitdefender Antivirus Free"); ToBeDisabled = $true }
        @{ Alias = "Kaspersky"; ProcessName = "avp"; Directories = @("C:\Program Files\Kaspersky Lab\Kaspersky Security Cloud", "C:\Program Files (x86)\Kaspersky Lab\Kaspersky Security Cloud"); ToBeDisabled = $true }
        @{ Alias = "McAfee"; ProcessName = "McUICnt"; Directories = @("C:\Program Files\McAfee", "C:\Program Files (x86)\McAfee"); ToBeDisabled = $true }
        @{ Alias = "Norton"; ProcessName = "NortonSecurity"; Directories = @("C:\Program Files\Norton Security", "C:\Program Files (x86)\Norton Security"); ToBeDisabled = $true }
        @{ Alias = "Panda"; ProcessName = "PSUAService"; Directories = @("C:\Program Files\Panda Security", "C:\Program Files (x86)\Panda Security"); ToBeDisabled = $true }
        @{ Alias = "Trend Micro"; ProcessName = "UfNaviService"; Directories = @("C:\Program Files\Trend Micro\Titanium", "C:\Program Files (x86)\Trend Micro\Titanium"); ToBeDisabled = $true }
        @{ Alias = "Webroot"; ProcessName = "WRSA"; Directories = @("C:\Program Files\Webroot\Security", "C:\Program Files (x86)\Webroot\Security"); ToBeDisabled = $true }
        @{ Alias = "ZoneAlarm"; ProcessName = "zatray"; Directories = @("C:\Program Files\CheckPoint\ZoneAlarm", "C:\Program Files (x86)\CheckPoint\ZoneAlarm"); ToBeDisabled = $true }
        
        

        # Cloud Storage (getting into the maybe don't put in here territory)
        @{ Alias = "Dropbox"; ProcessName = "Dropbox"; Directories = @("C:\Program Files\Dropbox", "C:\Program Files (x86)\Dropbox"); ToBeDisabled = $true }
        @{ Alias = "Google Drive"; ProcessName = "googledrivesync"; Directories = @("C:\Program Files\Google", "C:\Program Files (x86)\Google"); ToBeDisabled = $true }
        @{ Alias = "iDrive"; ProcessName = "iDriveService"; Directories = @("C:\Program Files\iDrive", "C:\Program Files (x86)\iDrive"); ToBeDisabled = $true }
        @{ Alias = "OneDrive"; ProcessName = "OneDrive"; Directories = @("C:\Program Files\Microsoft OneDrive", "C:\Program Files (x86)\Microsoft OneDrive"); ToBeDisabled = $true }
        @{ Alias = "pCloud"; ProcessName = "pCloud"; Directories = @("C:\Program Files\pCloud", "C:\Program Files (x86)\pCloud"); ToBeDisabled = $true }
        @{ Alias = "SpiderOak"; ProcessName = "SpiderOakONE"; Directories = @("C:\Program Files\SpiderOakONE", "C:\Program Files (x86)\SpiderOakONE"); ToBeDisabled = $true }
        @{ Alias = "Sync.com"; ProcessName = "SyncApp"; Directories = @("C:\Program Files\Sync.com", "C:\Program Files (x86)\Sync.com"); ToBeDisabled = $true }
        @{ Alias = "Tresorit"; ProcessName = "Tresorit"; Directories = @("C:\Program Files\Tresorit", "C:\Program Files (x86)\Tresorit"); ToBeDisabled = $true }
        @{ Alias = "VeraCrypt"; ProcessName = "VeraCrypt"; Directories = @("C:\Program Files\VeraCrypt", "C:\Program Files (x86)\VeraCrypt"); ToBeDisabled = $true }
        @{ Alias = "WinRAR"; ProcessName = "WinRAR"; Directories = @("C:\Program Files\WinRAR", "C:\Program Files (x86)\WinRAR"); ToBeDisabled = $true }
        @{ Alias = "7-Zip"; ProcessName = "7z"; Directories = @("C:\Program Files\7-Zip", "C:\Program Files (x86)\7-Zip"); ToBeDisabled = $true }
        @{ Alias = "Acronis"; ProcessName = "TrueImageMonitor"; Directories = @("C:\Program Files\Acronis\TrueImageHome", "C:\Program Files (x86)\Acronis\TrueImageHome"); ToBeDisabled = $true }
        @{ Alias = "Backblaze"; ProcessName = "bzserv"; Directories = @("C:\Program Files (x86)\Backblaze", "C:\Program Files\Backblaze"); ToBeDisabled = $true }
        @{ Alias = "Carbonite"; ProcessName = "CarboniteUI"; Directories = @("C:\Program Files\Carbonite\Carbonite", "C:\Program Files (x86)\Carbonite\Carbonite"); ToBeDisabled = $true }
        @{ Alias = "CrashPlan"; ProcessName = "CrashPlanService"; Directories = @("C:\Program Files\CrashPlan", "C:\Program Files (x86)\CrashPlan"); ToBeDisabled = $true }
  
        # Media Creation Tools. I might remove these from this list later.
        @{ Alias = "Audacity"; ProcessName = "audacity"; Directories = @("C:\Program Files\Audacity", "C:\Program Files (x86)\Audacity"); ToBeDisabled = $true }
        @{ Alias = "GIMP"; ProcessName = "gimp-2.10"; Directories = @("C:\Program Files\GIMP 2", "C:\Program Files (x86)\GIMP 2"); ToBeDisabled = $true }
        @{ Alias = "Inkscape"; ProcessName = "inkscape"; Directories = @("C:\Program Files\Inkscape", "C:\Program Files (x86)\Inkscape"); ToBeDisabled = $true }
        @{ Alias = "Blender"; ProcessName = "blender"; Directories = @("C:\Program Files\Blender Foundation\Blender", "C:\Program Files (x86)\Blender Foundation\Blender"); ToBeDisabled = $true }
        @{ Alias = "LibreOffice"; ProcessName = "soffice"; Directories = @("C:\Program Files\LibreOffice", "C:\Program Files (x86)\LibreOffice"); ToBeDisabled = $true }
        @{ Alias = "OpenOffice"; ProcessName = "soffice"; Directories = @("C:\Program Files (x86)\OpenOffice 4"); ToBeDisabled = $true }
        @{ Alias = "Microsoft Office"; ProcessName = "WINWORD"; Directories = @("C:\Program Files\Microsoft Office", "C:\Program Files (x86)\Microsoft Office"); ToBeDisabled = $true }
        @{ Alias = "Adobe Creative Cloud"; ProcessName = "Creative Cloud"; Directories = @("C:\Program Files (x86)\Adobe", "C:\Program Files\Adobe"); ToBeDisabled = $true }
        @{ Alias = "AutoCAD"; ProcessName = "acad"; Directories = @("C:\Program Files\Autodesk", "C:\Program Files (x86)\Autodesk"); ToBeDisabled = $true }
        @{ Alias = "SketchUp"; ProcessName = "SketchUp"; Directories = @("C:\Program Files\SketchUp", "C:\Program Files (x86)\SketchUp"); ToBeDisabled = $true }
        @{ Alias = "Unity"; ProcessName = "Unity"; Directories = @("C:\Program Files\Unity\Hub\Editor", "C:\Program Files (x86)\Unity\Hub\Editor"); ToBeDisabled = $true }

    )

    $special = @(
        @{ Alias = "Disable SMB Shares"; Name = "SMB"; ToBeDisabled = $true }
    )

    # Check if these services are running, and if they aren't, we remove them from the $services array
    foreach ($service in $services) {
        $serviceStatus = Get-Service -Name $service.Name -ErrorAction SilentlyContinue
        if (-not ($serviceStatus -and $serviceStatus.Status -contains "Running")) {
            $services = $services | Where-Object { $_.Name -ne $service.Name }
        }
    }

    # Check if these applications are installed in at least one of the specified directories
    foreach ($application in $applications) {
        $isInstalled = $false
        foreach ($directory in $application.Directories) {
            if (Test-Path -Path $directory) {
                $isInstalled = $true
                break
            }
        }
        if (-not $isInstalled) {
            $applications = $applications | Where-Object { $_.ProcessName -ne $application.ProcessName }
        }
    }
    foreach ($action in $special) {
        switch ($action.Name) {
            "SMB" {
                $smbActive = $false
                Get-SmbShare | ForEach-Object {
                    if ($_.Name -notin @("ADMIN$", "C$", "IPC$")) {
                        $smbActive = $true
                    }
                }
                if (-not $smbActive) {
                    $special = $special | Where-Object { $_.Name -ne $action.Name }
                }
            }
            # Add more cases here for other special actions
        }
    }
    if ($services.Count -eq 0 -and $applications.Count -eq 0 -and $special.Count -eq 0) {
        Write-Output "No services, applications, or special actions to disable."
        return
    }
    $proceed = $false

    while (-not $proceed) {
        Clear-Host
        Write-Output "We found the following potentially unwanted services, applications, and special actions. Please review and confirm if you want to disable them."
        Write-Output "Use the number beside the service/application/action to swap between enabling and disabling."
        Write-Output "By default all services, applications, and actions will be disabled."
        Write-Host "Green = to be disabled, " -ForegroundColor Green -NoNewline
        Write-Host "Red = will not be disabled" -ForegroundColor Red
        Write-Output "Use 'a' to invert all services, applications, and actions."
        Write-Output "Use 'p' to proceed."
    
        $index = 1
        foreach ($service in $services) {
            if ($service.ToBeDisabled) {
                Write-Host "[$index] Service: $($service.Alias)" -ForegroundColor Green
            } else {
                Write-Host "[$index] Service: $($service.Alias)" -ForegroundColor Red
            }
            $index++
        }
        foreach ($application in $applications) {
            if ($application.ToBeDisabled) {
                Write-Host "[$index] Application: $($application.Alias)" -ForegroundColor Green
            } else {
                Write-Host "[$index] Application: $($application.Alias)" -ForegroundColor Red
            }
            $index++
        }
        foreach ($action in $special) {
            if ($action.ToBeDisabled) {
                Write-Host "[$index] Special: $($action.Alias)" -ForegroundColor Green
            } else {
                Write-Host "[$index] Special: $($action.Alias)" -ForegroundColor Red
            }
            $index++
        }
        # Collect user input
        $input = Read-Host "Enter your choice(s) (e.g., 1,3,5 or 'a' to invert all, 'p' to proceed)"
        if ($input -eq 'a') {
            foreach ($service in $services) {
                $service.ToBeDisabled = -not $service.ToBeDisabled
            }
            foreach ($application in $applications) {
                $application.ToBeDisabled = -not $application.ToBeDisabled
            }
            foreach ($action in $special) {
                $action.ToBeDisabled = -not $action.ToBeDisabled
            }
        }
        if ($input -eq 'p') {
            $proceed = $true
            break
        }
        if ($input -match "^[\d\.]+$") {
            # Is a number
            if ($services.Count + $applications.Count + $special.Count -lt $input) {
                Read-Host "Invalid input. Please try again."
            } else {
                if ($services.Count + 1 -gt $input) {
                    $services[$input - 1].ToBeDisabled = -not $services[$input - 1].ToBeDisabled
                } elseif ($services.Count + $applications.Count + 1 -gt $input) {
                    $applications[$input - $services.Count - 1].ToBeDisabled = -not $applications[$input - $services.Count - 1].ToBeDisabled
                } else {
                    $special[$input - $services.Count - $applications.Count - 1].ToBeDisabled = -not $special[$input - $services.Count - $applications.Count - 1].ToBeDisabled
                }
            }
        }
    }
    



    # Disable selected services and applications
    $index = 1
    foreach ($service in $services) {
        if ($service.ToBeDisabled) {
            Write-Output "Disabling service $($service.Alias)..."
            Stop-Service -Name $service.Name -Force
            Set-Service -Name $service.Name -StartupType Disabled
        }
        $index++
    }
    foreach ($application in $applications) {
        if ($application.ToBeDisabled) {
            Write-Output "Disabling application $($application.Alias)..."
            $appProcess = Get-Process -Name $application.ProcessName -ErrorAction SilentlyContinue
            if ($appProcess) {
                Stop-Process -Name $application.ProcessName -Force
            }
            foreach ($directory in $application.Directories) {
                if (Test-Path -Path $directory) {
                    Write-Output "Removing directory $directory..."
                    Remove-Item -Path $directory -Recurse -Force
                }
            }
        }
        $index++
    }
    foreach ($action in $special) {
        if ($action.ToBeDisabled) {
            Write-Output "Executing special action $($action.Alias)..."
            switch ($action.Name) {
                "SMB" {
                    Write-Output "Disabling SMB shares..."
                    Get-SmbShare | ForEach-Object {
                        if ($_.Name -notin @("ADMIN$", "C$", "IPC$")) {
                            Write-Output "Removing SMB share $($_.Name)..."
                            Remove-SmbShare -Name $_.Name -Force
                        } else {
                            Write-Output "Skipping default SMB share $($_.Name)..."
                        }
                    }
                }
                # Add more cases here for other special actions
            }
        }
    }
}

function Remove-Prohibited-Files {
    Write-Output "Scanning for prohibited files..."
    $prohibitedFiles = @()
    $excludedFolders = @("C:\Users\*\AppData", "C:\Windows", "C:\CyberPatriot", "C:\Program Files", "C:\Program Files (x86)")
    $searchPaths = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Root

    foreach ($path in $searchPaths) {
        Get-ChildItem -Path $path -Recurse -Include *.mp4, *.mp3 -ErrorAction SilentlyContinue | 
        Where-Object { 
            $excludedFolders -notcontains $_.FullName -and 
            $excludedFolders -notcontains $_.DirectoryName 
        } | 
        ForEach-Object {
            Write-Output "Found prohibited file: $($_.FullName)"
            $prohibitedFiles += @{Path = $_.FullName; ToBeDeleted = $true}
            # Uncomment the next line to actually remove the files
            # Remove-Item -Path $_.FullName -Force
        }
    }
    if ($prohibitedFiles.Count -eq 0) {
        Write-Output "No prohibited files found. Lucky you."
        return
    }
    # UI Code
    $proceed = $false

    while (-not $proceed) {
        Clear-Host
        Write-Output "We found some prohibited files. Please review and confirm if you want to remove them."
        Write-Output "Same deal as last time. Use the number beside the file to swap between keeping and deleting the file."
        Write-Output "By default all files will be deleted."
        Write-Host "Green = to be deleted, " -ForegroundColor Green -NoNewline
        Write-Host "Red = will not be deleted" -ForegroundColor Red
        Write-Output "Use 'a' to invert the selection."
        Write-Output "Use 'p' to proceed."
    
        $index = 1
        foreach ($file in $prohibitedFiles) {
            if ($file.ToBeDeleted) {
                Write-Host "[$index]: $($file.Path)" -ForegroundColor Green
            } else {
                Write-Host "[$index]: $($file.Path)" -ForegroundColor Red
            }
            $index++
        }
        # Collect user input
        $input = Read-Host "Enter your choice(s) (e.g., 1, 3, 5 or 'a' to invert all, 'p' to proceed)"
        if ($input -eq 'a') {
            foreach ($file in $prohibitedFiles) {
                $file.ToBeDeleted = -not $file.ToBeDeleted
            }
        }
        if ($input -eq 'p') {
            $proceed = $true
            break
        }
        if ($input -match "^[\d\.]+$") {
            # Is a number
            if ($prohibitedFiles.Count -lt $input) {
                Read-Host "Invalid input. Please try again."
            } else {
                $prohibitedFiles[$input - 1].ToBeDeleted = -not $prohibitedFiles[$input - 1].ToBeDeleted
            }
        }
    }
    foreach ($file in $prohibitedFiles) {
        if ($file.ToBeDeleted) {
            Write-Output "Removing file $($file.Path)..."
            Remove-Item -Path $file.Path -Force
        }
    }
}

function Full-Auto() {
    Write-Output "Running complete script..."
    Service-Disabler # It's first solely because we clear the console for pretty ui
    Remove-Prohibited-Files
    Handle-Accounts
    Write-Host "The next bit should be totally autonomous. Sit back and relax." -ForegroundColor Green -BackgroundColor Black
    Remove-Hacking-Tools
    Update-Applications
    Update-Windows
    Security-Config
    Write-Output "Full auto complete!"
    
}

function Show-Splash-ASCII-Text() {
    # Show ascii text to the terminal
    Write-Host " ______      _____ ________     _________ ______          __  __ __ " -ForegroundColor Cyan
    Write-Host "|  ____/\   / ____|  ____\ \   / /__   __|  ____|   /\   |  \/  /_ |" -ForegroundColor Yellow
    Write-Host "| |__ /  \ | |    | |__   \ \_/ /   | |  | |__     /  \  | \  / || |" -ForegroundColor Cyan
    Write-Host "|  __/ /\ \| |    |  __|   \   /    | |  |  __|   / /\ \ | |\/| || |" -ForegroundColor Yellow
    Write-Host "| | / ____ \ |____| |____   | |     | |  | |____ / ____ \| |  | || |" -ForegroundColor Cyan
    Write-Host "|_|/_/    \_\_____|______|  |_|     |_|  |______/_/    \_\_|  |_||_|" -ForegroundColor Yellow
}

function Show-Main-Menu() {
    Clear-Host

    Write-Host "A script by"
    Show-Splash-ASCII-Text
    Write-Host "Team 17-1280 (i promise a better team name later)"
    Write-Host "Writen by @Preloading (on github)"
    Write-Host ""
    Write-Host "Please choose one of the following options"
    Write-Host "[1. Complete]" -ForegroundColor Green
    Write-Host "[2. Update Applications]"
    Write-Host "[3. Security Config]"
    Write-Host "[4. Remove Hacking Tools]"
    Write-Host "[5. Handle Accounts]"
    Write-Host "[6. Service Disabler]"
    Write-Host "[7. Remove Prohibited Files]"
    Write-Host "[8. Windows Updates]"
    Write-Host "[9. Disable Simple TCP/IP Services]"
    Write-Host "[10. Stop Hidden USERS$ Share]"
    Write-Host "[q. Quit]" -ForegroundColor Red
    Write-Host ""
}
function Main-Menu() {
    do
    {
        Show-Main-Menu
        $input = Read-Host "Please make a selection"
        switch ($input)
        {
            '1' {
                    Clear-Host
                    Full-Auto
                } '10' {
                    Clear-Host
                    Disable-UsersShare
                } '9' {
                    Clear-Host
                    Disable-SimpleTcpServices
                } '8' {
                    Clear-Host
                    Update-Windows
            } '2' {
                    Clear-Host
                    Update-Applications
            } '3' {
                    Clear-Host
                    Security-Config
            } '4' {
                    Clear-Host
                    Remove-Hacking-Tools
            } '5' {
                    Clear-Host
                    Handle-Accounts
            } '6' {
                    Clear-Host
                    Service-Disabler
            } '7' {
                    Clear-Host
                    Remove-Prohibited-Files
            }  'q' {
                    return
            }
        }
        pause
    }
    until ($input -eq 'q')
}
Main-Menu
