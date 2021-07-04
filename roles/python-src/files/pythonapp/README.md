# pythonapp
pythonapp

docker build --network=host -t tbbpython .
docker volume create mysql_volume
docker network create -d bridge mynet
docker run --network=mynet -d -h=mydb --name=mydb -e MYSQL_ROOT_PASSWORD=12345 -p 3306:3306 -v mysql_volume:/var/lib/mysql mysql
docker run --network=mynet -d -h=myapp --name=myapp -p 5001:5001 tbbpython
