function _get_rand_col () {
  COLS_ARR=(1 2 3 4 6)
  size=${#COLS_ARR[@]}
  index=$(($RANDOM % $size))
  echo ${COLS_ARR[$index]}
}

function _git_branch () {
  symbol=
  git_branch="$(__git_ps1)";
  out=""
  if [ "$git_branch" = "" ];
  then
    out=""
  else
    out+=" $symbol"
    out+=$git_branch
    out+=''
  fi
  echo $out
}

