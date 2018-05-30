# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/rileymathews/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="riley"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect


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
alias gpo="git push origin "
alias gpu="git push upstream "
alias gcm="git commit -m"
alias gcma="git commit -a -m"
alias hookup="git remote add origin"

#
# Custom Aliases
#
alias hs="http-server"
alias golive="~/ngrok http 8080"


alias zshthemes="cd ~/.oh-my-zsh/themes"

alias pyserve="python3 -m http.server --bind 127.0.0.1 8080"

alias find8080="sudo lsof -i:8080"

#
# Template Aliases
#


#
# terminal config functions
#
buzsh() {
  cd ~/TerminalConfig
  git add .zshrc
  git commit -m "edited zshrc"
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


reactComponent () {
  echo "import React, { Component } from 'react'


class $1 extends Component {


    render() {
        return (
        
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
  echo find8080________________________finds the process currently using port 8080
  echo nuke____________________________Remove file or directory
  echo gpom____________________________git push origin master
  echo gpum____________________________git push upstream master
  echo gs______________________________git status
  echo gc______________________________git checkout 
  echo gpo_____________________________git push origin 
  echo gpu_____________________________git push upstream 
  echo gcm_____________________________git commit -m
  echo gcma____________________________git commit -a -m
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
  echo mdp_____________________________make new distributable project
  echo mdpb____________________________make new distributable project with bootstrap
  echo mdpt____________________________make new distributable project with template package file as of May 8, 2018
  echo mdpbt___________________________make new distributable project with bootstrap and template package file as of May 8, 2018
  echo rp______________________________open up two new terminal windows with http server and grunt running
  echo rpl_____________________________same command as above but modified to work with linux terminal
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