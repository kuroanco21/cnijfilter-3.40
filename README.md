# IJ Printer Driver Ver.3.40 for Ubuntu 24.04

## Supported Models
- IP4800 series
- MG5100 series
- MG5200 series
- MG6100 series
- MG8100 series
- MP250 series
- MP280 series
- MP495 series

> [!NOTE]
> untested

## Requirements
- Docker (not too old)
- Driver's source code (download it from the official website)

## How to build and install
1. Download the driver's source code tarball `cnijfilter-source-3.40-1.tar.gz` to `./`
    - SHA256 hash I got: `a95dd4ca491a9e8acc3e4ee35cc84904680e82d89ff04a23dda1b0ccffbb8a7a`
1. Run `sudo docker build --output=./output`
1. The built package will be placed in `./output`
1. Install the common package and the package(s) for the model(s) you want to use
