#!/bin/bash

# only build the conda package -- use when running from untrusted context (eg from a github PR)
conda config --set anaconda_upload no
conda-build .