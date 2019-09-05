function aws_who_am_i_usage() {
  printf "
  aws_who_am_i
  - with no args: who is the user that the ENV currently refers to (AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY / AWS_DEFAULT_REGION)
  - with 1 arg: provide a filename that can be sourced that has the above environment variables
  - with 2 args: aws_who_am_i AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY
  "
}

function aws_who_am_i() {
  argument_count="$#"
  case $argument_count in
  [0])
    [[ -z $AWS_ACCESS_KEY_ID ]] || aws_who_am_i_usage
    [[ -z $AWS_SECRET_ACCESS_KEY ]] || aws_who_am_i_usage
    [[ -z $AWS_DEFAULT_REGION ]] || aws_who_am_i_usage
    ;;
  [1])
    [[ -f $1 ]] || aws_who_am_i_usage
    . $1
    ;;
  [2])
    AWS_ACCESS_KEY_ID=$1
    AWS_SECRET_ACCESS_KEY=$2
    AWS_DEFAULT_REGION=us-east-1
    ;;
  *)
    aws_who_am_i_usage
    ;;
  esac

  aws iam get-user | jq .User.Arn 2>&1 |ruby -e 'puts STDIN.read.match(/(arn:aws:iam::\d+:user\/\w+)/).captures[0]'
}

if [[ "$(basename -- "$0")" == "aws_who_am_i" ]]; then
  aws_who_am_i $@
fi
