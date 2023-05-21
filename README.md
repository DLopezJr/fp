# fp

An Easier Way to Launch Flatpaks


## PURPOSE

Flatpak requires a [reverse-DNS style](https://docs.flatpak.org/en/latest/conventions.html#application-ids) naming scheme for applications. 

This is due to "[security concerns](https://github.com/flatpak/flatpak/issues/994)".

The side-effect is that launching apps is difficult to remember & tedious to type.
- ```$ flatpak run org.videolan.VLC```

Attempting to solve this by adding flatpak's app directories to "$PATH" is said to be "[insecure](https://github.com/flatpak/flatpak/issues/994#issuecomment-328154457)". 

## DETAILS
```fp``` solves this by being a wrapper.

It uses ```flatpak run``` and [extended regex](https://www.math.utah.edu/docs/info/gawk_5.html) to search and run the matching flatpak.

#### Dependencies
```flatpak``` (https://flatpak.org/setup/)

#### Install
```
$ git clone https://github.com/DLopezJr/fp
$ cd fp
$ sudo make install || su -c "make install"
```
#### Uninstall
```
$ cd fp
$ sudo make uninstall || su -c "make uninstall"
```

#### Usage

```
$ fp <package_name>
```

```
$ fp <package_name> <$@>
```

#### Example
```
$ fp vlc
```

```
$ fp vlc --help 
```

#### TODO:
- Packaging for repos
- Manpage 
- tab-compleition 
