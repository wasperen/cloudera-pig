# cloudera-pig
Create Docker volumes for Cloudera with Apache pig

The ``build.sh`` script in this repo generates Docker images for Cloudera CDH and then compiles Apache pig against them.

Current CDH versions used are 5.7.0 and 5.8.3. Pig versions are 0.15 and 0.16

Pig is installed at ``/opt/pig-<version>`` and pushed into a Docker volume named ``opt-cdh-<cdh version>-pig-<pig version>``
