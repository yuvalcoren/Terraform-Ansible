resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "devkey" # Create a "devkey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename        = "${local.key_name}.pem"
  content         = tls_private_key.pk.private_key_pem
  file_permission = "0400"
}
resource "aws_instance" "dev_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = local.instance_type
  subnet_id              = local.public_subnet_id
  vpc_security_group_ids = [local.security_group_ids]
  key_name               = local.key_name
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = local_file.ssh_key.content
      host        = self.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.dev_instance.public_ip}, --private-key ${local.private_key_path} jenkins.yml"
  }
}
resource "aws_route53_record" "main" {
  zone_id    = data.aws_route53_zone.selected.zone_id
  name       = data.aws_route53_zone.selected.name
  type       = "A"
  ttl        = "300"
  records    = [aws_instance.dev_instance.public_ip]
  depends_on = [aws_instance.dev_instance]
}