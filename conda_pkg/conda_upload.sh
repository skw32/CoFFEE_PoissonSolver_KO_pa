# Steps to get anaconda credentials into travis-ci in expected form:
# 1. Create a conda token
# >>> anaconda login
# >>> anaconda auth -c -n travis-ci --max-age 307584000 --url https://anaconda.org/USERNAME/PACKAGENAME --scopes "api:write api:read"
# 2. Add conda token in encrypted form to .travis.yml -- exposes token as environment variable CONDA_UPLOAD_TOKEN to travis-ci execution environment
# >>> travis encrypt CONDA_UPLOAD_TOKEN="..." --add

# Configure these two variables
PKG_NAME=coffee_poisson_solver

# Owner of conda package
USER=breathe

# disable anaconda auto-upload (can't taken token credential)
conda config --set anaconda_upload yes

# build and upload the package
conda-build --token $CONDA_UPLOAD_TOKEN --user $USER .
