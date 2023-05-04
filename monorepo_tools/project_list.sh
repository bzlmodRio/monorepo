
LIBRARY_PROJECTS=(
    "libraries/bzlmodRio-apriltaglib"
    "libraries/bzlmodRio-imgui"
    "libraries/bzlmodRio-libssh"
    "libraries/bzlmodRio-ni"
    "libraries/bzlmodRio-opencv"

    "libraries/bzlmodRio-allwpilib"

    "libraries/bzlmodRio-ctre"
    "libraries/bzlmodRio-navx"
    "libraries/bzlmodRio-revlib"
)

RULES_PROJECTS=(
    "rules/rules_bazelrio"
    "rules/rules_bzlmodrio_toolchains"

    "rules/rules_checkstyle"
    "rules/rules_pmd"
    "rules/rules_spotless"
    "rules/rules_wpiformat"
)


PROJECTS=(
    "gentool"
    "bzlmodRio"
)

PROJECTS=("${PROJECTS[@]}" "${LIBRARY_PROJECTS[@]}" "${RULES_PROJECTS[@]}")
