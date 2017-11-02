echo "sgrep <FileName> <SearchText> <NumberOfLines>"

FILE=$1
SEARCH_TEXT=$2
CAT_LN=$3

LINE_NUMBERS=($(grep --line-number $SEARCH_TEXT $FILE | awk -F":" '{ print $1 }'))

for i in "${LINE_NUMBERS[@]}"
do
   :
  echo "************* $i ***************"
        HEAD_LENGTH=`expr $i + $CAT_LN`
        TAIL_LENGTH=`expr $CAT_LN + 1`
        echo "head -n $HEAD_LENGTH $FILE | tail -n $TAIL_LENGTH"
        head -n $HEAD_LENGTH $FILE | tail -n $TAIL_LENGTH
  echo "********************************"
done
