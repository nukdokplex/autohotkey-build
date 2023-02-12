# AutoHotKey Builder Action
GitHub Action for building [AutoHotkey](https://autohotkey.com/) scripts with `AHK2Exe`.


![Continous Integration](https://img.shields.io/github/actions/workflow/status/nukdokplex/autohotkey-build/ci.yml?label=integration)

## Attention

This action is designed **ONLY** for running in Windows Environment. It uses Windows binaries and runs in PowerShell. **You have been warned!**

By the way, AutoHotkey is also only available on Windows. Why do you want to compile your scripts on other platforms?

## Synopsis

This action was inspired by implementation of [this GitHub Action](https://github.com/nekocodeX/GitHub-Action-Ahk2Exe) from [@nekocodeX](https://github.com/nekocodeX), so the original idea belongs to him/her. I would be very proud if he/she joined the development of this project too.

This action, unlike the original idea, is intended to be more flexible and more fail-safe. And this action is the only one by these parameters in its niche.

The mechanism of this action can be broken down into four main steps:

1. Downloading required binaries, such as [AutoHotkey](https://github.com/AutoHotkey/AutoHotkey), [AHK2Exe](https://github.com/AutoHotkey/Ahk2Exe), [UPX](https://github.com/upx/upx) (if needed). All these binaries are downloaded from their official repositories. 
2. Unpacking binaries and setup environment for successful build. All related files are located in `./._ahk`.
3. Building you AutoHotkey scripts with this environment.
4. Cleaning up.

## Usage example

Suppose your scripts are at the root of your repository. Then after checkout they will be in the current working directory. Also lets suppose that you want to build in `./build`. Lets see how we can do this:

```yaml
name: Build

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    runs-on: windows-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Build with AHK v1.1.22.01
        uses: nukdokplex/autohotkey-build@v0.1
        with:
          version: v1.1.22.01
          x64: true
          x86: true
          compression: upx
          in: 
          out: build
          icon: 
      - name: Do domething with builded scripts
        shell: pwsh
        run: |
          ls build

```

## Action input parameters

|Parameter name|Parameter description|Required|Defaults to|
|-|-|-|-|
|version|The version of AutoHotkey to be used (must be the version from the official AutoHotkey repository, e.g. "v1.1.29.01").|`false`|`latest`|
|x64|Specifies whether to compile the 64-bit version.|`false`|`true`|
|x86|Specifies whether to compile the 32-bit version.|`false`|`false`|
|x64_suffix|Specifies suffix for the 64-bit version out file.|`false`|`_x64`|
|x86_suffix|Specifies suffix for the 32-bit version out file.|`false`|`_x86`|
|compression|Specifies which compression method to use. "none" - do not use compression, "upx" - use UPX compression. There is no MPRESS 'cause it's discontinued. Don't try to use it, it won't work.|`false`|`none`|
|in|Specifies a folder with scripts or a single script to be compiled. If you specify a folder, files with the extensions ".ahk", ".ahk2" will be taken. Recursive search in folder is not present.|`false`|Current Working Directory|
|out|Specifies the folder for output files.|`false`|`build`|
|icon|Specifies icon file to use.|`false`| |

## These made this possible

Many thanks to [@nekocodeX](https://github.com/nekocodeX) for this great idea!

Github Action [`robinraju/release-downloader`](https://github.com/robinraju/release-downloader) for cool action that got rid of the headache about downloading releases from GitHub.