export progs_symlink="../progs"

if  ! ([ -L $progs_symlink ] && [ -e $progs_symlink ] && [ -d $progs_symlink ])
then
    echo "Follow instructions in README to create a symlink to the 'sdql/progs' directory"
    exit 1
fi
