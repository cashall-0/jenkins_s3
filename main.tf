provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "b" {
  bucket  = "my-new-jenkins-s3bucket"
  tags    = {
	Name          = "MyJenkinsS3Bucketnew"
  }
}