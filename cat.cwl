cwlVersion: v1.2
class: CommandLineTool

baseCommand: cat

inputs:
  input_file:
    type: File
    inputBinding:
      position: 1

outputs:
  output:
    type: File
    outputBinding:
      glob: output.txt

stdout: output.txt
