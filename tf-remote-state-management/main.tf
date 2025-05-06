resource "aws_s3_bucket" "mytf-demobucket" {
  bucket = "mytf-demobucket-123"
}

#uploading a local file to s3 bucket 
resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.mytf-demobucket.bucket
    source = "./myfile1.txt"
    key = "mydata.txt"              #folder name given to the bucket in aws

}
  
