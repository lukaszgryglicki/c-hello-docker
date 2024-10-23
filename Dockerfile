FROM ubuntu AS builder
# We need GCC to build hello binary
RUN apt-get update -y && apt install -y gcc
ADD hello.c /
# We are compiling static "/hello" binary, so no libc is needed
RUN gcc -static -o /hello /hello.c && strip /hello
# This will be copied into traget as "/tmp" because target has no "mkdir" binary
RUN mkdir /mytmp && chmod ugo+rwx /mytmp

# Start from as small as possible (see helpers.txt where I was working on figuring out the minimal possible image)
FROM scratch
# requested passwd file from ubuntu
COPY --from=builder /etc/passwd /etc/passwd
# requested 0777 /tmp directory (without using mkdir binary)
COPY --from=builder /mytmp /tmp
# requested C program to be run (static so no libc is needed)
COPY --from=builder /hello /HelloWorld
# The final image size is 707kb
ENTRYPOINT ["/HelloWorld"]
# CMD ["/HelloWorld"]
