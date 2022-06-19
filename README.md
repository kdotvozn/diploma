# diploma

## How to use?
- get the repository
- run `./diploma.sh install` to install the cli.

    - `/cli` script now is located at `/usr/local/bin` so you can use it just by running `diploma`
    - `/files` cli uses to work as expected are copied to `/usr/share/diploma`

    > the specified files can be deleted by `diploma uninstall`





## FAQ

### InvalidClientTokenId: The security token included in the request is invalid.
- Please make sure your creds are not faded by other environment variables. To do so, check `/etc/profile`, `~/.bash_profile`, `~/.bash_login`, `~/.profile` for replacing assignments, or run `diploma unset-creds` to see how to do one-time unset

### NoSuchBucket: The specified bucket does not exist
- Then we should check if bucket init completed. Try repeat `diploma apply`