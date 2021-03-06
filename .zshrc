# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/rileymathews/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect

######JAVA####
export JAVA_HOME=$(/usr/libexec/java_home)


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.oh-my-zsh/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  web-search
  autojump
  osx
  sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="code ~/.zshrc"
alias zshsource="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#
# Prompt
#


#
# GIT Aliases
#
alias nuke="rm -rf "
alias gpom="git push origin master"
alias gpum="git push upstream master"
alias gs="git status"
alias gc="git checkout "
alias gcb="git checkout -b"
alias gpo="git push origin "
alias gpu="git push upstream "
alias gcm="git commit -m"
alias gcma="git commit -a -m"
alias hookup="git remote add origin"
alias gpm="git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d"

# 
# Docker aliases
# 
alias dcup="docker-compose up --rm"
alias dcbuild="docker-compose build"
alias dcdown="docker-compose down"
alias dcrun="docker-compsoe run --rm"
alias dcexec="docker-compose exec"

# 
# python aliases
# 
newenv() 
{
  python -m venv $1
}

#
# Custom Aliases
#
alias nw="ttab -w"
alias hs="http-server"
alias golive="~/ngrok http 8080"
alias reactlive="~/ngrok http 3000"

alias weather="curl -4 http://wttr.in/Nashville"

alias pyman="python manage.py "
alias snek="python manage.py"
alias runsnek="python manage.py runserver"
alias startsnek="django-admin startproject"
alias snekapp="python manage.py startapp"
alias coldsnek="pip freeze > requirements.txt"
alias needsnek="pip install -r requirements.txt"
snekon() {
  source $1/bin/activate
}

cdenv() {
  cd ..
  source $1/bin/activate
  cd -
}

alias snekoff="deactivate"

fakesnek() {
  django_data.sh $1 faker_factory
}

snekremigrate() {
  rm -rf db.sqlite3
  cd $1
  rm -rf migrations
  cd ..
  python manage.py makemigrations $1
  python manage.py migrate
}


alias zshthemes="cd ~/.oh-my-zsh/themes"

alias pyserve="python3 -m http.server --bind 127.0.0.1 8080"

alias find8080="sudo lsof -i:8080"

findport() {
  sudo lsof -i:$1
}

alias apihere="json-server -w database.json -p 8088"

alias reactlive="python ~/python-scripts/react-deployment/deploy-react-to-s3.py"

update_portfolio () {
  nuke build
  npm run build
  aws s3 cp ./build s3://rileymathews.com/ --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
}

update_band_site () {
  nuke build
  npm run build
  aws s3 cp ./build s3://almanacridge.com/ --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
}

update_gamestone () {
  nuke build
  npm run build
  aws s3 cp ./build s3://gamestone.rileymathews.com/ --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
}

update_lesson_ninja() {
  nuke build
  npm run build
  aws s3 cp ./build s3://lesson.ninja/ --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
}

update_tc_proto() {
  nuke build
  npm run build
  aws s3 cp ./build s3://tc-front-end-proto/ --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
}

atomic_rocket () {
  ttab -w _atomic_rocket_helper_1
  ttab -w _atomic_rocket_helper_2
  cd frontend
  ttab -w npm start
}

_atomic_rocket_helper_1 () {
  source env/bin/activate
  cd backend
}

_atomic_rocket_helper_2 () {
  source env/bin/activate
  cd backend
  python manage.py runserver
}

virtual1 () {
  cd ~/.keys
  ssh -i "rileymathews.pem" riley@ec2-35-153-78-244.compute-1.amazonaws.com
}

sendToVirtual1 () {
  scp -i ~/.keys/rileymathews.pem $1 rileye@ec2-35-153-78-244.compute-1.amazonaws.com:~
}

ssh_gamestone_backend() {
  cd ~/.keys
  ssh rileymathews@206.189.229.10
}

findProcess () {
  ps -ax | grep $1
}

#
# Template Aliases
#


#
# terminal config functions
#
buzsh() {
  cd ~/TerminalConfig
  git add .zshrc
  git commit
  git push origin master
  cd -
}

udzsh() {
  cd ~/TerminalConfig
  git pull origin master
  cd -
  zshsource
}

butemp() {
  cd ~/templates
  git add .
  git commit -m "edited templates"
  git push origin master
  cd -
}

udtemp() {
  cd ~/templates
  git pull origin master
  cd -
}


#
# functions
#
convertpic() {
  convert $1 -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace sRGB $1
}

api() {
  ttab -w json-server -p 8088 -w $1
}

apil() {
  gnome-terminal --tab -- json-server -p 8088 -w $1
}

mg() {
  [ -n "$1" ] && mkdir -p "$@" && cd $_;
}

gitupdate() {
  git fetch --all
  git pull origin master
}

gitstart() {
  git init
  git add .
  git commit -m "initial commit"
  git remote add origin $1
  git push origin master
}


simplehtml () {
echo '<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Nashville Software School</title>
  <link rel="stylesheet" href="./'$1'">

</head>

<body>
  <nav></nav>

  <header></header>

  <article>
    <header></header>
    <section></section>
    <footer></footer>
  </article>

  <footer></footer>

  <script src="'$2'"></script>
</body>
</html>' >> index.html

  touch $1
  touch $2
}

simplejquery () {
  echo '<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Nashville Software School</title>
  <link rel="stylesheet" href="./styless.css">

</head>

<body>

  <div id="output"></div>

  <script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script src="main.js"></script>
</body>
</html>' >> index.html

  touch styles.css
  touch main.js
}


RComp () {
  echo "import React, { Component } from 'react'


class $1 extends Component {


    render() {
        return (
            <React.Fragment>

            </React.Fragment>
        )
    }
}

export default $1" >> $1.js
}

#####
# project functions
#####

mdp () {
    mg $1
    mkdir src
    mkdir dist
    copyGitIgnore
    cd src
    copyHTML
    mkdir styles
    cd styles
    copySASS
    cd ..
    mkdir scripts
    touch scripts/main.js
    copyESLint
    copyGrunt
    npm init -y
    npm i -D grunt grunt-browserify grunt-contrib-copy grunt-contrib-uglify-es grunt-contrib-watch grunt-eslint grunt-sass jquery
    cd ..
}

mdpt () {
    mg $1
    mkdir src
    mkdir dist
    copyGitIgnore
    cd src
    copyHTML
    mkdir styles
    cd styles
    copySASS
    cd ..
    mkdir scripts
    touch scripts/main.js
    copyESLint
    copyGrunt
    copyPackage
    npm i
    cd ..
}

mdpb () {
    mg $1
    mkdir src
    mkdir dist
    copyGitIgnore
    cd src
    copyHTMLBootstrap
    mkdir styles
    cd styles
    copySASSBootstrap
    cd ..
    mkdir scripts
    cd scripts
    copyJSBoot
    cd ..
    copyESLint
    copyGrunt
    npm init -y
    npm i -D grunt grunt-browserify grunt-contrib-copy grunt-contrib-uglify-es grunt-contrib-watch grunt-eslint grunt-sass bootstrap jquery popper.js
    cd ..
}

mdpbt () {
    mg $1
    mkdir src
    mkdir dist
    copyGitIgnore
    cd src
    copyHTMLBootstrap
    mkdir styles
    cd styles
    copySASSBootstrap
    cd ..
    mkdir scripts
    copyJSBoot
    copyESLint
    copyGrunt
    copyPackageBootstrap
    npm i
    cd ..
}

ReactBulma () {
  npx create-react-app $1
  cd $1
  npm i bulma --save-dev
  npm i bloomer --save-dev
  npm i node-sass-chokidar --save-dev
  npm i npm-run-all --save-dev
  copyReactLint
  cd src
  mv index.css index.scss
  cd ..
  echo '"build-css": "node-sass-chokidar src/ -o src/",
    "watch-css": "npm run build-css && node-sass-chokidar src/ -o src/ --watch --recursive",
    "start-js": "react-scripts start",
    "start": "npm-run-all -p watch-css start-js",
    "build-js": "react-scripts build",
    "build": "npm-run-all build-css build-js",' | pbcopy
  code package.json
}

rp () {
  cd dist
  ttab -w pyserve
  cd ..
  cd src
  ttab -w grunt
  cd ..
}

rpl () {
  cd dist
  gnome-terminal --tab -- python3 -m http.server --bind 127.0.0.1 8080
  cd ..
  cd src
  gnome-terminal --tab -- grunt
  cd ..
}

react-json-start () {
  cd api
  api database.json
  cd ../app
  ttab -w npm start
}


#Auto jump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh



# __________________________
# Template functions
# __________________________

copySASS() {
    cp ~/templates/styles/_01base.scss ./_01base.scss
    cp ~/templates/styles/_02mixins.scss ./_02mixins.scss
    cp ~/templates/styles/_03variables.scss ./_03variables.scss
    cp ~/templates/styles/_04defaults.scss ./_04defaults.scss
    cp ~/templates/styles/_05grid-layout.scss ./_05grid-layout.scss
    cp ~/templates/styles/_06media-queries.scss ./_06media-queries.scss
    cp ~/templates/styles/styles.scss ./styles.scss
}

copySASSBootstrap() {
    cp ~/templates/bootstrap-styles/_02mixins.scss ./_02mixins.scss
    cp ~/templates/bootstrap-styles/_03variables.scss ./_03variables.scss
    cp ~/templates/bootstrap-styles/_04defaults.scss ./_04defaults.scss
    cp ~/templates/bootstrap-styles/_05grid-layout.scss ./_05grid-layout.scss
    cp ~/templates/bootstrap-styles/_06media-queries.scss ./_06media-queries.scss
    cp ~/templates/bootstrap-styles/styles.scss ./styles.scss
}

copyHTML() {
    cp ~/templates/html/indexTemplate.html ./index.html
}

copyHTMLBootstrap() {
    cp ~/templates/html/bootstrapIndex.html ./index.html
}

copyGrunt() {
    cp ~/templates/grunt/Gruntfile.js ./Gruntfile.js
}

copyESLint() {
    cp ~/templates/eslint/.eslintrc ./.eslintrc
}

copyGitIgnore() {
    cp ~/templates/git/.gitignore ./.gitignore
}

copyDjangoGitIgnore() {
    cp ~/templates/git/django-gitignore.gitignore ./.gitignore
}

copyPackage() {
  cp ~/templates/npm/package.json ./package.json
}

copyPackageBootstrap() {
  cp ~/templates/npm/packageBootstrap.json ./package.json
}

copyFavicon() {
  cp ~/templates/favicon/favicon.ico ./favicon.ico
}

copyJSBoot() {
  cp ~/templates/javascript/main.js ./main.js
}

copyReactLint() {
  cp ~/templates/eslint/ReactESLint ./.eslintrc
}




#####################
####HELP FUNCTION####
#####################

help () {
  echo _______________________________________________________
  echo ___________________aliases and functions_______________
  echo _______________________________________________________
  echo api_____________________________serves json api on port 8088
  echo pyserve_________________________serves a python http server on port 8080
  echo pyman___________________________alias for python manage.py
  echo find8080________________________finds the process currently using port 8080
  echo findProcess_____________________finds process of the name passed to it
  echo nuke____________________________Remove file or directory
  echo gpom____________________________git push origin master
  echo gpum____________________________git push upstream master
  echo gs______________________________git status
  echo gc______________________________git checkout
  echo gcb_____________________________git checkout -b
  echo gpo_____________________________git push origin
  echo gpu_____________________________git push upstream
  echo gcm_____________________________git commit -m
  echo gcma____________________________git commit -a -m
  echo gpm_____________________________prunes all local branches that have been merged to master
  echo hookup__________________________git remote add origin
  echo hs______________________________start http server
  echo golive__________________________start ngrok server on port 8080
  echo zshconfig_______________________open up zshrc with code
  echo zshsource_______________________source zsh file
  echo mg______________________________make and goto directory
  echo gitupdate_______________________git fetch all and pull master
  echo gitstart________________________starts git repo locally and pushes to provided remote
  echo simplehtml______________________start a simple html project with provided styles and js file
  echo simplejquery____________________start a simple html project with jquery tag included
  echo RComp___________________________creates a react component template file
  echo mdp_____________________________make new distributable project
  echo mdpb____________________________make new distributable project with bootstrap
  echo mdpt____________________________make new distributable project with template package file as of May 8, 2018
  echo mdpbt___________________________make new distributable project with bootstrap and template package file as of May 8, 2018
  echo rp______________________________open up two new terminal windows with http server and grunt running
  echo rpl_____________________________same command as above but modified to work with linux terminal
  echo react-json-start________________resumes react project with json server
  echo buzsh___________________________commits and pushes zshrc file to github
  echo udzsh___________________________updates zshrc file from github
  echo butemp__________________________push up templates to github
  echo udtemp__________________________updates templates from github
  echo _______________________________________________________
  echo _______________________________________________________
  echo Copy functions
  echo copySASS
  echo copySASSBootstrap
  echo copyHTML
  echo copyGrunt
  echo copyESLint
  echo copyGitIgnore
  echo copyHTMLBootstrap
  echo copyReactLint
}

help-js() {
  echo simplehtml______________________start a simple html project with provided styles and js file
  echo simplejquery____________________start a simple html project with jquery tag included
  echo RComp___________________________creates a react component template file
  echo mdp_____________________________make new distributable project
  echo mdpb____________________________make new distributable project with bootstrap
  echo mdpt____________________________make new distributable project with template package file as of May 8, 2018
  echo mdpbt___________________________make new distributable project with bootstrap and template package file as of May 8, 2018
  echo rp______________________________open up two new terminal windows with http server and grunt running
  echo rpl_____________________________same command as above but modified to work with linux terminal
  echo react-json-start________________resumes react project with json server
}

help-copy() {
  echo copySASSBootstrap
  echo copyHTML
  echo copyGrunt
  echo copyESLint
  echo copyGitIgnore
  echo copyHTMLBootstrap
  echo copyReactLint
}

help-git() {
  echo gpom____________________________git push origin master
  echo gpum____________________________git push upstream master
  echo gs______________________________git status
  echo gc______________________________git checkout
  echo gcb_____________________________git checkout -b
  echo gpo_____________________________git push origin
  echo gpu_____________________________git push upstream
  echo gcm_____________________________git commit -m
  echo gcma____________________________git commit -a -m
  echo gpm_____________________________prunes all local branches that have been merged to master
  echo hookup__________________________git remote add origin
  echo gitupdate_______________________git fetch all and pull master
  echo gitstart________________________starts git repo locally and pushes to provided remote
}

help-deployment () {
  echo update_portfolio_____________updates portfolio site
  echo update_band_site_____________updates band site
}

help-python () {
  echo _______________________________________________________________
  echo _______________________python aliases__________________________
  echo _______________________________________________________________
  echo pyman/snek_____________________________python manage.py
  echo runsnek________________________________python manage.py runserver
  echo startsnek______________________________django-admin startproject
  echo snekapp________________________________python manage.py startapp
  echo snekremigrate__________________________takes 1 argument of app name, nukes database and migrations and reruns them
  echo snekon_________________________________takes arguemnt of env name and sources it
  echo cdenv__________________________________same as above but is run from child directory
  echo newenv_________________________________creates a new python virtual environment
}

help-aws () {
  echo aws s3 cp ./build s3://bucket-name.com/ --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
}

help-rest() {
  echo 1. create class that is model of data in models.py
  echo 2. create a serializer that uses that model and displays its fields in serializers.py
  echo 3. in views.py create view using model and serializer
  echo 4. in urls.py register the view in a url
}

help-docker() {
  echo docker images_________________________________shows a list of all available images
  echo docker busybox________________________________a test image that runs the sent command and then exits
  echo docker ps_____________________________________lists the running docker instances
  echo docker ps -a__________________________________detailed list
  echo docker run -it [busybox] sh___________________runs instance and puts your terminal into it
  echo docker rm $(docker ps -a -q -f status=exited)_quits all exited docker instances
}

help-postgres() {
  echo brew services start postgresql__________________________starts postgres as a service that will start up on login
  echo brew services stop postgresql___________________________stops postgres
  echo brew services run postgresql____________________________runs postgres but will not launch on startup
}

help-ssh() {
  echo ssh_gamestone_backend______________________________jumps into server for gamestones api
}


# aws es2
export PATH=$PATH:$HOME/.local/bin

# mysql
export e PATH=$PATH:/usr/local/mysql/bin
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. $HOME/.asdf/asdf.sh
