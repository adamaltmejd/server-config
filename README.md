# Adam Altmejd's Server configuration

## Installation
* Clone this repository in the home folder.
* Install zsh, set it to default shell, log out, and in again
* Run setup.sh

# GPG signing
To get gpg agent forwarding to work the following steps need to be taken:
* Set "StreamLocalBindUnlink yes" in /etc/ssh/sshd_config
* Copy public key: scp .gnupg/pubring.kbx <host>:~/.gnupg/
* Get remote socket by running: gpgconf --list-dirs agent-socket
* Get local extra socket (to be forwarded): gpgconf --list-dirs agent-extra-socket
* Add forwarding to host in ssh config: RemoteForward <remote socket> <local extra socket>
