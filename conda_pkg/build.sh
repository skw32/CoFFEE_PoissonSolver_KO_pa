#!/bin/bash

require_clean_work_tree () {
    # Detect when source files have been modified.  This function will cause the build to fail when that occurs.
    # Primarily useful for detecting when the generated .c files derived from .pyx do not match those committed to the repository.
    
    
    # Update the index
    git update-index -q --ignore-submodules --refresh
    err=0
    
    # Disallow unstaged changes in the working tree
    if ! git diff-files --quiet --ignore-submodules --
    then
        echo >&2 "ISSUE $1: you have unstaged changes."
        git diff-files --name-status -r --ignore-submodules -- >&2
        err=1
    fi
    
    # Disallow uncommitted changes in the index
    if ! git diff-index --cached --quiet HEAD --ignore-submodules --
    then
        echo >&2 "ISSUE $1: your index contains uncommitted changes."
        git diff-index --cached --name-status -r --ignore-submodules HEAD -- >&2
        err=1
    fi
    
    if [ $err = 1 ]
    then
        echo >&2 "Sanity check failure: Something changed in the source tree during the build process that we didn't expect.  The above files changed versus the committed versions.  Ensure the generated files in repository are up to date with respect to source files to fix this.  You probably want to run python setup.py build and commit the .c files that change"
        exit 1
    fi
}


# Verify inital state of tree
require_clean_work_tree BEFORE_BUILD


# Run the build process
$PYTHON clean.py
$PYTHON setup.py install


# Detect if anything changed in the source tree
# cython will generate new .c files -- if they don't match what we have in repository we should exit with a non-zero status.
# To fix the issue, commit the .c files so they match those from the repositories .pyx.
require_clean_work_tree AFTER_BUILD


# Add more build steps here, if they are necessary.

# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build process.


