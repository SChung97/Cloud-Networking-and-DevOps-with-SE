# Introduction to cloud networking

IAM permissions - identity and access management

- least privilege (assign specific privileges when necessary - keeping permissions granular)

**VPCs:**

- virtual private cloud - a secure, isolated private cloud hosted remotely within a public cloud
- AWS allows for the use of the default VPC to create instances
- an isolated network within a public cloud provider
- allows for greater control:- IP ranges, DNS, subnets, routing, security etc
- most similar to having on-prem data centre in AWS region
- IaaS (infrastructure as a service)

**IP addresses:**

- public ip: reachable from the internet
- private: internal-only, not publicly routable

- IPv4: 32bit, limited address space
- IPv6: 128 bit

- CIDRs - classless inter domain routing
- ranges of available IP addresses - this decides the number of instances that can be available
- will have own VPC, and sub networks (each sub network will have its own CIDR)
- the CIDR from VPC must be the largest, as it must store all the sub networks
- defined as 10.0.0.0/16

**Subnets:**

- subnetworks
- public vs private

- public subnets allow direct routes too the internet
- private subnets normally used for databases, can't directly access the internet

**Gateways:**
- facilitate communication with other networks
internet gateway
NAT gateway

**Route tables:**

- flow of traffic

**SGs and NACLs:**

- security groups and ...

**terraform:**

- turning linking of entire vpc into a single script to be used on AWS
- makes it easier to create resources, or to delete them
