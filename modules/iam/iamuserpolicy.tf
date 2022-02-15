# Syntax to be checked in general

#Create iam users

resource "aws_iam_user" "iamuser" {
  name = var.iamusername //iamusername to be passed from the resources S3, route53,etc
}

#Accesskey

resource "aws_iam_access_key" "iamaccesskey" {
  user = "${aws_iam_user.iamuser.name}" // Check syntax
}

# Policy file location

data "template_file" "policy" {
  template = "${file("${path.module}/policy.json")}" //Policy.json to be provided by the resource 
 }

# Map the policy file to the iam user

resource "aws_iam_user_policy" "iamuserpolicy" {
  name = var.iamuserpolicyname //iamuserpolicyname to be passed from the resources S3, route53,etc
  user = "${aws_iam_user.iamuser.name}"

  policy = "${data.template_file.policy.rendered}" 
}