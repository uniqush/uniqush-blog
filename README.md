The Uniqush blog, published at [uniqush.org/blog](https://uniqush.org/blog/).

It is built with [Pelican](https://getpelican.com/) and the `tuxlite_tbs`
theme. `./main.sh` builds it in Docker and leaves the result in `output/`;
the site is served from the `blog/` directory of the
[uniqush-www](https://github.com/uniqush/uniqush-www) Pages site, so
publishing means copying `output/` there.

To build without Docker:

    pip install pelican markdown
    git clone https://github.com/getpelican/pelican-themes.git
    pelican-themes -i pelican-themes/tuxlite_tbs
    make html

Posts live in `src/` as Markdown with Pelican metadata headers; see any
existing post for the format.
