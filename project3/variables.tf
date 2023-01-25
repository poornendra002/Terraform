variable "bucket" {
    default = "my-s3-bucket-backend-2002"
}
variable "hash_key" {
    default = "LockID"
}

variable "name" {
    default = "my_dynamo_db_backend_table"
}

# bucket name has to be uniq orelse it throws an error
