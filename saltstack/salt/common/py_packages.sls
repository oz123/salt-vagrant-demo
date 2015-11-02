{% if grains['os'] == 'CentOS' %}
 {% set piploc = '/usr/bin/pip' %}
{% elif grains['os'] == 'Ubuntu' %}
 {% set piploc = '/usr/local/bin/pip' %}
{% endif %}

{% if not salt['file.file_exists'](piploc) %}

get_pip:
 file.managed:
  - name: /tmp/get-pip.py
  - source: salt://common/get-pip.py
  - mode: 755

 cmd.run:
  - name: /tmp/get-pip.py

clean_up:
 cmd.run:
  - name: rm /tmp/get-pip.py 

{% endif %}

{% for pkgname in ['django == 1.8.0', 'colorama', 'flask']%}
install_{{ pkgname }}:
 pip.installed:
  - name: {{ pkgname }}
{% endfor %}
