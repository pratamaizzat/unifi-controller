resource "aws_instance" "unifi_controller" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.ubuntu_22_04.id
  key_name               = data.aws_key_pair.unifi_server.key_name
  vpc_security_group_ids = var.sg
  subnet_id              = var.subnet_id

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  tags = merge(
    local.tags,
    {
      "Name"        = "Unifi Controller",
      "IsTerraform" = true
    },
  )

  provisioner "remote-exec" {
    inline = ["echo 'WAIT UNTIL SSH IS READY'"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("pem/unifi-server.pem")
      host        = aws_instance.unifi_controller.public_ip
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook --extra-vars=\"local_ip=${aws_instance.unifi_controller.public_ip}\" -i ${aws_instance.unifi_controller.public_ip}, --private-key ./pem/unifi-server.pem main.yaml"
  }
}