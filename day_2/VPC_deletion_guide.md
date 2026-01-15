**Follow these steps to delete your current VPC:**
- If app instances and database instances are currently running, stop the instances before terminating them
- Remove the security groups in the VPC next
- The VPC can now be removed, as the components within the VPC will also be removed. 
  These components are:
  - Internet gateway
  - Public route table
  - Public subnet
  - Private subnet
