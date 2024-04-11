# declaring a variable
variable "sample" {
    default  = "Hello world"
}

# printing an output
output "op" {
    value    = var.sample
}

# Whenever you want to print a variable in the group of words, you need to use the bash syntax
output "ops" {
    value = "My first msg is ${var.sample}"
}

# A Variable can be accessed directly by calling it as var.variableName, but if you're accessing in between a set of strings, then you need to enclose them in quotes and it should referred using ${var.VarName}
# In Terraform there is no concept of Single Quotes. 

variable "number" {
    default  = 100 
}

output "op_number" {
    value    = var.number
}

# Declaring a list variable 
variable "sample_list" {
    default = [
        "DevOps",
        55, 
        "Manoj",
        "0730AMIST"
    ]
}

output "print_list" {
    value = "Welcome To ${var.sample_list[0]} Training and the batch timings are ${var.sample_list[3]} and the batch number is ${var.sample_list[1]}"
}

# Declaring a Map Variable
variable "sample_map" {
    default = {
        batch    = "b55"
        Mode     = "Online"
        Training = "DevOpsWithAWS"
    }
}

# Printing a map variable
output "sample_map_op" {
    value = "${var.sample_map["Training"]} has great scope of opportunites and this is complete ${var.sample_map["Mode"]} Training"
}

##########################  Declaring an empty variable and passing the value in the *.tfvars file #########################
variable "city" {}

output "city_name" {
    value = "Name of the city is ${var.city}"
}

variable "state" {}

output "state_name" {
    value  = var.state
}

variable "country" {}

output "country_name" {
    value = "Name Of our country is ${var.country}"
}

variable "states" {}

output "states_count" {
    value  = "Toatl number of states in Bharat is ${var.states}"
}

variable "fav_cloud" {}

output "fav_cloud_op" {
    value  = "My favorite cloud is ${var.fav_cloud}"
}