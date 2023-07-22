locals {
  fwparentpolicyname = "${local.prefix}-fwparentpolicy"
  fwparentpolicyrg = "${local.prefix}-fwpolicy-rg"
  prefix = "ibo-org-${var.fwpolicylocation}"
  childfwpolicyname = "${local.prefix}"
}