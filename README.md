<!-- Automatically generated from uuns.1. -->

uuns(8) - System Manager's Manual

# NAME

**uuns** - create unprivileged user namespaces

# SYNOPSIS

**uuns**
\[*command*]

# DESCRIPTION

The
**uuns**
command creates an unprivileged user namespace.

The
**uuns**
utility is designed to work on Alpine Linux's hardened kernel by using
file capabilities to elevate privileges when calling
unshare(2).
It is otherwise equivalent to invoking
'unshare --user'.

# SEE ALSO

unshare(1),
unshare(2),
capabilities(7),
user\_namespaces(7)

# CAVEATS

The
**uuns**
binary should have execute permission restricted to trusted users.
As a security measure, the Alpine Linux kernel restricts the creation
of user namespaces to threads with the
capabilities(7)
`CAP_SYS_ADMIN`,
`CAP_SETUID`
and
`CAP_SETGID`.
Allowing all users to execute
**uuns**
would effectively bypass that restriction.

Typically,
**uuns**
is installed with the group
'uuns'
and made executable only by that group.
The administrator may then grant permission to create unprivileged user
namespaces by adding users to the
'uuns'
group.

OpenBSD 6.1 - May 22, 2017
