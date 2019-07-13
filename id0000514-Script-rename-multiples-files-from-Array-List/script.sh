#!/bin/sh

# copy the file x times
#for i in {1..100}; do cp document.txt "test$i.txt"; done



# use this script if you have many files already to rename
a=1     # change this value if you need start your track in other number of track
for i in *.txt; do
  new=$(printf "%03d.txt" "$a") #03 pad to length of 3
  mv -f -- "$i" "$new"
  let a=a+1
done


declare -a arr=("" # keep empty the first array index, because have index zero.
                "new-rename-Afghanistan"
                "new-rename-Albania"
                "new-rename-Algeria"
                "new-rename-American_Samoa"
                "new-rename-Andorra"
                "new-rename-Angola"
                "new-rename-Anguilla"
                "new-rename-Antigua_and_Barbuda"
                "new-rename-Argentina"
                "new-rename-Armenia"
                "new-rename-Aruba"
                "new-rename-Australia"
                "new-rename-Austria"
                "new-rename-Azerbaijan"
                "new-rename-Bahamas"
                "new-rename-Bahrain"
                "new-rename-Bangladesh"
                "new-rename-Barbados"
                "new-rename-Belarus"
                "new-rename-Belgium"
                "new-rename-Belize"
                "new-rename-Benin"
                "new-rename-Bermuda"
                "new-rename-Bhutan"
                "new-rename-Bolivia"
                "new-rename-Bosnia_and_Herzegovina"
                "new-rename-Botswana"
                "new-rename-Brazil"
                "new-rename-British_Virgin_Islands"
                "new-rename-Brunei"
                "new-rename-Bulgaria"
                "new-rename-Burkina_Faso"
                "new-rename-Burundi"
                "new-rename-Cambodia"
                "new-rename-Cameroon"
                "new-rename-Canada"
                "new-rename-Cape_Verde"
                "new-rename-Cayman_Islands"
                "new-rename-Central_African_Republic"
                "new-rename-Chad"
                "new-rename-Chile"
                "new-rename-China"
                "new-rename-Colombia"
                "new-rename-Comoros"
                "new-rename-Cook_Islands"
                "new-rename-Costa_Rica"
                "new-rename-Croatia"
                "new-rename-Cuba"
                "new-rename-Curaçao"
                "new-rename-Cyprus"
                "new-rename-Czech_Republic"
                "new-rename-Democratic_Republic_of_the_Congo"
                "new-rename-Denmark"
                "new-rename-Djibouti"
                "new-rename-Dominica"
                "new-rename-Dominican_Republic"
                "new-rename-Timor-Leste"
                "new-rename-Ecuador"
                "new-rename-Egypt"
                "new-rename-El_Salvador"
                "new-rename-Equatorial_Guinea"
                "new-rename-Eritrea"
                "new-rename-Estonia"
                "new-rename-Ethiopia"
                "new-rename-Faroe_Islands"
                "new-rename-Federated_States_of_Micronesia"
                "new-rename-Fiji"
                "new-rename-Finland"
                "new-rename-France"
                "new-rename-French_Polynesia"
                "new-rename-Gabon"
                "new-rename-Georgia"
                "new-rename-Germany"
                "new-rename-Ghana"
                "new-rename-Gibraltar"
                "new-rename-Greece"
                "new-rename-Greenland"
                "new-rename-Grenada"
                "new-rename-Guam"
                "new-rename-Guatemala"
                "new-rename-Guernsey"
                "new-rename-Guinea"
                "new-rename-Guinea-Bissau"
                "new-rename-Guyana"
                "new-rename-Haiti"
                "new-rename-Honduras"
                "new-rename-Hong_Kong"
                "new-rename-Hungary"
                "new-rename-Iceland"
                "new-rename-India"
                "new-rename-Indonesia"
                "new-rename-Iran"
                "new-rename-Iraq"
                "new-rename-Ireland"
                "new-rename-Isle_of_Man"
                "new-rename-Israel"
                "new-rename-Italy"
                "new-rename-Ivory_Coast"
                "new-rename-Jamaica"
                "new-rename-Japan"
                )




counterTrackNumber = 0;
trackNumber=1
# put current date as yyyy-mm-dd HH:MM:SS in $date
date=$(date '+%Y-%m-%d-%H%M')
echo $date

  for z in *.txt; do   
    new=$(printf "%03d" "$trackNumber") #03 pad to length of 3
    let counterTrackNumber++   
    mv "$z" $new-${arr[$counterTrackNumber]}-$date.txt
    let trackNumber=trackNumber+1
  done

#show the new files
ls -lah

