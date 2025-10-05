module "ec2" {
    source = "../modules/ec2/"
    ami_id = "ami-02d26659fd82cf299"
    instance_type = "t3.micro"
    key_name = "april-lab"
    instance_count = 2
}


