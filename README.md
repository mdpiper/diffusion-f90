# diffusionf

An example of the diffusion equation written in Fortran.

## Build, install, and run

To build this example,
change to the root directory of this repository
and execute:

```bash
mkdir _build && cd _build
cmake ..
make
```

Note that these commands install the diffusion package
to the default location, **/usr/local**.
If you'd like to install to an alternate location,
modify the call to `cmake` with

    cmake -DCMAKE_INSTALL_PREFIX:PATH=/path/to/install ..

where **/path/to/install** is your alternate install location.

Check that the example was built correctly
by running the unit tests:

    make test

To install, type:

    make install

Run the model with the `run_diffusionf` program,
which takes a model configuration file
(see [test.cfg](./tests/test.cfg) as an example)
as a required parameter.

    run_diffusionf test.cfg

Output from the model run is written to the file **diffusionf.out**
in the current directory.
