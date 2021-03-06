marklee77.gitlab
================

The purpose of this role is to install gitlab to a web server and enable access
with nginx. This install uses the MySQL backend rather than Postgres. The gitlab
server name can be specified by changing the gitlab_hostname variable in
vars/main.yml.

This has only been trusted on Ubuntu trusty. It will not work as-is on precise
as gitlab requires ruby 1.9 and precise uses ruby 1.8 as the system binary.
Thus, this role is not currently being tested with travis.

Role Dependencies
-----------------

- marklee77.modules-extra

Role Variables
--------------

- gitlab_mysql_host: localhost

- gitlab_root_mysql_password: root mysql password
- gitlab_git_mysql_password: git mysql password, will be set to a random value 
                             by default
- gitlab_hostname: hostname that gitlab will service, will be set to "localhost" by
                   default


- gitlab_checkout_version: 7-1-stable

- gitlab_ssh_hostname: "{{ gitlab_hostname }}"
- gitlab_ssh_port: 22
- gitlab_http_port: 80
- gitlab_https_port: 443
- gitlab_enable_ssl: true
- gitlab_require_ssl: true

- gitlab_ssl_cert_file: 
- gitlab_ssl_key_file: 


- gitlab_admin_email: "git@localhost.localdomain"
- gitlab_admin_name: Administrator
- gitlab_admin_username: root
- gitlab_admin_password: password
- gitlab_admin_theme_id: "Gitlab::Theme::MARS"

- gitlab_signup_enabled: false

Example Playbook
-------------------------

    - hosts: all
      sudo: True
      roles:
        - marklee77.mariadb
        - marklee77.gitlab

Try it Out
---------------------------

Check out the github repository, vagrant up, and load http://localhost:8080 in
your web browser.

License
-------

GPLv2

Author Information
------------------

http://stillwell.me

Todo
----
- use redis from official container, move into prep...
