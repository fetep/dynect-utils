# dynect-utils

This is a set of utilities that use the
[DynECT](http://dyn.com/dns/dynect-managed-dns/) REST API to help
monitor and manage the service.

## Nagios plugin: check_dynect_gslb_region

Checks the health-check status of the addresses in a GSLB region's pool.

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

## Utility: dynect_gslb_manage

Drains/undrains a specific address in a GSLB region's pool.

Usage:

    Usage: dynect_gslb_manage [options] command [command opts]

    Possible sub-commands:

      list
        List all GSLB IPs

      drain <address|label>
        Set the serving mode to "no" for a GSLB address, identified by IP
        address or label.

      undrain <address|label>
        Set the serving mode to "obey" for a GSLB address, identified by IP
        address or label.

    Main options:

      --customer, -c <s>:   Dynect customer name
          --user, -u <s>:   Dynect user name
          --pass, -p <s>:   Dynect password
          --zone, -z <s>:   Zone name
        --record, -r <s>:   GSLB record name
        --region, -R <s>:   GSLB region (default: global)
              --help, -h:   Show this message

Example output:

    $ dynect_gslb_manage -c Customer -u user -p pass123 -z example.org -r foo.example.org list
    foo-backend-1 | 1.2.3.4 | status=up | weight=1 | serve_mode=obey
    foo-backend-2 | 1.2.3.5 | status=up | weight=1 | serve_mode=obey

    $ dynect_gslb_manage -c Customer -u user -p pass123 -z example.org -r foo.example.org drain foo-backend-1
    1.2.3.4 serve_mode changed from obey to no

    $ dynect_gslb_manage -c Customer -u user -p pass123 -z example.org -r foo.example.org undrain foo-backend-1
    1.2.3.4 serve_mode changed from no to obey
