
TAG=mjbright/docker-mooc-coursera-waa
TAG=mine/mooc

cd /home/mjb/src/git/mjbright/DockerMOOCCourseraWAA

time docker build -t $TAG .
echo "Image build with TAG $TAG"
#echo "Run it with:"
#echo "  docker run -i -t $TAG"
echo "Run it via: launchRailsDocker.sh"


