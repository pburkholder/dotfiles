set scripts_dir "$HOME/Projects/cloud-gov/cg-scripts"

alias jump-prod "pushd $scripts_dir; ./jumpbox cloud.gov production; popd"
alias jump-dev "pushd $scripts_dir; ./jumpbox cloud.gov development; popd"

for e in staging tooling master westb westc easta eastb master-west master-east tooling-west tooling-east 
  alias jump-$e="pushd $scripts_dir; ./jumpbox cloud.gov $e; popd"
end

export scripts_dir="$HOME/Projects/cloud-gov/cg-scripts"

alias jump-prod="pushd $scripts_dir; ./jumpbox cloud.gov production; popd"
alias jump-dev="pushd $scripts_dir; ./jumpbox cloud.gov development; popd"

for e in staging tooling 
  alias jump-$e="pushd $scripts_dir; ./jumpbox cloud.gov $e; popd"
end

### --- ###
function cf_go_fail
  echo $argv
  return -1
end

set CF_GO_HOME $HOME/.cf_go
set CGAPI "https://api.fr.cloud.gov"

function cf_go_create -a cf_env
  echo "Creating cf_go env $cf_env with current target"
  return 0
#  set cf_go_env "$HOME/.cf_go/$cf_env"
#  [ -d $cf_go_env ] && cf_go_fail "Env directory, $cf_go_env, already exists"
#  mkdir -p $cf_go_env
#  chmod 700 $cf_go_env
#  export CF_HOME=$cf_go_env/
#  cf api $CGAPI
#  cf login --sso
end

function cf_go
    # Process options
    argparse -n cf_go 'c/create=' 'd/delete=' 'l/list' -- $argv

    if set -ql _flag_create
      cf_go_create $_flag_create
      return 0
    end
    if set -ql _flag_delete
      /bin/rm -rf $CF_GO_HOME/$_flag_delete
      set -e CF_HOME
      return 0
    end
    if set -ql _flag_list
      /bin/ls $CF_GO_HOME
      return 0
    end
    set -l cf_switch $argv[1]
    echo "cf switch $cf_switch"
    if test "$cf_switch" = "default"
      set -e CF_HOME
    else
      export CF_HOME=$CF_GO_HOME/$cf_switch
    end
end

function cf_api -a api
  switch $api
    case fr fr-stage
      export CF_HOME="$HOME/.cfall/$api"
      [ -d $CF_HOME ] || mkdir -p $CF_HOME
      chmod 700 $CF_HOME
      cf target || cf login -a api.$target.cloud.gov --sso
    case dev
      export CF_HOME="$HOME/.cfall/$api"
      [ -d $CF_HOME ] || mkdir -p $CF_HOME
      chmod 700 $CF_HOME
      cf target || cf login -a api.dev.us-gov-west-1.aws-us-gov.cloud.gov --sso
    case '*'
      echo "Whoops, expected 'cf_go (fr|fr-stage|dev)'"
      return 1
  end    
end
