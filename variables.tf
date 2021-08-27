
variable "cluster_config_file" {
  type        = string
  description = "Cluster config file for Kubernetes cluster."
}

variable "releases_namespace" {
  type        = string
  description = "Name of the existing namespace where the Helm Releases will be deployed."
}

variable "turbo_namespace" {
  type        = string
  description = "Name of the existing namespace where turbo will be deployed."
  default     = "turbonomic"
}

variable "cluster_ingress_hostname" {
  type        = string
  description = "Ingress hostname of the IKS cluster."
}

variable "hostname" {
  type        = string
  description = "The hostname that will be used for the ingress/route"
  default     = "sonarqube"
}

variable "cluster_type" {
  description = "The cluster type (openshift or ocp3 or ocp4 or kubernetes)"
  default = "ocp4"
}

variable "helm_version" {
  description = "The version of the helm chart that should be used"
  type        = string
  default     = "6.4.1"
}

variable "turbo_service_account_name" {
  description = "The name of the service account that should be used for the deployment"
  type        = string
  default     = "t8c-operator"
}

variable "plugins" {
  description = "The list of plugins that will be installed on SonarQube"
  type        = list(string)
  default     = [
    "https://binaries.sonarsource.com/Distribution/sonar-typescript-plugin/sonar-typescript-plugin-2.1.0.4359.jar",
    "https://binaries.sonarsource.com/Distribution/sonar-java-plugin/sonar-java-plugin-6.5.1.22586.jar",
    "https://binaries.sonarsource.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-6.2.1.12157.jar",
    "https://binaries.sonarsource.com/Distribution/sonar-python-plugin/sonar-python-plugin-2.9.0.6410.jar",
    "https://binaries.sonarsource.com/Distribution/sonar-go-plugin/sonar-go-plugin-1.7.0.883.jar",
    "https://github.com/checkstyle/sonar-checkstyle/releases/download/4.33/checkstyle-sonar-plugin-4.33.jar"
  ]
}

variable "tls_secret_name" {
  type        = string
  description = "The secret containing the tls certificates"
  default = ""
}

variable "volume_capacity" {
  type        = string
  description = "The volume capacity of the persistence volume claim"
  default     = "2Gi"
}

variable "storage_class" {
  type        = string
  description = "The storage class of the persistence volume claim"
  default     = "ibmc-file-gold"
}

variable "postgresql" {
  type = object({
    username      = string
    password      = string
    hostname      = string
    port          = string
    database_name = string
    external      = bool
  })
  description = "Properties for an existing postgresql database"
  default     = {
    username      = ""
    password      = ""
    hostname      = ""
    port          = ""
    database_name = ""
    external      = false
  }
}

variable "gitops_dir" {
  type        = string
  description = "Directory where the gitops repo content should be written"
  default     = ""
}

variable "mode" {
  type        = string
  description = "The mode of operation for the module (setup)"
  default     = ""
}
