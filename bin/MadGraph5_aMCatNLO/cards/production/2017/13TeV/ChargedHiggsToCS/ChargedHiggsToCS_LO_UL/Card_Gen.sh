#!/bin/bash

for mass in 075 080 085 090 100 110 120 130 140 150 160
do
    echo $mass
    rm -rf ChargedHiggsToCS_M${mass}_LO
    mkdir -p ChargedHiggsToCS_M${mass}_LO
    
    cp ChargedHiggsToCS_M120_run_card.dat ChargedHiggsToCS_M${mass}_LO/ChargedHiggsToCS_M${mass}_run_card.dat
    
    cp ChargedHiggsToCS_M120_customizecards.dat ChargedHiggsToCS_M${mass}_LO/ChargedHiggsToCS_M${mass}_customizecards.dat
    sed -i 's|set param_card mass 37 120|set param_card mass 37 '"${mass}"'|g' ChargedHiggsToCS_M${mass}_LO/ChargedHiggsToCS_M${mass}_customizecards.dat

    cp ChargedHiggsToCS_M120_proc_card.dat ChargedHiggsToCS_M${mass}_LO/ChargedHiggsToCS_M${mass}_proc_card.dat
    sed -i 's|output ChargedHiggsToCS_M120 -nojpeg|output ChargedHiggsToCS_M'"${mass}"' -nojpeg|g' ChargedHiggsToCS_M${mass}_LO/ChargedHiggsToCS_M${mass}_proc_card.dat

    CMD="./gridpack_generation.sh ChargedHiggsToCS_M${mass} cards/production/2017/13TeV/ChargedHiggsToCS/ChargedHiggsToCS_LO_UL/ChargedHiggsToCS_M${mass}_LO"
    pushd ../../../../../../
    ${CMD} &
    popd
done
wait
