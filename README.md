# Getac-V110-G3-Compats
These scripts fix the various quality of life issues present with the Getac V110 G3 (2016) laptop when using the XFCE desktop environment. 

## Dependencies
- iio-sensor-proxy: IIO accelerometer sensor to input device proxy.
- xorg-xrandr: Primitive command line interface to RandR extension.
  
Easy install command:
```sudo pacman -S iio-sensory-proxy xorg-xrandr --needed```

## Recommended tools:
- evtest: Input device event monitor and query tool. Useful for grabbing the correct display name and information, as well as debugging various interfaces and components.
    - ```sudo pacman -S evtest```

## Usage
1) Make sure that the monitor values are correct. 
2) Ensure that .sh scripts are exectuable by running: ```chmod +x <file_name.sh>```
3) Set scripts to run at startup.


