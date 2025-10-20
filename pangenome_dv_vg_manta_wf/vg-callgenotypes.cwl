cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/vg:1.54.0--h9ee0642_0"
  ResourceRequirement:
    coresMin: 64
    ramMin: $(128 * 1024)

baseCommand: vg
arguments:
  - call
  - -S
  - $(inputs.ref_prefix)
  - -z

inputs:
  graph:
    type: File
    inputBinding:
      position: 1
  snarls:
    type: File
    inputBinding:
      prefix: -r
  pack:
    type: File
    inputBinding:
      prefix: -k
  ref_prefix:
    type: string
    default: GRCh38
  output:
    type: string
    default: $(inputs.pack.nameroot).vcf

outputs:
  vcf:
    type: stdout

stdout: $(inputs.output)

