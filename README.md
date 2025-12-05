These are designed to go in the koha/shared folder when using Koha Testing Docker.

When you first enter into the shell of koha testing docker, the first thing is to run:

```
source .shared/.custom_bash_commands.sh
```
followed by either:

```
newktd
```
if you're using ssh inside the shell and have a ssh file in your shared folder, or

```
    source shared/.bash_aliases && sudo /etc/cron.daily/plocate
```
if you're using aliases and want `locate` to work.
