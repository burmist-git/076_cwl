cwlVersion: v1.2
class: CommandLineTool

baseCommand: date

inputs: []

stdout: output_date.txt

outputs:
  output:
    type: File
    outputBinding:
      glob: output_date.txt
