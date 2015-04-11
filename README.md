Mdi::BagValidator
=================

## Overview

This is an experimental [BagIt](https://tools.ietf.org/html/draft-kunze-bagit-06) "worker" gem that:
* subscribes to a queue on a [RabbitMQ](https://www.rabbitmq.com/) message broker
* dequeues a message
* executes the validation operation
* publishes the results to a topic exchange


## Status
#### IN DEVELOPMENT
Currently walking through [this](https://github.com/jondot/sneakers/wiki/How-to:-running-a-stand-alone-worker) tutorial.
N.B. This code is a ROUGH PROOF OF CONCEPT! There is no test suite. You have been warned. Have a nice day :) .


## Setup
I use [rvm](https://rvm.io/), so this is my approach:
```
$ cd /path/to/mdi-bag_validator
$ rvm use 2.2
$ rvm --ruby-version gemset use mdi-bag_validator --create
$ bundle
```


## Usage
#### bag validator workers
```
$ pwd
/path/to/mdi-bag_validator
$ export MDI_EXECUTABLE='/your/path/to/your/bag/validator/cmd with-options'
$ export MDI_SERVICE_NAME='my_cool_service'
$ export AMQP_URL='amqp://your.broker.example.com'
$ nohup foreman start > log/mdi-bag_validator.log &


e.g.,   $ export MDI_EXECUTABLE='/usr/local/loc-xfer/bin/bag verifyvalid'
        $ export MDI_SERVICE_NAME='bag_validation'

```

#### logger
```
$ pwd
/path/to/mdi-bag_validator
$ export AMQP_HOST='your.broker.example.com'
$ nohup ./bin/mdi-logger > log/mdi-logger.log &
```

#### bag validation message producer
```
$ pwd
/path/to/mdi-bag_validator
$ export AMQP_HOST='your.broker.example.com'
$ ./bin/mdi-validate_bag /path/to/bag/root
```
