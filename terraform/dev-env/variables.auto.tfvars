tags = {
    "Environment": "Dev"
}
ecr_name = [
    "devops-app",
    "devops-nginx"
]
image_mutability = "MUTABLE"

account_id = "XXXX"

codebuild_params = {
      "NAME" = "codebuild-demo-terraform"
      "GIT_REPO" = "https://github.com/ArtioDev/myapp.git"
      "IMAGE" = "aws/codebuild/standard:4.0"
      "TYPE" = "LINUX_CONTAINER"
      "COMPUTE_TYPE" = "BUILD_GENERAL1_SMALL"
      "CRED_TYPE" = "CODEBUILD"
  } 
environment_variables = {
      "AWS_DEFAULT_REGION" = "eu-central-1"
      "AWS_ACCOUNT_ID" = "XXXX"
      "IMAGE_APP_NAME" = "devops-app"
      "IMAGE_NGINX_NAME" = "devops-nginx"
      "IMAGE_TAG" = "latest"
  }