
TAG=mjbright/docker-mooc-coursera-waa
TAG=mine/mooc


CMD="rvm rails console"
CMD="mkdir -p /var/run/sshd/;chmod 755 /var/run/sshd/; /etc/init.d/ssh start; mkdir app1; rails new app1; cd app1; rails server"
CMD="/etc/init.d/ssh start; mkdir app1; rails new app1; cd app1; rails server"
CMD="/etc/init.d/ssh start; bash"
[ ! -z "$1" ] && CMD="$1"

#MOUNT="-v /home/user:/home/mjb/DOCKER/WAA"
MOUNT="-v /home/mjb/DOCKER/WAA:/home/user"
SSH_PORT=2222
PORTS="-p $SSH_PORT:22 -p 3000:3000"

echo
echo "SSH listening on port $SSH_PORT"
echo "Rails listening on port 3000"
echo
echo "You may want to change the ssh 'user' password"
echo
echo "docker run -i -t $PORTS $MOUNT $TAG bash -lc "$CMD""
exit 0
set -x
docker run -i -t $PORTS $MOUNT $TAG bash -lc "$CMD"



