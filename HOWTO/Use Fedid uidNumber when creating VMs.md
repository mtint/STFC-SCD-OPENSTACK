[sssd]

services = nss, pam

domains = FED.CCLRC.AC.UK

debug\_level = 10

[nss]

override\_homedir = /home/%u

default\_shell = /bin/bash

[pam]

[domain/FED.CCLRC.AC.UK]

debug\_level = 10

\#cache\_credentials = FALSE

ldap\_referrals = false

id\_provider = ldap

chpass\_provider = ldap

auth\_provider = krb5

krb5\_realm = FED.CCLRC.AC.UK

krb5\_server = FED.CCLRC.AC.UK

krb5\_ccname\_template = FILE:%d/krb5cc\_%U

ldap\_schema = ad

ldap\_uri = [ldaps://fed.cclrc.ac.uk/]

ldap\_search\_base = dc=FED,dc=CCLRC,dc=AC,dc=UK

ldap\_tls\_reqcert = never

\#ldap\_tls\_cacert = /etc/openldap/cacerts/d9e1102c.0

ldap\_id\_use\_start\_tls = true

ldap\_user\_search\_base = DC=FED,DC=CCLRC,DC=AC,DC=UK

ldap\_group\_search\_base = OU=Facilities,DC=fed,DC=cclrc,DC=ac,DC=uk

ldap\_user\_object\_class = user

ldap\_user\_modify\_timestamp = whenChanged

ldap\_user\_home\_directory = unixHomeDirectory

ldap\_user\_name = sAMAccountName

ldap\_user\_shell = loginShell

ldap\_user\_uid\_number = uidNumber

ldap\_user\_gid\_number = gidNumber

ldap\_user\_principal = nosuchattr

ldap\_group\_object\_class = group

ldap\_group\_modify\_timestamp = whenChanged

ldap\_group\_name = name

ldap\_group\_gid\_number = gidNumber