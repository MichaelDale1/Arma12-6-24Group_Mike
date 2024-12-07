terraform {
    backend "s3" {
        bucket = "arm1-dec24"
        key = "MyLinuxBox"
        region = "ap-northeast-1"      
}
}
