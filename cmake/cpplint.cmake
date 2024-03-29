# Copyright (C) 2013 Daniel Scharrer
#
# This software is provided 'as-is', without any express or implied
# warranty.  In no event will the author(s) be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
# 3. This notice may not be removed or altered from any source distribution.


# Copyright (C) 2014 Greg Horn
# In order to comply with the above copyright, I am noting that I took
# Daniel's script and hacked it a bit, mostly changing paths and filters

find_package(PythonInterp 2.7 REQUIRED)

set(STYLE_FILTER)

# disable unwanted filters
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/braces,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/semicolon,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/blank_line,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/comma,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/operators,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/parens,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/indent,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/comments,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/newline,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/tab,)
set(STYLE_FILTER ${STYLE_FILTER}-whitespace/ending_newline,)

set(STYLE_FILTER ${STYLE_FILTER}-build/include_order,)
set(STYLE_FILTER ${STYLE_FILTER}-build/namespaces,)
set(STYLE_FILTER ${STYLE_FILTER}-build/include_what_you_use,)
set(STYLE_FILTER ${STYLE_FILTER}-build/include,)
set(STYLE_FILTER ${STYLE_FILTER}-build/explicit_make_pair,)

set(STYLE_FILTER ${STYLE_FILTER}-readability/streams,)
set(STYLE_FILTER ${STYLE_FILTER}-readability/todo,)

set(STYLE_FILTER ${STYLE_FILTER}-runtime/references,)
set(STYLE_FILTER ${STYLE_FILTER}-runtime/int,)
set(STYLE_FILTER ${STYLE_FILTER}-runtime/explicit,)
set(STYLE_FILTER ${STYLE_FILTER}-runtime/printf,)

set(STYLE_FILTER ${STYLE_FILTER}-legal/copyright)

function(cpplint_check TARGET_NAME SOURCES_LIST)

    if(NOT PYTHONINTERP_FOUND)
        message(FATAL_ERROR "python not found!")
    endif()

    find_file(GOOGLE_CPP_LINT_PY NAMES cpplint.py PATHS ${CMAKE_SOURCE_DIR}/third_party/cpplint DOC "google cpp style scan program.")
    if (NOT GOOGLE_CPP_LINT_PY)
        message (FATAL_ERROR "cpplint.py not found!")
    endif()

    list(REMOVE_DUPLICATES SOURCES_LIST)
    list(SORT SOURCES_LIST)

    add_custom_target(${TARGET_NAME} ALL
            COMMAND "${CMAKE_COMMAND}" -E chdir
            "${CMAKE_CURRENT_SOURCE_DIR}"
            "${PYTHON_EXECUTABLE}"
            ${GOOGLE_CPP_LINT_PY}
            "--filter=${STYLE_FILTER}"
            "--counting=detailed"
            "--extensions=cpp,hpp,h"
            "--linelength=250"
            ${SOURCES_LIST}
            DEPENDS ${SOURCES_LIST}
            COMMENT "Linting ${TARGET_NAME}"
            VERBATIM)

endfunction()