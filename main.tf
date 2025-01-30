provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "bucket" {
  bucket  = "my-jenkins-s3bucket"
  tags    = {
	Name          = "MyJenkinsS3Bucket"
  }
}