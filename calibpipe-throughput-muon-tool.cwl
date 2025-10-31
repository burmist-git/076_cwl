#!/usr/bin/env cwl-runner

cwlVersion: v1.2

class: CommandLineTool

baseCommand: calibpipe-calculate-throughput-muon

label: Muon Throughput Calibration Tool
doc: >
    The calibpipe-calculate-throughput-muon is a command line tool that calculates the optical
    throughput via muon rings analysis. It is part of the calibpipe software package and is used to
    process data from the Cherenkov Telescope Array Observatory (CTAO).

inputs:
  muon_throughput_tool_input:
    type: File
    inputBinding:
      prefix: --input
    label: DL1 with optical throughput for single muon
    doc: >
        Aggregated muon statistics (observation or simulation) for optical throughput estimation.
  configuration:
    type: ["null", File, string]
    default: null
    inputBinding:
      prefix: --config
    doc: >
        Optional configuration File or string as path.
  log-level:
    type: string?
    inputBinding:
      prefix: --log-level
    doc: >
        Log level for the process. Default is INFO.

outputs: []
