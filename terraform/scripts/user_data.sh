
#!/bin/bash
# Update the package index
yum update -y

# Install AWS CLI
yum install aws-cli -y

# Install jq
yum install jq -y

# Install Python 3.13
yum install gcc openssl-devel bzip2-devel libffi-devel -y
cd /usr/src
wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz
tar xzf Python-3.13.0.tgz
cd Python-3.13.0
./configure --enable-optimizations
make altinstall

# Verify installations
python3.13 --version
aws --version
jq --version
    