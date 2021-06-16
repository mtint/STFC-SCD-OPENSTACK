Management Network VPN Gateway 
===============================

Access to the private management network is via the host `manvpn1.gridpp.rl.ac.uk` which can be used either as an SSH gateway, or can be connected to via the [OpenVPN](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPN) service. Only the Fabric Team should make changes to this system.

As of July 2020, `manvpn1` is slated for decommissioning and replacement by `manvpn2`. A DNS CNAME for `manvpn.gridpp.rl.ac.uk` has been created to remove the need to update clients in future.

Responsibility for the service is assigned to Rob Johnson and Rob Harper.

Server Certificate 
-------------------

The [OpenVPN](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPN) service needs a host certificate, which is deployed in the usual `/etc/grid-security/` directory. When a new certificate is deployed, the service needs to be restarted.

In addition, the server consults a Certificate Revocation List. This is refreshed automatically at 2AM every day by cron job. On connection, [OpenVPN](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPN) checks the list for revoked certificates and will not allow connections to those on the CRL. Therefore, if people leave STFC, the most effective course of action is to revoke their X.509 certificate and they will be locked out of all relevant systems.

Adding Users 
-------------

Each user permitted to access the service needs to have a file in the directory `/etc/openvpn/ccd/` which is an empty file with a name matching the CN in the certificate used by the user (which is their name in lowercase). They also require a valid X.509 certificate.

Additional Services 
--------------------

The VPN server also acts as the management network NTP server, with a separate IP address (10.0.1.10). Devices should query the server no more often than once per 24 hours.

The VPN server will push a list of routes (10.0.0.0/13) and DNS to the client.

Connecting to [OpenVPN](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPN) Service 
-----------------------------------------------------------------------------------------------------------

Note that the server you should connect to is now `manvpn.gridpp.rl.ac.uk`

In addition to certificate authentication, a TLS authentication key is required to initiate a connection to the replacement `manvpn2` server. [LDAP](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/LDAP) authentication is planned but not yet implemented.

1. Download the 'T1ManagementVPN.ovpn' file from this page, which is a plain text configuration file, and the 'tls.key' file, which is a TLS encryption key. Note the above - the tls.key file is required to initiate a connection.
2. Place the config file in a sensible folder and edit it with your preferred editor. Replace the \<bracketed\> placeholders for the following files with their correct paths, either absolute or relative to the configuration file

  * ca (Certificate Authority)
  * cert + key (for individual pulic and private X.509 certificate files) OR pkcs12 (for a combined file)
  * priv (File containing password for your X.509 certificate, or blank to ask every time)
3. Follow the relevant link below to configure for your OS:

* [OpenVPN for Mac clients](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPNMac)
* [OpenVPN via NetworkManager for \*nix clients](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPNNetworkManager)
* [OpenVPN for Windows clients](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPNWindows)

Converting from SL6 (manvpn1) 
------------------------------

**Prerequisites:**

* [OpenVPN](https://wiki.e-science.cclrc.ac.uk/web1/bin/view/EScienceInternal/OpenVPN) v2.4 or higher
* CA certificate chain containing root and 2B UK eScience CA certificates concatenated together (from [here![](resources/670FA0274CBDD1C83D5DF5075BCA1A2D.gif)](https://ca.grid-support.ac.uk/cacerts/)) - the CA chain contained within the X.509 certificate does not seem to work

1. Download tls.key from this page and save it in the same place as your existing .ovpn configuration file.
2. Modify the `ca` directive to point to the CA chain file (if not using already)
3. Append the following lines to your existing configuration file:

    tls-auth tls.key 1

    cipher AES-256-GCM
    auth SHA256
    keysize 256