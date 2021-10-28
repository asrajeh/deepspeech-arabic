#!/bin/bash
# preprocessing CommonVoice Arabic text written by Abdullah Alrajeh, Oct 2021

dir=cv-corpus-7.0-2021-07-21/ar/clips

for type in train test dev; do
  cat $dir/$type.csv \
  | awk -F ',' '{if(NR == 1 || $3 !~ /[a-zA-Z]/) print $0}' \
  | sed 's/[ًٌٍَُِّ~ْ]//g' \
  | sed 's/ﻻ/لا/g' \
  | sed 's/ﺃ/أ/g' \
  | sed 's/چ/ج/g' \
  | sed 's/ڨ/ق/g' \
  | sed 's/ک/ك/g' \
  | sed 's/ھ/ه/g' \
  | sed 's/ی/ي/g' \
  | sed "s/['“”«»،؛؟ـ—☭…]//g" \
  | sed "s/$(printf $b '\u0670')//g" \
  | sed "s/$(printf $b '\u06d6')//g" \
  | sed "s/$(printf $b '\u06d7')//g" \
  | sed "s/$(printf $b '\u06d8')//g" \
  | sed "s/$(printf $b '\u06da')//g" \
  | sed "s/$(printf $b '\u06db')//g" \
  > $dir/$type.clean.csv
done
