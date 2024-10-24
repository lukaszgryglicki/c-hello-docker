# Usage

You need to be authenticated to docker and then run (I'm using `USR=lukaszgryglicki`):

- Build image (707kb size): `` USR=your-user-name ./build.sh ``.
- Run image: `` USR=your-user-name ./run.sh ``.
- Working example: `` USR=lukaszgryglicki ./run.sh ``.


# Cross compiling

- You need to know your target architecture tripple, for example: `aarch64-linux-gnu`, `arm-linux-gnueabi`, etc.
- Build image (707kb size): `` USR=your-user-name ./cross-build.sh aarch64-linux-gnu ``.
- To actually run it, you need a machine with target architecture (or quemu) and then run via: 
- `` docker run -it "lukaszgryglicki/c-hello-docker:aarch64-linux-gnu" ``. On host machine (where you are creating this) it gives:
```
root@darkstar:~/go/src/github.com/lukaszgryglicki/c-hello-docker# docker run -it "lukaszgryglicki/c-hello-docker:aarch64-linux-gnu"
exec /HelloWorld: exec format error
```
Which is expected.


# Questions

Please see `questions-and-answers.md` file (it is .gitignored).


# Technical details

- `Dockerfile` is used when building image for the current (non-cross) architecture.
- `Dockerfile.template` is used for cross-compilation - it contains `{{arch}}` markers which are replaced with architecture tripple, like `aarch64-linux-gnu`.
- See `docker.png` for an example build and run on linux amd64 arch.

# Version with static 'mkdir' binary


Please check `with_static_mkdir` directory: `Dockerfile`, `build.sh` and `run.sh` scripts.

I've dropped this solution as I cannot remove `/mkdir` static binary while running it, and that results in two binaries in the final image: `/HelloWorld` and `/mkdir` so it takes 1.41 Mb.

The final version is smaller
