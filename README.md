# dynect-utils

This is a set of utilities that use the
[DynECT](http://dyn.com/dns/dynect-managed-dns/) REST API to help
monitor and manage the service.

## Nagios plugin: check_dynect_gslb_region

Usage:

    Options:
      --customer, -c <s>:   Dynect customer name
          --user, -u <s>:   Dynect user name
          --pass, -p <s>:   Dynect password
          --zone, -z <s>:   Zone name
        --record, -r <s>:   GSLB record name
        --region, -R <s>:   GSLB region (default: global)
              --help, -h:   Show this message

Example output:

    $ check_dynect_gslb_region -c Customer -u user -p pass123 -z example.org -r foo.example.org
    OK: all GSLB addresses are healthy

    $ check_dynect_gslb_region -c Customer -u user -p pass123 -z example.org -r bar.example.org
    CRITICAL: GSLB addresses unhealthy: 1.2.3.4=down
