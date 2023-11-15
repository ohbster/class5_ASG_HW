resource "aws_launch_template" "launch_template" {
  name_prefix   = "app1_LT"
  #image_id      = "ami-0b48feff5edeb9293"  #amazon linux
  image_id = "ami-07cf963e6321c9e6a" #debian
  instance_type = "t3.micro"

  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    apt update -y
    apt install apache2 -y
    apt install jq -y
    systemctl enable apache2
    systemctl start apache2

    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait
    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    cat <<HTML > /var/www/html/index.html &

    <html>
        <body>
        <h1>Houston Tech is live</h1><br/>
        <video width="406" height="720" autoplay controls loop>
            <source src="https://ohbster-homework-bucket.s3.amazonaws.com/dance.mp4" type="video/mp4">
        </video>
        <br/><h1>by Houston Tech</h1>
        <div>
            <p><b>Instance Name:</b> $(hostname -f) </p>
            <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
            <p><b>Availability Zone: </b> $az</p>
            <p><B>$(cat /etc/os-release)</p>
        </div>
        </body>
    </html>
    HTML
    wait
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_LT"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

