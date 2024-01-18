// data source aws parameters

data "aws_ssm_parameter" "client_id" {
  name = "client_id"
}

data "aws_ssm_parameter" "client_secret" {
  name = "client_secret"
}

data "aws_ssm_parameter" "dbr_account_id" {
  name = "databricks_account_id"
}



// data source aws cloudformation stack

data "aws_cloudformation_stack" "this" {
  name = "databricks-workspace-stack-6bc30"
}



// data source aws VPC

data "aws_vpc" "this" {
   tags = {
    Name = "Quick-Start-VPC"
  }
}



// data source aws private subnets

data "aws_subnets" "this" {
  filter {
    name   = "tag:Name"
    values = ["dev-dbr-private-subnet"] 
  }
}



// data source aws security_groups

data "aws_security_groups" "this" {
  tags = {
    Name = "dev-dbr-worker-sg"
    
  }
}



// declear local variables

locals {
    client_id = data.aws_ssm_parameter.client_id.value
    client_secret = data.aws_ssm_parameter.client_secret.value
    databricks_account_id = data.aws_ssm_parameter.dbr_account_id.value
}

data "aws_iam_role" "this" {
  name = "databricks-workspace-stack-fefaa-role"
}