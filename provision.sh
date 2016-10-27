# install erlang, elixir
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get install -y elixir

# install node, npm
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs npm
