# peerflix-alpine
Run [peerflix](https://www.npmjs.com/package/peerflix) and [openvpn](https://openvpn.net/) inside a docker container with a [localtunnel](https://www.npmjs.com/package/localtunnel) to connect to.

## tl;dr
Add a file called `login.conf` with your privateinternetaccess.com username and password in it like so
```
username
password
```
and save that into the project directory.

Next:

 - `docker build --tag="peerflix-alpine" .`
 - `docker run --privileged -i -t peerflix-alpine`

The container needs the `--privileged` flag because it needs to create a tun device in the container

The output should look something like this
```
docker run --privileged -i -t peerflix-alpine
              <strong style="font-weight:bold;">You are protected by PIA</strong>
bash-4.3# your url is: https://something.localtunnel.me
bash-4.3#
```

If you do not see `<strong style="font-weight:bold;">You are protected by PIA</strong>` then something is wrong with the vpn connection.

`cat openvpn.log` inside the container should show you whats going on with the vpn tunnel startup.

Once you get an output like the one above you can
 - `peerflix "<magnet:link>"`

The file will start downloading and you can open vlc and hit CTRL+n and paste in the localtunnel address and start watching the video whilst it is downloading.

## Extras

If you want to save the files you download for viewing later etc. launch the container like so:
 - `docker run -v /path/for/files:/files --privileged -i -t peerflix-alpine`

Then inside the machine make sure to:
 - `cd files`
 - `peerflix -f . "<magnet:link>"`

The files will be saved on your host machine in `/path/for/files`

If you need to check to make sure you are connected to the vpn after the initial output run:

 - `sh checkip.sh`

it will output the protected status from the privateinternetaccess.com website like it does during the initial startup.

If you want ot run the container without starting the vpn etc. start it like so:

 - `docker run --privileged -i -t peerflix-alpine /bin/bash`

that will drop you into the container at the bash prompt. You can start the vpn with:
 - `sh startvpn.sh`
 
