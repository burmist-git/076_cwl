cwlVersion: v1.2
class: CommandLineTool

baseCommand: date

inputs: []

stdout: output.txt

outputs:
  output:
    type: File
    outputBinding:
      glob: output.txt