resource "random_id" "rand_id" {
    byte_length = 8 
}

#RAndom id for s3 bucketis created as "${random_id.rand_id.hex}"
resource "aws_s3_bucket" "mytf-demobucket" {
  bucket = "mytf-demobucket-${random_id.rand_id.hex}"
}

resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.mytf-demobucket.bucket
    source = "./myfile1.txt"
    key = "mydata.txt"

}
  
output "value-of-random-id" {
  value = random_id.rand_id.hex
}

