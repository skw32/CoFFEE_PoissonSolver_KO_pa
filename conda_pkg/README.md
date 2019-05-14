# Conda package wrapping CoFFEE project

To use -- with current working directory containing meta.yaml:

1. `conda create -n python=3 conda-build-env conda-build anaconda-client conda-verify`
2. `conda activate conda-build-env`
3. `conda-build . -c conda-forge`

## Build Environment setup requirements (macOS)

Ensure install of the [macOS 10.9 sdk](https://github.com/phracker/MacOSX-SDKs/releases).

(you can use this script but check what it does first to confirm you are happy with the modifications it will perform)
bash -x macos_ci_setup.sh
