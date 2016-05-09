# getsimple-docker
Docker container file for [GetSimple CMS](http://get-simple.info/)
This fetches the latest version from the GetSimple website, creates and runs a container named `getsimple` on the port 8080.

The default location of the installation will be in `/data/web/getsimple` of the host.

It is strongly advised to change the default values in `build.sh`

## Usage
Checkout this repository on a Docker-compatible machine and open a shell in the directory:
```
./build.sh
```

Then visit http://IP:8080
