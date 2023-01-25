module "aws_s3_create" {
    source = "./modules/s3_bucket"
    bucket = var.bucket
}

module "dynamo_db_create" {
    source = "./modules/DynamoDB"
    hash_key = var.hash_key
    name = var.name
}
