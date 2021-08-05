provider "aws" {
    region ="us-east-1"
}
module  "my_vpc"{

    source = "../modules/vpc"
    version = "v0.1.1"
    vpc_cidr= "192.168.0.0/16"
    tenancy = "default"
    vpc_id = "${module.my_vpc.vpc_id}"
    subnet_cidr = "192.168.1.0/24"
}


module "my_ec2_instance"{
    source = "../modules/ec2"
    version = "v0.1.1"
    ec2_count= "1"
    ami_id = "ami-0747bdcabd34c712a"
    instance_type = "t2.micro"
    subnet_id = "${module.my_vpc.subnet_id}"

}
