mkdir -p /srv/docker/verdaccio/conf && mkdir -p /srv/docker/verdaccio/storage && mkdir -p /srv/docker/verdaccio/local_storage
chcon -Rt svirt_sandbox_file_t /srv/docker/verdaccio

docker build -t docker.vemic.com/xyz_dev/verdaccio:2.4.0 --build-arg NODE_ENV=production .

docker run -itd --name npmreg -p 80:4873 \
  -v /srv/docker/verdaccio/:/verdaccio/ \
  verdaccio/verdaccio:2.4.0
  
docker push docker.vemic.com/xyz_dev/verdaccio:2.4.0
