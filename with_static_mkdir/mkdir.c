#include <sys/stat.h>
#include <sys/types.h>
#include <stdio.h>

// This creates /tmp directory and removes /mkdir binary (itself) which did that
int main() {
  mkdir("/tmp", 0777);
  remove("/mkdir");
  return 0;
}
