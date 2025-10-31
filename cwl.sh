#!/bin/bash
   
function printHelp {
    echo " --> ERROR in input arguments"
    echo " -h                     : print help"
    echo " --cwltool_h            : print cwltool help"
    echo " --ex01                 : hello_world.cwl"
    echo " --ex02                 : date-tool.cwl"
    echo " --ex03                 : date-tool_stdout.cwl"
    echo " --ex04                 : cat.cwl cat.cfg"
    echo " --ex05                 : array.cwl array.cfg"
    echo " --grep                 : grep test"
    echo " --wc                   : wc test"
    echo " --workflow             : workflow test"
    echo " --ctapipe-process      : ctapipe-process with muons"
    echo " --ctapipe-process_test : ctapipe-process with muons without cwl"
}

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-h" ]; then
	printHelp
    elif [ "$1" = "--cwltool_h" ]; then
	cwltool --help
    elif [ "$1" = "--ex01" ]; then
	cwltool hello_world.cwl
    elif [ "$1" = "--ex02" ]; then
	cwltool date-tool.cwl
    elif [ "$1" = "--ex03" ]; then
	cwltool date-tool_stdout.cwl
    elif [ "$1" = "--ex04" ]; then
	cwltool cat.cwl cat.cfg
    elif [ "$1" = "--ex05" ]; then
	cwltool array.cwl array.cfg
    elif [ "$1" = "--grep" ]; then
	cwltool grep.cwl --infile output.txt --pattern READ --output_filename grep_output.txt
    elif [ "$1" = "--wc" ]; then
	cwltool wc.cwl --infile output.txt
    elif [ "$1" = "--workflow" ]; then
	cwltool grep-wc-wf.cwl --grep_output grep_output.txt --infile output.txt --pattern READ
    elif [ "$1" = "--workflow_cfg" ]; then
	cwltool grep-wc-wf.cwl --grep_output grep_output.txt --infile output.txt --pattern READ
    elif [ "$1" = "--ctapipe-process" ]; then
	cwltool grep-wc-wf.cwl --grep_output grep_output.txt --infile output.txt --pattern READ
    elif [ "$1" = "--ctapipe-process_test" ]; then
        ctapipe-process --overwrite --input=muon_0deg_0deg_run000001___cta-prod6-2156m-LaPalma-lst-dark-ref-degraded-0.83.simtel.zst --output=muon_0deg_0deg_run000001___cta-prod6-2156m-LaPalma-lst-dark-ref-degraded-0.83.simtel.zst.dl1.h5 --config=ctapipe_process_muon_image.yaml
    else	
        printHelp
    fi
fi
