# AutoHotKey Builder Action

![Continous Integration](https://img.shields.io/github/actions/workflow/status/nukdokplex/autohotkey-build/ci.yml?label=integration)

|Parameter name|Parameter description|Required|Defaults to|
|-|-|-|-|
|version|The version of AutoHotkey to be used (must be the version from the official AutoHotkey repository, e.g. "v1.1.29.01").|`false`|`latest`
|x64|Specifies whether to compile the 64-bit version.|`false`|`true`
|x86|Specifies whether to compile the 32-bit version.|`false`|`false`
|x64_suffix|Specifies suffix for the 64-bit version out file.|`false`|`_x64`
|x86_suffix|Specifies suffix for the 32-bit version out file.|`false`|`_x86`
|compression|Specifies which compression method to use. "none" - do not use compression, "upx" - use UPX compression. There is no MPRESS 'cause it's discontinued. Don't try to use it, it won't work.|`false`|`none`
|in|Specifies a folder with scripts or a single script to be compiled. If you specify a folder, files with the extensions ".ahk", ".ahk2" will be taken. Recursive search in folder is not present.|`false`|Current Working Directory
|out|Specifies the folder for output files.|`false`|`build`
|icon|Specifies icon file to use.|`false`|