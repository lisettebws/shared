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
newktd_nossh
```
if you aren't using ssh inside the shell. 
This is required for aliases and if you want to use git autocomplete with debranch

Custom functions and aliases are documented in comments.

They can be viewed once the file is sourced by running:

```
custom
```
This will print all functions and aliases

```
functions
```
This will print all functions

you can also view a full function but running 
```
readfunction
```
and typing in the function you want to use. 
