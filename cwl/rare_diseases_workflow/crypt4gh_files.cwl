#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

requirements:
  - class: ScatterFeatureRequirement

inputs:
  input_file: File
  private_key: File
  key_key: string

outputs:
  unencrypted_files:
    type: File[]
    outputSource: decrypt_step/unencrypted

steps:

  download_step:
    run: curl-crypt4gh.cwl
    in:
      curl_config_file: input_file
    out:
      [in_files]


  decrypt_step:
    run: crypt4gh_file.cwl
    scatter: [input_file]
    scatterMethod: dotproduct
    in:
      input_file: download_step/in_files
      private_key: private_key
      key_key: key_key
    out:
      [unencrypted]
