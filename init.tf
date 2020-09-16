provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

provider "kubernetes" {
    config_context_cluster = "minikube"
}