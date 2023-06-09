def main():
    output = ""

    projects = [
        "bzlmodRio-allwpilib",
        "bzlmodRio-apriltaglib",
        "bzlmodRio-phoenix",
        "bzlmodRio-imgui",
        "bzlmodRio-libssh",
        "bzlmodRio-navx",
        "bzlmodRio-ni",
        "bzlmodRio-opencv",
        "bzlmodRio-revlib",
        "rules_bazelrio",
        "rules_bzlmodrio_toolchains",
        "rules_checkstyle",
        "rules_pmd",
        "rules_spotless",
        "rules_wpi_styleguide",
        "rules_wpiformat",

        "bzlmodRio",
    ]

    branch = "refactor_dev"

    for project in projects:
        output += f"{project}<br>\n"
        output += f'<a href="https://github.com/bzlmodRio/{project}/tree/{branch}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml/badge.svg?branch={branch}"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}/tree/{branch}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml/badge.svg?branch={branch}"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}/tree/{branch}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/auto_update.yml/badge.svg?branch={branch}"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}/tree/{branch}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/publish.yml/badge.svg?branch=2024.DUMMY"></a>\n'
        output += f"Main:"
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml/badge.svg"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml/badge.svg"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/auto_update.yml/badge.svg"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/publish.yml/badge.svg"></a>\n'
        output += "<br>"

    with open("/home/pjreiniger/git/bzlmodRio/monorepo/status.html", "w") as f:
        f.write(output)


if __name__ == "__main__":
    main()
