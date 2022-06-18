# diploma

# diploma
rare version 0.1

## How to use?
- get the repository
- run `diploma` to get reference:
    - place `diploma` file to any place from your `$PATH`
        - to execute, run `diploma`
    - or run from repo folder
        - to execute, run as regular script: `./diploma` 



## FAQ

### InvalidClientTokenId: The security token included in the request is invalid.
- Please make sure your creds are not faded by other environment variables. To do so, check `/etc/profile`, `~/.bash_profile`, `~/.bash_login`, `~/.profile` for replacing assignments, or run `diploma unset-creds` to see how to do one-time unset

### NoSuchBucket: The specified bucket does not exist
- Then we should check if bucket init completed. Try repeat `diploma apply`