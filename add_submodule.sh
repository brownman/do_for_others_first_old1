set -o nounset
clear
cat list
echo press a key to continue
read
echo ----- 

if [ $# -eq 0  ]
then
      echo "Usage: gitrepo-info <repo> , <owner> "
#        exit 65
    fi
repo=${1:-GMAIL_GROUP}
owner=${2:-brownman}






cmd="./check_size.sh $repo $owner"
echo "[cmd] $cmd"
eval "$cmd" >/tmp/scrap 
#echo "$str" | grep size --color=auto
 grep "Not Found" /tmp/scrap 1>/dev/null && { echo "[ Error] exiting" ; exit ; }

grep 'size\|default' /tmp/scrap


echo press y to  continue
read answer
if [ "$answer" = y ]; then
    #    git_url="git@github.com:brownman/repo.git" #dont allow editing of a sub-module
    git_url="https://github.com/$owner/$repo.git"
    git submodule add $git_url
    git submodule update --init
    git add $repo
    git commit -am "[ submodule as repo ] Added"
else
    echo skipping
fi
