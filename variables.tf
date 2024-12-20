variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "crewmeister-dev"
}

variable "namespace" {
  description = "Namespace for the application"
  type        = string
  default     = "crewmeister"
}

variable "ecr_image_uri" {
  description = "ECR image URI to deploy"
  type        = string
  default     = "263226313288.dkr.ecr.eu-central-1.amazonaws.com/crewmeister"
}

variable "helm_chart_name" {
  description = "Name of the Helm chart"
  type        = string
  default     = "crewmeister-app"
}
