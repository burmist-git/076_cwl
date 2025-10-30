cwlVersion: v1.2
class: Workflow

inputs:
  pattern: string
  infile: File
  grep_output: string

outputs: []

steps:
  grep:
    run: grep.cwl
    in: 
      pattern: pattern
      infile: infile
      output_filename: grep_output
    out: [output_file]

  wc:
    run: wc.cwl
    in:
      infile: grep/output_file
    out: []