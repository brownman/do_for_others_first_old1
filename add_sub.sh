set -x
name=$1
if [ -n "$name" ];then
#    git_url="git@github.com:brownman/$name.git" #dont allow editing of a sub-module
    git_url="https://github.com/brownman/$name.git"
    git submodule add $git_url
    git submodule update --init
    git add $name
    git commit -am "[ submodule as $name ] Added"
else
    echo error - supply a name of a remote repo
fi

