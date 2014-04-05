
# .bashrc for user and for root:
alias ll="ls -al"
set -o vi

#source /etc/profile.d/rvm.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=/usr/local/rvm/bin:$PATH

#export PATH=/usr/local/rvm/rubies/ruby-2.1.0/bin:$PATH
#/usr/local/rvm/rubies/ruby-2.1.0/bin/gem install rails"

echo PATH=$PATH


