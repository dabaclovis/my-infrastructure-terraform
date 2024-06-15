resource "aws_security_group" "practiceb-security-group" {
  vpc_id      = aws_vpc.practicebVpc.id
  name        = lookup(local.name-of-resources[2], "name")
  description = lookup(local.name-of-resources[2], "desc")
  dynamic "ingress" {
    for_each = ["22","80","443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = lookup(local.name-of-resources[2], "sec")
  }
}