alias v=nvim
alias vs='v -c "SessionManager load_last_session"'
alias clip='clip.exe'
alias vf='v $(fzf)'
alias cf='cat $(fzf)'
alias bf='bat $(fzf)'
alias rf='rm -rf'
alias curlg='curl -sSL -o /dev/null -D - '
curlt() {
    curl -w @- -o /dev/null -s "$@" <<'EOF'
    time_namelookup:  %{time_namelookup}\n
       time_connect:  %{time_connect}\n
    time_appconnect:  %{time_appconnect}\n
   time_pretransfer:  %{time_pretransfer}\n
      time_redirect:  %{time_redirect}\n
 time_starttransfer:  %{time_starttransfer}\n
                    ----------\n
         time_total:  %{time_total}\n
EOF
}
ff() { find . -type f -wholename "*$1*" }
fd() { find . -type d -wholename "*$1*" }
b64() { echo -n "$1" | base64 }
b64d() { echo -e "$1" | base64 -d }

# Git
alias g='git '
alias ga='git add '
alias gp='git push origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gs='git status '
alias gd='git diff '
alias gl='git log '
alias gr='git restore '
alias gca='git add .; git commit -a -m '
alias gpull='git pull --no-ff origin "$(git rev-parse --abbrev-ref HEAD)" --no-edit'
alias gbc='git add .; git commit -a -m "$(git rev-parse --abbrev-ref HEAD)"; git push origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gfp='git push -fu origin "$(git rev-parse --abbrev-ref HEAD)"'
unalias gcp 2> /dev/null || true # git cherry-pick
gcp() { gca "$@"; gp }

# AWS
alias asa='export AWS_REGION=sa-east-1 AWS_DEFAULT_REGION=sa-east-1'
alias aus='export AWS_REGION=us-east-1 AWS_DEFAULT_REGION=us-east-1'
alias ssoenv='eval "$(aws configure export-credentials --profile $AWS_PROFILE --format env)"'
alias aprd='export AWS_PROFILE=prd && asa && ssoenv'
alias adev='export AWS_PROFILE=dev && aus && ssoenv'
alias id='aws sts get-caller-identity'
alias ssm='aws ssm start-session --target '
adi() { aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" "Name=tag:Name,Values=*$1*" --query "Reservations[*].Instances[*].{id: InstanceId, name: Tags[?Key=='Name'] | [0].Value, env: Tags[?Key=='Environment'] | [0].Value, ip: PrivateIpAddress, squad: Tags[?Key=='Squad'] | [0].Value}" --output table }
aem() { aws sts decode-authorization-message --encoded-message "$1" }

# Kubectl
alias k=kubectl
alias kg='kubectl get '
alias kd='kubectl describe '
alias kl='kubectl logs -f '
alias ke='kubectl edit '
alias kx='kubectl exec -it '
alias kga='kubectl get ing,all,configmap,role,rolebinding,secret '
alias kgp='kubectl get po '
alias kgd='kubectl get deploy '
alias kgi='kubectl get ing '
alias kgs='kubectl get svc '
alias kgm='kubectl get configmap '
alias kgn='kubectl get node '
alias kgj='kubectl get job '

alias kdp='kubectl describe po '
alias kdn='kubectl describe node '
alias kdd='kubectl describe deploy '
alias kds='kubectl describe svc '
alias kdi='kubectl describe ing '
alias kdm='kubectl describe configmap '
alias kdj='kubectl describe job '

alias kep='kubectl edit po '
alias ked='kubectl edit deploy '
alias kes='kubectl edit svc '
alias kei='kubectl edit ing '
alias kem='kubectl edit configmap '
alias kej='kubectl edit job '

alias kdelp='kubectl delete po '
alias kdeld='kubectl delete deploy '
alias kdels='kubectl delete svc '
alias kdeli='kubectl delete ing '
alias kdelm='kubectl delete configmap '
alias kdelj='kubectl delete job '

alias kaf='kubectl apply -f '
alias kdf='kubectl delete -f '

alias kgaa='kubectl get all,ing,clusterrole,clusterrolebinding,secret,configmap,crd -A'
alias kgap='kubectl get po -A'

alias kcu='aws eks update-kubeconfig --name '
alias kcn='kubectl config set-context --current --namespace '
alias kcc='kubectl config use-context '
kpip() { kubectl get pod -o jsonpath='{range .items[*]}{@.metadata.name}{" "}{@.status.podIP}{"\n"}{end}' "$@" | column -t }

# Docker
alias dps='docker ps -a'
alias dps='docker ps -a'
alias dis='docker image ls'
alias dcc='docker rm $(docker ps --filter status=exited -q)'
alias dci='docker rmi $(docker images -f "dangling=true" -q)'

# Terraform
alias tf='terraform '
alias tfi='terraform init '
alias tfv='terraform validate'
alias tfp='terraform plan '
alias tfa='terraform apply '
alias tfd='terraform destroy '
alias tfo='terraform output '
alias tfr='terraform refresh'
alias tfs='terraform state '

# Ansible
alias ai='ansible-inventory '
alias ap='ansible-playbook '

# wsl-vpnkit
export VMEXEC_PATH=/etc/wsl-vpn-kit/wsl-vm 
export GVPROXY_PATH=/etc/wsl-vpn-kit/wsl-gvproxy.exe

# PSWD
export PSWD_PATH_PRIK='~/.local/vault/pswd.pem'
export PSWD_PATH_PUBK='~/.local/vault/pswd.pub'
export PSWD_PATH_FILE='~/.local/vault/pswd.pswd'
alias pswd='python3 ~/.local/pswd/main.py '

# Bitwarden
export BW_MASTERPASSWORD_FILE=~/.bw/.mp
export BW_SESSION_FILE=~/.bw/.session
alias bwl='~/.bw/login.sh '
alias bws='bw sync'
alias bwgen='bw generate -ulns --length 16'

for bin in /usr/bin ~/.local/bin; do
  [ -f $bin/bw ] && bw=$bin/bw && continue
done
bw() {
  $bw $@ --session $(cat $BW_SESSION_FILE)
}

bwg() {
  bw get password $@ | clip.exe
}

bwcf() {
  echo -n '{"name":"'$1'"}' | base64 | bw create folder
}

bwci() {
  [ $# -lt 3 ] && echo 'Please supply at least 3 of 4 args.' || (\
    name=$1
    login=$2
    uris=$3
    folder=${4:-null}
    [ $folder != null ] && folder=$(bw get folder $folder 2> .bwci.tmp | jq .id)
    [ -f .bwci.tmp ] && grep 'More than one result was found.' .bwci.tmp || \
    echo -n '{"folderId":'$folder',"type":1,"name":"'$name'","notes":null,"login":{"uris":'$uris',"username":"'$2'","password":"'$(bwgen)'","totp":null}}' | \
      base64 | bw create item > /dev/null
    rm -f .bwci.tmp)
}

bwui() {
  iid=$(bw get item $1 | jq -r .id)
  bw get item $1 | jq '.login.password="'$(bwgen)'"' | bw encode | bw edit item $iid > /dev/null
}
