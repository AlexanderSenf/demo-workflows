class: Workflow
cwlVersion: v1.0
id: rd_connect
label: RD_Connect

inputs:
  - id: curl_known_sites_url
    type: string
  - id: curl_known_sites_url_output
    type: string

outputs:
  result_file:
    type: File
    #outputSource: known_sites_in/in_file
    outputSource: unzipped_known_sites/unzipped_known_sites_file

steps:
  - id: known_sites_in
    in:
      - id: curl_url
        source: curl_known_sites_url
      - id: curl_output
        source: curl_known_sites_url_output
    out:
      - id: in_file
    run: curl-direct.cwl

  - id: unzipped_known_sites
    in:
      - id: known_sites_file
        source:
          - known_sites_in/in_file
    out:
      - id: unzipped_known_sites_file
    run: gunzip_known_sites.cwl

requirements:
  - class: MultipleInputFeatureRequirement
  - class: SubworkflowFeatureRequirement
