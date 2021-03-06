module "tools_turbo" {
  source = "./module"

  cluster_config_file      = module.dev_cluster.config_file_path
  cluster_type             = module.dev_cluster.platform.type_code
  cluster_ingress_hostname = module.dev_cluster.platform.ingress
  tls_secret_name          = module.dev_cluster.platform.tls_secret
  
  namespace = module.dev_tools_namespace.name
  storage_class_provision = true
  storage_class_name = "ibmc-vpc-block-10iops-mzr"
}
