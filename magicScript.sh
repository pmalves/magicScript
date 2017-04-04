#!/bin/bash

###############################################################################
# 
# Welcome to the Magic Script. The script that does Magic!
#
# The goal of the project is to make install and configure the Pentaho VM
# with the extra goodies that will make.
#
# In order to launch it, the VM calls:
#
# $ source <( curl https://raw.githubusercontent.com/pmalves/magicScript/master/magicScript.sh  )

#
# Author: Pedro Alves
# License: Whatever... Apache2 if I have to pick one
#
###############################################################################
# Executed from within the Pentaho VM:
#
# #


cat <<EOF

About to run the magic script (tm). The script that does magic!

EOF




BASEDIR=$(dirname $0)
cd $BASEDIR


TMPDIR=/root/magicScriptTmp


# Do we have a temp dir? Wipe it out!
if [ -d $TMPDIR ]; then
	rm -rf $TMPDIR
fi

# and start!
mkdir $TMPDIR


echo -e '\n\nStep 1: Installing a few extra packages to the operating system...'


# Install some stuff we need
apt-get update > $TMPDIR/step1.log 2>&1 && apt-get install -y \
	evince medit wget unzip >> $TMPDIR/step1.log 2>&1


echo -e '\n\nStep 2: Downloading SQuirreL. This may take a few minutes...'


# Download squirrel

wget 'https://sourceforge.net/projects/squirrel-sql/files/1-stable/3.7.1-plainzip/squirrelsql-3.7.1-standard.zip/download' -O $TMPDIR/squirrelsql-3.7.1-standard.zip -o $TMPDIR/step2.log


echo -e '\n\nStep 3: Installing and configuring SQuirreL...'

# Install it
unzip -o $TMPDIR/squirrelsql-3.7.1-standard.zip -d /opt >> $TMPDIR/step3.log 2>&1
chmod +x /opt/squirrelsql-3.7.1-standard/*sh



