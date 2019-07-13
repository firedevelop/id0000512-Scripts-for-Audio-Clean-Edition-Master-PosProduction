#!/bin/sh

# copy the file x times
for i in {1..100}; do cp document.txt "test$i.txt"; done



# use this script if you have many files already to rename
# a=1     # change this value if you need start your track in other number of track
# for i in *.txt; do
#   new=$(printf "%03d.txt" "$a") #03 pad to length of 3
#   mv -f -- "$i" "$new"
#   let a=a+1
# done


declare -a arr=("" # keep empty the first array index, because have index zero.
                "Afghanistan"
                "Albania"
                "Algeria"
                "American_Samoa"
                "Andorra"
                "Angola"
                "Anguilla"
                "Antigua_and_Barbuda"
                "Argentina"
                "Armenia"
                "Aruba"
                "Australia"
                "Austria"
                "Azerbaijan"
                "Bahamas"
                "Bahrain"
                "Bangladesh"
                "Barbados"
                "Belarus"
                "Belgium"
                "Belize"
                "Benin"
                "Bermuda"
                "Bhutan"
                "Bolivia"
                "Bosnia_and_Herzegovina"
                "Botswana"
                "Brazil"
                "British_Virgin_Islands"
                "Brunei"
                "Bulgaria"
                "Burkina_Faso"
                "Burundi"
                "Cambodia"
                "Cameroon"
                "Canada"
                "Cape_Verde"
                "Cayman_Islands"
                "Central_African_Republic"
                "Chad"
                "Chile"
                "China"
                "Colombia"
                "Comoros"
                "Cook_Islands"
                "Costa_Rica"
                "Croatia"
                "Cuba"
                "Curaçao"
                "Cyprus"
                "Czech_Republic"
                "Democratic_Republic_of_the_Congo"
                "Denmark"
                "Djibouti"
                "Dominica"
                "Dominican_Republic"
                "Timor-Leste"
                "Ecuador"
                "Egypt"
                "El_Salvador"
                "Equatorial_Guinea"
                "Eritrea"
                "Estonia"
                "Ethiopia"
                "Faroe_Islands"
                "Federated_States_of_Micronesia"
                "Fiji"
                "Finland"
                "France"
                "French_Polynesia"
                "Gabon"
                "Georgia"
                "Germany"
                "Ghana"
                "Gibraltar"
                "Greece"
                "Greenland"
                "Grenada"
                "Guam"
                "Guatemala"
                "Guernsey"
                "Guinea"
                "Guinea-Bissau"
                "Guyana"
                "Haiti"
                "Honduras"
                "Hong_Kong"
                "Hungary"
                "Iceland"
                "India"
                "Indonesia"
                "Iran"
                "Iraq"
                "Ireland"
                "Isle_of_Man"
                "Israel"
                "Italy"
                "Ivory_Coast"
                "Jamaica"
                "Japan"
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

