
#Check the syntax

#Get the access key

output "iam_user_access_key" {
  value = "${aws_iam_access_key.iamaccesskey.id}"
}

#Get the secret

output "iam_user_secret_key" {
  value = "${aws_iam_access_key.iamuser.secret}"
}

#Get the iamuser arn

output "iam_user_arn" {
  value = "${aws_iam_user.iamuser.arn}"
}