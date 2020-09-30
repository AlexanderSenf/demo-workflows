#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

doc: |
    Convert Crypt4GH to Plain (with given keys)

hints:
  DockerRequirement:
    dockerPull: ajsenf/test-crypt4gh:0.3

#requirements:
#  - class: InlineJavascriptRequirement

baseCommand: ["java", "-jar", "/ga4gh/crypt4gh-2.3.0-shaded.jar"]

inputs:
  input_file:
    type: File
    inputBinding:
      prefix: -d
  private_key:
    type: File
    inputBinding:
      prefix: -sk
  key_key:
    type: string
    inputBinding:
      prefix: -kk

outputs:
  unencrypted:
    type: File
    outputBinding:
      glob: $(inputs.input_file.basename).dec
