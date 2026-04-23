## AWS VPC MODULE
This module is used by joindevops company. Projects inside joindevops follow this module to create vpc.

## Inputs
* cidr_block(Optional) - User can provide their cidr_block. Default is "10.0.0.0/16"

* project(Required) - User should specify their project name.

* environment(Required) - User should specify the environment they are using for.

* igw_tags(Optional) - User can provide the igw tags, If they needed.

## Outputs
* vpc_id - Provides the ID of vpc created using this module.