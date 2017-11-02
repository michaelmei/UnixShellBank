echo "sgrep <FileName> <NumberOfLines> <LIMIT> <SEARCH_TEXT>"

ARGUMENT_NUMBER=$#
ARGUMENT_ITER=0
for i in $*; do
   if [ $ARGUMENT_ITER -eq 0 ]
   then
       FILE=$i
   elif [ $ARGUMENT_ITER -eq 1 ]
   then
       CAT_LN=$i
   elif [ $ARGUMENT_ITER -eq 2 ]
   then
       LIMIT=$i
   else
       SEARCH_TEXT="$SEARCH_TEXT $i"
   fi

   ARGUMENT_ITER=`expr $ARGUMENT_ITER + 1`
done

LINE_NUMBERS=($(grep -F --line-number "$SEARCH_TEXT" $FILE | awk -F":" '{ print $1 }'))

#echo LINE_NUMBERS: $LINE_NUMBERS

# get length of an array
tLen=${#LINE_NUMBERS[@]}
loopNo=0

# use for loop read all nameservers
for (( i=tLen-1; i>=0; i-- ));
do
  echo "************* $loopNo/$tLen ***************"
        TMP_LN=${LINE_NUMBERS[$i]}
        HEAD_LENGTH=`expr $TMP_LN + $CAT_LN`
        TAIL_LENGTH=`expr $CAT_LN + 1`

        #echo "head -n $HEAD_LENGTH $FILE | tail -n $TAIL_LENGTH"
        head -n $HEAD_LENGTH $FILE | tail -n $TAIL_LENGTH

        loopNo=`expr $loopNo + 1`
        if [ $loopNo -eq $LIMIT ]
        then
                break
        fi
done
