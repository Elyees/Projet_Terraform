# AWS S3 static website bucket & lambda function

Ce module crée un bucket S3 configuré pour un dossier helloworld.zip , et une fonction lambda qui déploie ce code dans le zip depuis le bucket s3 .

## Usage

```hcl
module "<module name>" {
    source = ".\modules\aws-s3-static-website-bucket\"
    bucket_name = "<UNIQ BUCKET NAME>"
    tags = {
        key   = "<value>"
    }
}