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


## Usage
#### bag validator workers
```
$ pwd
/path/to/mdi-bag_validator
$ export BAG_EXECUTABLE='/your/path/to/your/bag/validator/cmd with-options'
$ export AMQP_URL='amqp://your.broker.example.com'
$ nohup foreman start > log/mdi-bag_validator.log &


e.g.,   $ export BAG_EXECUTABLE='/usr/local/loc-xfer/bin/bag verifyvalid'

```

#### logger
```
$ pwd
/path/to/mdi-bag_validator
$ export MB_REMOTE_HOST='your.broker.example.com'
$ nohup ./bin/mdi-logger > log/mdi-logger.log &
```

#### bag validation message producer
```
$ export MB_REMOTE_HOST='your.broker.example.com'
$ ./bin/mdi-validate_bag /path/to/bag/root
```
