cwlVersion: v1.2
class: CommandLineTool

baseCommand: echo

inputs:
  paramA:
    type: string[]?
    inputBinding:
      prefix: -A
      position: 1

  paramB:
    type:
      type: array
      items: string
      inputBinding:
        prefix: B=
        separate: false
    inputBinding:
      prefix: -s
      position: 3

  paramC:
    type: string[]
    inputBinding:
      prefix: C=
      itemSeparator: "+"
      separate: false
      position: 2

  paramD:
    type:
      type: array
      items: string
      inputBinding:
        prefix: --D=
        separate: false
    inputBinding:
      position: 4

outputs: []