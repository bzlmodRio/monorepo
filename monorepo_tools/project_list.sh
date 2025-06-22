
LIBRARY_PROJECTS=(
    "libraries/bzlmodRio-allwpilib"

    "libraries/bzlmodRio-phoenix"
    "libraries/bzlmodRio-phoenix6"
    "libraries/bzlmodRio-studica"
    "libraries/bzlmodRio-revlib"
    "libraries/bzlmodRio-photonlib"
    "libraries/bzlmodRio-pathplannerlib"
    "libraries/bzlmodRio-choreo"
)

RULES_PROJECTS=(
    "rules/rules_bazelrio"

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
