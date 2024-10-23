FROM ubuntu AS builder
# We need GCC to build hello binary
RUN apt-get update -y && apt install -y gcc
ADD hello.c mkdir.c /
# We are compiling static "/hello" binary, so no libc is needed
RUN gcc -static -o /hello /hello.c && strip /hello
# This compiles static "mkdir" binary that will make /tmp directory in the final image without need of libc
RUN gcc -static -o /mkdir /mkdir.c && strip /mkdir

# Start from as small as possible (see helpers.txt where I was working on figuring out the minimal possible image)
FROM scratch
# FROM alpine
# FROM ubuntu
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /mkdir /mkdir
# We can't use "RUN" as it uses /bin/sh under the hood, and scratch image doesn't have /bin/sha nd we don't want to copy it
CMD ["/mkdir"]
COPY --from=builder /hello /HelloWorld
# for debugging: start
# COPY --from=builder /bin/sh /bin/sh
# COPY --from=builder /usr/bin/cat /usr/bin/cat
# COPY --from=builder /usr/bin/ls /usr/bin/ls
# COPY --from=builder /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
# COPY --from=builder /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
# COPY --from=builder /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libselinux.so.1
# COPY --from=builder /lib/x86_64-linux-gnu/libpcre2-8.so.0 /lib/x86_64-linux-gnu/libselinux.so.1
# for debugging: end
ENTRYPOINT ["/HelloWorld"]
# CMD ["/HelloWorld"]
# This results in 1.4 Mb image
