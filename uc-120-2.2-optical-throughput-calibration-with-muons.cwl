#!/usr/bin/env cwl-runner

cwlVersion: v1.2

class: Workflow
requirements:
  InlineJavascriptRequirement: {}
  StepInputExpressionRequirement: {}
  MultipleInputFeatureRequirement: {}
label: Optical throughput measurements via muon ring analysis
doc: >
    Upon receiving a new DL0 data product (from either Monte Carlo simulations or observations), DPPS triggers the CalibPipe
    (ctapipe-process) to process the data using ctapipe, extracting the signal charges and reconstructing muon parameters.
    The second step involves using the CalibPipe tool to estimate the telescope’s optical throughput using a
    predefined number of muon events.

inputs:
  dl0_input_data:
    type: File
    label: DL0 file with pre-tagged muon events
    doc: >
        DL0 data/simulation with pre-tagged muon events for optical throughput measurements.
  process_config_muon_image:
    type: File
    label: Muon image process
    doc: >
        Configuration file for Muon image process.
  process_config_muon_fit:
    type: File
    label: Muon image fit config
    doc: >
        Configuration file for Muon image fit.
  throughput_muon_config:
    type: File
    label: Muon optical throughput calculator config
    doc: >
        Configuration file for Muon optical throughput calibration
  log-level:
    type: string?
    doc: >
        Log level for the process. Default is INFO.

outputs:
  dl1_muon_data:
    type: File
    label: DL1 with optical throughput
    doc: >
        Aggregated muon statistics (observation or simulation) for optical throughput estimation.
    outputSource: process_muon_image/dl1_data

steps:
  process_muon_image:
    run: ctapipe-process-tool.cwl
    in:
      process_tool_input: dl0_input_data
      process_tool_output:
        valueFrom: $(inputs.dl0_input_data.basename.replace(/\..*$/, '.dl1.h5'))
      configuration: [process_config_muon_image, process_config_muon_fit]
      log-level: log-level
    out: [dl1_data]
  process_muon:
    run: calibpipe-throughput-muon-tool.cwl
    in:
      muon_throughput_tool_input: process_muon_image/dl1_data
      configuration: throughput_muon_config
      log-level: log-level
    out: []
