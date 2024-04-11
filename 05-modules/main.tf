#calling ec2module
module "ec2" {
    source      = "./ec2"
    sg          = module.sg.sgid                  # Step1 : Declare the info that you wish to share as OUTPUT
}

#calling sgmodule
module "sg" {
    source      = "./sg"
}