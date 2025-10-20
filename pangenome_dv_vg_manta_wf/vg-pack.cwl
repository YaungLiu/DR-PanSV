cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/vg:1.54.0--h9ee0642_0"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(64 * 1024)

baseCommand: vg
arguments:
  - pack
  - -t
  - $(runtime.cores)
  - -Q
  - "5"

inputs:
  graph:
    type: File
    inputBinding:
      prefix: -x
  gam:
    type: File
    inputBinding:
      prefix: -g
  output:
    type: string
    default: vg_alignment.pack
    inputBinding:
      prefix: -o

outputs:
  pack:
    type: File
    outputBinding:
      glob: "$(inputs.output)"

