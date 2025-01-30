provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "my_bucket" {
  bucket  = "my-jenkins-s3bucket"
  tags    = {
	Name          = "MyJenkinsS3Bucket"
  }
}