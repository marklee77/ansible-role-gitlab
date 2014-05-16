Role Name
========

The purpose of this role is to install gitlab to a web server and enable access
with nginx. This install uses the MySQL backend rather than Postgres. The gitlab
server name can be specified by changing the gitlab_hostname variable in
vars/main.yml.

This has only been trusted on Ubuntu trusty. It will not work as-is on precise
as gitlab requires ruby 1.9 and precise uses ruby 1.8 as the system binary.

Role Variables
--------------

- gitlab_hostname: hostname that gitlab will service, will be set to "gitlab" by
                   default
- gitlab_port: hostname that gitlab will service, will be set to 8888 by 
               default.
- gitlab_root_mysql_password: root mysql password, will be set to a random value 
                              by default.
- gitlab_git_mysql_password: git mysql password, will be set to a random value 
                             by default

Example Playbook
-------------------------

Including an example of how to use your role (for instance, with variables 
passed in as parameters) is always nice for users too:

    - hosts: default
      sudo: True
      roles:
        - gitlab

Try it Out
---------------------------

Check out the github repository, vagrant up, and load http://localhost:8888 in
your web browser.

License
-------

Affero GPL

Author Information
------------------

http://marklee77.github.io

