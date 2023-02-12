# fp

An Easier Way to Launch Flatpaks


## PURPOSE

Flatpak requires uses a "[reverse-DNS style](https://docs.flatpak.org/en/latest/conventions.html#application-ids)" naming scheme for applications. This is due to "[security concerns](https://github.com/flatpak/flatpak/issues/994)".

The side-effect is that launching apps is difficult to remeber and tedious to type.

## DETAILS

```fp``` uses ```flatpak run``` and extended regex to search and run the matching flatpak.

### Template

```
$ fp <package_name>
```

```
$ fp <package_name> <$2>
```

### Example
```
$ fp vlc
```

```
$ fp vlc --help 
```

### Comments
- The Flatpak naming scheme allows case-insenstive names. This has caused some complexity. 
  - Currently only lower case stdin is functional.

### TODO:
- Packaging for repos
- Manpage or Help flag
- Makefile
- Error Handling
- Full Postional Parameter Support
