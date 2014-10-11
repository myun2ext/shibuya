# From OS
FROM  centos

# Use EPEL
RUN   yum install -y wget
RUN   wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN   rpm -Uvh epel-release-6*.rpm

# Install pckages
RUN   yum update -y
RUN   yum install -y gcc g++
RUN   yum install -y --skip-broken nginx

# Install Rbenv
RUN   yum install -y git
#RUN   gem install bundle
#RUN   git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
#RUN   echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
#RUN   echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
#RUN   exec $SHELL -l
#RUN   git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#RUN   rbenv install 2.1.0

#RUN   yum install -y openssl-devel
#RUN   yum install -y gem
#RUN   yum install -y ruby-devel

# Run Application
#CMD   ruby app.rb
