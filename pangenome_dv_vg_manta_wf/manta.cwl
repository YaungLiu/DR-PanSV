cwlVersion: v1.1
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
  ShellCommandRequirement: {}
hints:
  DockerRequirement:
    dockerPull: "docker://quay.io/biocontainers/manta:1.6.0--py27_0"
    dockerImageId: "/encrypted/e3008/pangenome/test_workflow/quay.io_biocontainers_manta_1.6.0--py27_0.sif"
  ResourceRequirement:
    coresMin: 16
    ramMin: $(32 * 1024)

baseCommand: bash
arguments:
  - -c
  - |
      set -e
      echo ">>> Running Manta 1.6.0 ..."
      configManta.py --referenceFasta $(inputs.ref.path) --bam $(inputs.aligned_reads.path) --runDir manta_run_pan
      manta_run_pan/runWorkflow.py -m local -j $(runtime.cores)
      ls -lh manta_run_pan/results/variants/
      mv manta_run_pan/results/variants/diploidSV.vcf.gz $(inputs.aligned_reads.nameroot).vcf.gz

inputs:
  ref:
    type: File
    secondaryFiles:
      - .fai
  aligned_reads:
    type: File
    secondaryFiles:
      - .crai

outputs:
  sv_vcf:
    type: File
    outputBinding:
      glob: $(inputs.aligned_reads.nameroot).vcf.gz

