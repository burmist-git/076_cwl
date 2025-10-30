cwlVersion: v1.2
class: CommandLineTool
baseCommand: [wc, -l] 

inputs:
  infile:
    type: File
    inputBinding:
      position: 1

outputs: []
