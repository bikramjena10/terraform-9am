module "dev" {
  source = "../Day-2-basic-code-for-module-source"
  ami_id = var.am
  type =var.te
  key_name=var.key_name
}