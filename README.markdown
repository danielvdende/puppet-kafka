#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with puppet-kafka](#setup)
    * [What puppet-kafka affects](#what-puppet-kafka-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppet-kafka](#beginning-with-puppet_kafka)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Unofficial module for install and managing Apache Kafka. Detached fork of
chartbeat-labs' [module](https://github.com/chartbeat-labs/puppet-confluent-kafka).
Default installation of Confluent's distribution of Kafka is enabled.

## Module Description

Module that manages the installation and configuration of Apache Kafka (default to Confluent's distribution of Kafka).
Currently only supports brokers.

## Setup

### What puppet-kafka affects

* Installs Kafka package, service and Java if specified

### Beginning with puppet-kafka
Two parameters, `broker_id` and `zookeeper_connect` are required. Full documentation
of all parameters that can be passed can be found in [`kafka::params`]
```puppet
    class { 'kafka':
      broker_id       => 1,
      zookeer_connect => 'localhost:2181'
    }
```

## Usage

###Classes

####Class: `kafka`
Main class for the module, will install the package

## Reference

###Classes
####Public Classes
 * [`kafka`]

####Private Classes
 * [`kafka::config`]
 * [`kafka::install`]
 * [`kafka::service`]
 * [`kafka::params`]
 * [`kafka::repo`]

## Limitations
This module is tested on the following platforms:

 * CentOS/RHEL 6
 *
