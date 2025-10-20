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
  - giraffe
  - --progress
  - -p
  - -t
  - $(runtime.cores)

inputs:
  graph:
    type: File
    inputBinding:
      prefix: -Z
  dist:
    type: File
    inputBinding:
      prefix: -d
  min:
    type: File
    inputBinding:
      prefix: -m
  hapl:
    type: File
    inputBinding:
      prefix: --haplotype-name
  reads1:
    type: File
    inputBinding:
      prefix: -f
  reads2:
    type: File?
    inputBinding:
      prefix: -f
  output:
    type: string
    default: vg_alignment.gam

outputs:
  gam:
    type: stdout

stdout: $(inputs.output)

