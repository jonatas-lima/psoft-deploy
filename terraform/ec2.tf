resource "aws_instance" "deploy" {
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.deploy-sg.id]
  subnet_id                   = aws_subnet.deploy-public-1.id
  key_name                    = aws_key_pair.deploy-kp.key_name
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("./private/id_rsa")
  }

  provisioner "file" {
    content     = data.aws_s3_object.migrations-file.body
    destination = "/tmp/data.sql"
  }

  provisioner "file" {
    content     = data.aws_s3_object.stack-file.body
    destination = "/tmp/stack.yml"
  }

  provisioner "file" {
    content     = data.aws_s3_object.backend-env.body
    destination = "/tmp/backend.env"
  }

  provisioner "file" {
    content     = data.aws_s3_object.db-env.body
    destination = "/tmp/db.env"
  }

  provisioner "remote-exec" {
    script = "./provision_script.sh"
  }

  tags = {
    Name = "deploy-psoft"
  }
}

output "ip" {
  value = aws_instance.deploy.public_ip
}
