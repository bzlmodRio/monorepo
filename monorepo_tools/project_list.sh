
LIBRARY_PROJECTS=(
    "libraries/bzlmodRio-apriltaglib"
    "libraries/bzlmodRio-imgui"
    "libraries/bzlmodRio-libssh"
    "libraries/bzlmodRio-ni"
    "libraries/bzlmodRio-opencv"

    "libraries/bzlmodRio-allwpilib"

    "libraries/bzlmodRio-phoenix"
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
    "rules/rules_wpi_styleguide"
)


PROJECTS=(
    "gentool"
    "bzlmodRio"
    "bazel-central-registry"
)

PROJECTS=("${RULES_PROJECTS[@]}" "${PROJECTS[@]}" "${LIBRARY_PROJECTS[@]}" )
