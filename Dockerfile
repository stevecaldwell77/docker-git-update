FROM scaldwell/perl-5.16.3

ADD ./git-ssh /var/local/bin/git-update-ssh
ENV GIT_SSH /var/local/bin/git-update-ssh

RUN apt-get -y install git \
  && cpanm Getopt::Long IPC::System::Simple \
  && ([ -f /var/local/git-update-id_rsa ] || ssh-keygen -q -N '' -t rsa -f /var/local/git-update-id_rsa)

ADD ./git-update /var/local/bin/git-update
