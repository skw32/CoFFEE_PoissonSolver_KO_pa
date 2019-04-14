This directory contains the recipe for building a conda package for CoFFEE.

To use/test:

First create a conda build environment with the tools needed to run the `conda-build` command

1. `conda create -n conda-build-env python=3.6`
2. `conda activate conda-build-env`
3. `conda install conda-build conda-verify anaconda-client`

Then run `conda-build .` from this directory (NOTE: this does not modify your `conda-build-env` -- you can reuse this environment to test conda package build process and don't have to recreate it everytime)

1. `conda-build .`
