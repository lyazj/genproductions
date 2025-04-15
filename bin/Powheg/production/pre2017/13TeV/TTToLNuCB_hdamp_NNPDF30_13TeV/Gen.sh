#!/bin/bash

CMD="./gridpack_generation.sh TTToLNuCB_hdamp_NNPDF30_13TeV production/pre2017/13TeV/TTToLNuCB_hdamp_NNPDF30_13TeV"
pushd ../../../../
${CMD} &
popd
