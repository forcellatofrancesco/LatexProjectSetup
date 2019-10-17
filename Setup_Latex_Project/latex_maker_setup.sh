# Francesco Forcellato 17/10/2019
# this is the file that allows to setup a latex project with the bash command "makelatex"
# basically it copies the bash script that setups the project in the right folder and then it adds
# the alias of the command in the .bashrc file of the current User 

# move the file in the right folder:
cp -r .latex_scripts/ $HOME/

# add the alias to make the command work
cat >> $HOME/.bashrc << 'start'
alias makelatex='sh $HOME/.latex_scripts/.make_latex_project.sh'
alias languagelatex='sh $HOME/.latex_scripts/.change_latex_maker_language.sh'
start

echo "Setup : done."
echo "Now you can create a latex project with makelatex."
echo "To change the default language run languagelatex."
echo "In order to see the differences log out and log in again, or run:"
echo "source $HOME/.bashrc"
