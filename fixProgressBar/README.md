# FixProgressBar

This issue is caused Because whenever we try copying any file on linux, 

linux first copies that file into ram for a faster write and later kernel
writes it down to destination, but because of this the file explorer assumes
that file has already been copied and disappears inorder to solve this issue
you'll have to limit cache size so that only a certain chunk of file will be
cached and further won't be cached until copied to destination

**_To check the cache size **_

    cat /proc/sys/vm/dirty_bytes

if it prints 0 than that means it will copy the whole file 

## How to limit caching

- 1 mb = 1048576 bytes

**_Set Cache Size Variable**_

    export cache_size=desiredSizeInByte

**_Temporary Fix ( Revert After Restarts )**_

    sudo sh -c "echo '$cache_size' > /proc/sys/vm/dirty_bytes"

**_Permanent Fix ( Required Restarts )**_

    sudo sh -c "echo 'vm.dirty_bytes=$cache_size' >> /etc/sysctl.conf"

