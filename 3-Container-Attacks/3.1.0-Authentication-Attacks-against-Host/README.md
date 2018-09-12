# Authentication Attacks against Host

---


    * A `non-root user` with access to docker can gain access to root filesystem of the host machine.


Step 1. Run `sudo su` to become root user. Create a `secret` file in `/root/` and write something in it.

    Screenshot here

Step 2. As `docker-user`(non-root user), reading the content of `/root/secret` file will not be possible.

    Screenshot here

Step 3. Run `docker run -ti -v /:/hostFS/ alpine` as `docker-user`(non-root user)

    Screenshot here

Step 4. Once inside the Alpine docker container, access `/hostFS/root/` and `docker-user`(non-root user) should be able to read the `secret` file.

    Screenshot here

Step 5. `docker-user` now has complete access to the root Filesystem of the host machine.

    Screenshot here

