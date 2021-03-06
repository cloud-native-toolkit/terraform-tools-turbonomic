
variable "cluster_config_file" {
  type        = string
  description = "Cluster config file for Kubernetes cluster."
}

variable "cluster_ingress_hostname" {
  type        = string
  description = "Ingress hostname of the IKS cluster."
}

variable "cluster_type" {
  description = "The cluster type (openshift or ocp3 or ocp4 or kubernetes)"
  default = "ocp4"
}

variable "tls_secret_name" {
  type        = string
  description = "The secret containing the tls certificates"
  default = ""
}

variable "service_account_name" {
  description = "The name of the service account that should be used for the deployment"
  type        = string
  default     = "t8c-operator"
}

variable "probes" {
  description = "The probes to deploy with turbonomic"
  type        = list(string)
  default     = ["kubeturbo","instana","openshiftingress"]
}

variable "storage_class_provision" {
  description = "Flag indicating that an ibm block custom storage class should be created and used"
  type        = bool
  default     = false
}

variable "storage_class_name" {
  description = "Name of the block storage class to use - if multizone deployment then waitforfirstconsumer must be set on storageclass binding mode"
  type        = string
}

variable "namespace" {
  type        = string
  description = "Name of the existing namespace where turbo will be deployed."
  default     = "turbonomic"
}