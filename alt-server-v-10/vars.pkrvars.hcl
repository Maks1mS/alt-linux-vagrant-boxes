iso_url = "./iso/alt-server-v-10.1-x86_64.iso"
iso_checksum = "sha256:9955e7bb5ee9affbe3de7473a3bcd53f7d8463b9e2f43ef6831ebfe71bc7da6c"

ssh_username = "vagrant"
ssh_password = "vagrant"

vm_name = "alt-server-v-10"

http_dir = "./alt-server-v-10/http"

output_directory = "./builds/alt-server-v-10"
output_filename = "alt-server-v-10-amd64"

boot_command = [
  "<wait><wait><wait><wait><wait><wait><wait><wait>",
  "e<wait><down><down><down><end><spacebar>",
  "ai curl=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
  "<f10>"
]

setup_playbook = "./alt-server-v-10/setup.yml"
setup_script = "./alt-server-v-10/setup.sh"