plugin "aws" {
  enabled = true
  version = "0.28.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "terraform_unused_declarations" { enabled = false }
rule "terraform_required_version" { enabled = false }
rule "terraform_required_providers" { enabled = false }
rule "terraform_module_pinned_source" { enabled = false }
