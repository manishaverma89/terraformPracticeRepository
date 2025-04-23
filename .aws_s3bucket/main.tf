resource "aws_s3_bucket" "mytf-demobucket" {
  bucket = "mytf-demobucket-123"
}

resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.mytf-demobucket.bucket
    source = "./myfile1.txt"
    key = "mydata.txt"

}
  
