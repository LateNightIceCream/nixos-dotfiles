function _get_rand_col () {
  COLS_ARR=(1 2 3 4 6)
  size=${#COLS_ARR[@]}
  index=$(($RANDOM % $size))
  echo ${COLS_ARR[$index]}
}

function _git_branch () {
  symbol=
  git_branch="$(__git_ps1)";
  out=""
  if [ "$git_branch" = "" ];
  then
    out=""
  else
    #out+="$(tput setaf 4)"
    #out+=''
    #out+="$(tput sgr0)"
    #out+="$(tput setab 4)"
    #out+="$(tput setaf 0)"
    out+="$(tput bold)"
    out+=" $symbol "
    out+=$git_branch
    out+=''
    out+="$(tput sgr0)"
    #out+="$(tput setaf 4)"
    #out+=''
    #out+="$(tput sgr0)"
  fi
  echo $out
}
