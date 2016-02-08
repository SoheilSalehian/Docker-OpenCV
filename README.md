# Docker-OpenCV-MemSnapShots: 
Dockerize OpenCV with memory profiling instrumentation code.

##  Features
- 14.04 Ubuntu Based
- OpenCV 3.0 image w/ built-in memory profiling 
- The instrumentation code allows for monitoring of mem consumption for each desired function call.

## Post-setup
Once inside the container run:
```
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
```
And to emulate a monitor for OpenCV algorithms using GTK (contours, etc):
```
Xvfb :1 -screen 0 1024x768x16 &> xvfb.log  & 
```
## References

[OpenCV image on github](https://github.com/SoheilSalehian/Docker-OpenCV-MemSnapshots)
