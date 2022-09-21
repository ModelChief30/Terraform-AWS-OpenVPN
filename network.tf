resource "aws_vpc" "vnet" {
    cidr_block = var.vnet_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    
    tags = {
        Name = "${var.prefix}-network"
    }
}

resource "aws_subnet" "vpnsubnet" {
    vpc_id = "${aws_vpc.vnet.id}"
    cidr_block = "172.16.8.0/24"
    map_public_ip_on_launch = true
    availability_zone = "eu-west-2a"

    tags = {
        Name = "${var.prefix}-subnet"
    }
}

resource "aws_security_group" "sg" {
    vpc_id = "${aws_vpc.vnet.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 943
        to_port = 943
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 1194
        to_port = 1194
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "${var.prefix}-sg"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.vnet.id}"
    tags = {
        Name = "${var.prefix}-igw"
    }
}

resource "aws_route_table" "crt" {
    vpc_id = "${aws_vpc.vnet.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags = {
        Name = "${var.prefix}-crt"
    }
}

resource "aws_route_table_association" "crta-vpnsubnet" {
    subnet_id = "${aws_subnet.vpnsubnet.id}"
    route_table_id = "${aws_route_table.crt.id}"
}