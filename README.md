# knife-del-atrribute

A plugin for Chef::Knife which will delete normal attributes of your nodes.

## Usage 

Supply nested attributes and the 'recursive' token if you like a recursive delete.

```
% knife set_attribute node_name attribute.sub_attribute recursive

% knife set_attribute node_name attribute.sub_attribute 

```

## Installation

#### Script install


Copy the knife-del-attribute script from del_attribute.rb to your ~/.chef/plugins/knife directory.

```
$ git clone git@github.com:amian84/knife-del-attribute.git
$ mkdir -p ~/.chef/plugins/knife/
$ cp knife-del-attribute/del_attribute.rb ~/.chef/plugins/knife/

```

