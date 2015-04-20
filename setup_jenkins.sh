set -e
useradd jenkins #to get a uid>1000, so we can graphically login and run 
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/>>/etc/apt/sources.list
sudo apt-get --yes --force-yes update
sudo apt-get --yes --force-yes install jenkins

/etc/init.d/jenkins stop
sed -i -e 's^/var/lib/jenkins^/home/jenkins^' /etc/passwd 
sed -i -e '/JENKINS_HOME/ s^/var/lib/^/home/^' /etc/default/jenkins
sed -i -e 's/8080/9000/' /etc/default/jenkins
rm -rvf /home/jenkins/
mkdir /home/jenkins
chown -R jenkins /home/jenkins
sudo -u jenkins git clone https://github.com/slspeek/fspotcloud.jenkins.git /home/jenkins
/etc/init.d/jenkins restart
