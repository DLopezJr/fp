# fp

An Easier Way to Launch Flatpaks


## PURPOSE

Flatpak requires a "[reverse-DNS style](https://docs.flatpak.org/en/latest/conventions.html#application-ids)" naming scheme for applications. 

This is due to "[security concerns](https://github.com/flatpak/flatpak/issues/994)".

The side-effect is that launching apps is difficult to remember and tedious to type.

## DETAILS

```fp``` uses ```flatpak run``` and extended regex to search and run the matching flatpak.

#### Dependencies
```flatpak``` (https://flatpak.org/setup/)

#### Install
```
$ git clone https://github.com/DLopezJr/fp
$ cd fp
$ test -x "$(command -v sudo)" && sudo make install || su -c "make install"
```
#### Uninstall
```
$ git clone https://github.com/DLopezJr/fp
$ cd fp
$ test -x "$(command -v sudo)" && sudo make uninstall || su -c "make uninstall"
```

#### Usage

```
$ fp <package_name>
```

```
$ fp <package_name> <$2>
```

#### Example
```
$ fp vlc
```

```
$ fp vlc --help 
```

#### Comments
- The Flatpak naming scheme allows case-insenstive names. This has caused some complexity. 
  - Currently only lower case stdin is functional.

#### TODO:
- Packaging for repos
- Manpage or Help flag
- Error Handling
- Full Postional Parameter Support
