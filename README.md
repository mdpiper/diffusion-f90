# diffusion-f90

An example of the diffusion equation written in Fortran 90.

## Install

From the root directory of the repository, execute:

```bash
mkdir _build && cd _build
cmake ..
make
make install
```

Note that these commands install the diffusion package
to the default location, **/usr/local**.
If you'd like to install to an alternate location,
replace the call to `cmake` above with

    cmake -DCMAKE_INSTALL_PREFIX:PATH=/path/to/install ..

where **/path/to/install** is your alternate install location.

Run an example:

    run_diffusion

and see diffusion in action!

```
Model values at time =   20.0
    0.0    8.0   14.0   18.0   20.0   20.0   18.0   14.0    8.0    0.0
    0.0    5.1    9.2   12.1   13.5   13.5   12.1    9.2    5.1    0.0
    0.0    3.2    5.9    7.8    8.7    8.7    7.8    5.9    3.2    0.0
    0.0    1.9    3.6    4.7    5.4    5.4    4.7    3.6    1.9    0.0
    0.0    1.1    2.0    2.7    3.1    3.1    2.7    2.0    1.1    0.0
    0.0    0.6    1.1    1.5    1.7    1.7    1.5    1.1    0.6    0.0
    0.0    0.3    0.5    0.7    0.8    0.8    0.7    0.5    0.3    0.0
    0.0    0.1    0.2    0.3    0.4    0.4    0.3    0.2    0.1    0.0
    0.0    0.1    0.1    0.1    0.2    0.2    0.1    0.1    0.1    0.0
    0.0    0.0    0.0    0.1    0.1    0.1    0.1    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0    0.0
```
