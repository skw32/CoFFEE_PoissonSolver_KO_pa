# Pre-condition: you'll need get an authentication token capable of publishing to desired anaconda channel and stash it in travis-ci secret store.  Steps to do that:
# 1. Create a conda token
# >>> anaconda login
# >>> anaconda auth -c -n travis-ci --max-age 307584000 --url https://anaconda.org/USERNAME/PACKAGENAME --scopes "api:write api:read"
# 2. Add conda token in encrypted form to .travis.yml -- exposes token as environment variable CONDA_UPLOAD_TOKEN to travis-ci execution environment
# >>> travis encrypt CONDA_UPLOAD_TOKEN="..." --add
# 3. Add conda username to .travis.yml
# >>> travis encrypt CONDA_USER="suzannekwallace" --add


# build and upload the package to channel -- assumes security token/username are defined in environment variable CONDA_UPLOAD_TOKEN and USER
conda config --set anaconda_upload yes
conda-build --token $CONDA_UPLOAD_TOKEN --user $CONDA_USER .