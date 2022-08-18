#include <X11/Xlib.h>
#include <stdio.h>

int main() {
  Display *d = XOpenDisplay(NULL);
  if (d == NULL) {
    fprintf(stderr, "Failed to open display\n");
    return 1;
  }

  int s = DefaultScreen(d);
  Window w = XCreateSimpleWindow(d, RootWindow(d, s), 10, 10, 100, 100, 1,
                                 BlackPixel(d, s), BlackPixel(d, s));

  XSelectInput(d, w, ExposureMask);
  XMapWindow(d, w);

  while (1) {
    XEvent e;
    XNextEvent(d, &e);
    if (e.type == Expose) {
    }
  }

  XCloseDisplay(d);
  return 0;
}
