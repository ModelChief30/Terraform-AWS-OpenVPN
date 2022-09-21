data "template_file" "deployment_shell_script" {
  template = file("${path.module}/scripts/install.sh")
  vars = {
    openvpn_install_script_path = var.openvpn_install_script_path
    auto_install                = var.auto_install
    approve_ip                  = var.approve_ip
    ipv6_support                = var.ipv6_support
    port_choice                 = var.port_choice
    protocol_choice             = var.protocol_choice
    dns                         = var.dns
    compression_enabled         = var.compression_enabled
    customize_enc               = var.customize_enc
    export_client               = var.export_client
    pass                        = var.pass
  }
}

resource "aws_instance" "example" {
  ami           = "ami-09a2a0f7d2db8baca"
  instance_type = var.vm_size
  user_data_base64 = base64encode(data.template_file.deployment_shell_script.rendered)
  subnet_id = "${aws_subnet.vpnsubnet.id}"
  key_name = "aws-ssh"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  connection {
    type = "ssh"
    host = self.public_ip
    user = "${var.admin_username}"
    private_key = file("${var.ssh_private_key_path}")
  }

  tags = {
    Name = var.hostname
  }
}

resource "aws_key_pair" "aws-ssh" {
  key_name = "aws-ssh"
  public_key = file("${var.ssh_public_key_path}")
}