cwlVersion: v1.2
class: CommandLineTool
baseCommand: grep
stdout: $(inputs.output_filename)

inputs:
  pattern:
    type: string
    inputBinding:
      position: 1
  infile:
    type: File
    inputBinding:
      position: 2
  output_filename:
    type: string
    doc: "Name of the file where stdout will be written"

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)
