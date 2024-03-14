# Programming Language Development Environment setup documentation

## Languages
+ [C programming](#c-programming)

## Entries
### C programming
#### Setup
##### Dependencies
+ glibc : GNU C standard library
+ gcc : Compilers
+ git : Version Control System
+ make : Build System

##### Useful Tools
+ clang : Scan-build Static analyzer and LSP
+ valgrind : Tool to reverse engineer and debug memory-management problems

#### System Environment
- Windows
    + Add the path of all the components to your system %PATH% environment variable

#### Build process and compilation
- Using gcc
    - Baseline
        ```bash
        gcc [source-files] -o [output-file] {other-options <arguments>}
        ```
    - Includes and linkers
        ```bash
        gcc [source-files] -o [output-file] {other-options <arguments>} -I[includes] -L[linkers]
        ```

## Wiki

## Resources

## References
+ [ArchWiki - C](https://wiki.archlinux.org/title/C)

## Remarks

