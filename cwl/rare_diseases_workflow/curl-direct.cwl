cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["curl"]

doc: "transfer file from a remote FTP/HTTP server to the TES"
requirements:
  - class: DockerRequirement
    dockerPull: jlaitinen/lftpalpine
  - class: ResourceRequirement
    tmpdirMin: 2500
    outdirMin: 2500
hints:
  - class: ResourceRequirement
    coresMin: 2
    ramMin: 2000

inputs:
  curl_url:
    type: string
    inputBinding:
      prefix: --url
      separate: true
      position: 1
  curl_output:
    type: string
    inputBinding:
      prefix: --output

outputs:
  in_file:
    type: File
    outputBinding:
      glob: $(inputs.curl_output)
