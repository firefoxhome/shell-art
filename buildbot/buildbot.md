# Buildbot Automate compiling system

## Source clone

	git clone https://github.com/buildbot/buildbot.git
	cd buildbot
	git checkout v0.8.12 -b v0.8.12

## Install

	Prepare the environment
	Install master and slave

	Just install them like python packages.

## Create master and slave

	buildbot create-master mastername
	buildslave create-slave slavename localhost:port example-slave pass

## Configuration example

	master configuration (from master.cfg)
	slave configration (from buildbot.tac)

## Master

	 buildbot start mastername
	 buildbot stop mastername

## Slave

	buildslave start slavename
	buildslave stop slavename
