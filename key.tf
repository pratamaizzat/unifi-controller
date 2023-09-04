data "aws_key_pair" "unifi_server" {
  key_name           = "unifi-server"
  include_public_key = true

  filter {
    name   = "tag:Name"
    values = ["unifi-server"]
  }
}