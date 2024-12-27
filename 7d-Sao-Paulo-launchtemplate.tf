resource "aws_launch_template" "app1_LT_80-SaoPaulo" {
  provider = aws.SaoPaulo
  name_prefix   = "app1_LT_80"
  image_id      = var.SaoPaulo_cidr_blocks[0].image_id  
  instance_type = "t2.micro"

  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app1-sg01-servers-TG01-SG01-80-SaoPaulo.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for port 80 EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>Mighty Magnus</h1>
    <h1>Brake Every Chain in port 80, Virginia</h1>
    <div class="tenor-gif-embed" data-postid="26133902" data-share-method="host" data-aspect-ratio="1.00313" data-width="40%"><a href="https://tenor.com/view/stephen-curry-rings-gif-26133902">Stephen Curry Rings GIF</a>from <a href="https://tenor.com/search/stephen+curry-gifs">Stephen Curry GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app1_LT_80"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}



/*
resource "aws_launch_template" "app2_LT_443-SaoPaulo" {
  provider = aws.SaoPaulo
  name_prefix   = "app2_LT_443"
  image_id      = var.SaoPaulo_cidr_blocks[0].image_id  
  instance_type = "t2.micro"

  key_name = "MyLinuxBox"

  vpc_security_group_ids = [aws_security_group.app1-sg03-secure-servers-TG02-443-SaoPaulo.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd

    # Get the IMDSv2 token
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

    # Background the curl requests
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
    wait

    macid=$(cat /tmp/macid)
    local_ipv4=$(cat /tmp/local_ipv4)
    az=$(cat /tmp/az)
    vpc=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$macid/vpc-id)

    # Create HTML file
    cat <<-HTML > /var/www/html/index.html
    <!doctype html>
    <html lang="en" class="h-100">
    <head>
    <title>Details for EC2 instance</title>
    </head>
    <body>
    <div>
    <h1>I'm Learning</h1>
    <h1>EveryTing Criss</h1>
    <div class="tenor-gif-embed" data-postid="26133902" data-share-method="host" data-aspect-ratio="1.00313" data-width="40%"><a href="https://tenor.com/view/stephen-curry-rings-gif-26133902">Stephen Curry Rings GIF</a>from <a href="https://tenor.com/search/stephen+curry-gifs">Stephen Curry GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script>
    <p><b>Instance Name:</b> $(hostname -f) </p>
    <p><b>Instance Private Ip Address: </b> $local_ipv4</p>
    <p><b>Availability Zone: </b> $az</p>
    <p><b>Virtual Private Cloud (VPC):</b> $vpc</p>
    </div>
    </body>
    </html>
    HTML

    # Clean up the temp files
    rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "app2_Secure-443"
      Service = "application1"
      Owner   = "Chewbacca"
      Planet  = "Mustafar"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
*/