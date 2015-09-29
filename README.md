# peerflix-alpine
run peerflix and openvpn inside a docker container + localtunnel

## tl;dr
add a `login.conf` with your privateinternetaccess.com username and password like so:
```
username
password
```
and save that into the project directory then: 

 - `docker build --tag="peerflix-alpine" .`
 - `docker run --privileged -i -t peerflix-alpine`
 
the container needs the `--privileged` flag because it needs to create a tun device in the container

the output should look something like this
```
docker run --privileged -i -t peerflix-alpine
              <strong style="font-weight:bold;">You are protected by PIA</strong>
bash-4.3# your url is: https://something.localtunnel.me
bash-4.3#
```

if you do not see `<strong style="font-weight:bold;">You are protected by PIA</strong>` then something is wrong with the vpn connection.
`cat openvpn.log` inside the container should show you whats going on with the vpn tunnel startup. 

once you get an output like the one above you can 
 - `peerflix "<magnet:link>"`
 
The file will start downloading and you can open vlc and hit CTRL+n and paste in the localtunnel address and start watching the video whilst it is downloading.
