# RTSPServer

[![Build Status](https://travis-ci.org/kgbook/RTSPServer.svg?branch=dev)](https://travis-ci.org/kgbook/RTSPServer)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8fc58459dbaf486884713133d034b968)](https://www.codacy.com/app/kgbook/RTSPServer?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kgbook/RTSPServer&amp;utm_campaign=Badge_Grade)
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](https://github.com/kgbook/RTSPServer)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/kgbook/RTSPServer/master/LICENSE)

## Server

Push H.264/H.265 bitstream using live555.

## Client

Pull stream from RTSPServer using FFmpeg, support H.264/H.265 wrapper into MP4 container.

## Dependencies

- [FFmpeg](https://ffmpeg.org/)
- [live555](http://www.live555.com/)
- [spdlog](https://github.com/gabime/spdlog)
- [Boost](https://www.boost.org/) at least 1.66.0
- [fmt](https://github.com/fmtlib/fmt)
- [python](https://www.python.org/) 2.7 required
- [cmake](https://cmake.org/) 3.7 required
- pkg-config

## Build

- Assign `OFF` to `linux-cross` macro, if not cross compile,
  see [third_party/live555/CMakeLists.txt](third_party/live555/CMakeLists.txt).
- [fmt 5.3.0 version perhaps not work well on macOS 10.14.4](https://github.com/fmtlib/fmt/issues/1115),
  built as submodule if failed.

```shell
git submodule update --init --remote --recursive
chmod +x build.sh
bash build.sh
```

## Code Style

The project use automated checker named **cpplint** to make sure a C++ file
follows [Google's C++ styleguide](https://google.github.io/styleguide/cppguide.html).

False positives can be ignored by putting `// NOLINT` at the end of the line
or `// NOLINTNEXTLINE` in the previous line.