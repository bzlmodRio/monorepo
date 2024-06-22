#!/bin/python3


def write_html_page(projects, branch):
    output = ""

    for project in projects:
        output += f"{project}<br>\n"
        output += f'<a href="https://github.com/bzlmodRio/{project}/tree/{branch}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml/badge.svg?branch={branch}"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}/tree/{branch}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml/badge.svg?branch={branch}"></a>\n'
        output += f"Main:"
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml/badge.svg"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml/badge.svg"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/auto_update.yml/badge.svg"></a>\n'
        output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/publish.yml/badge.svg"></a>\n'
        output += "<br>"

    with open("/home/pjreiniger/git/bzlmodRio/monorepo/status.html", "w") as f:
        f.write(output)


def write_readme(projects, branch):
    output = ""

    output += f"## {branch}\n"
    output += "| Project | Build | Lint |\n"
    output += "| ------- | ----- | ---- |\n"

    for project in projects:
        output += f"| {project}"
        output += f'| <a href="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml/badge.svg?branch={branch}"></a>'
        output += f'| <a href="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml/badge.svg?branch={branch}"></a>'
        output += " |\n"


    output += f"## Main\n"
    output += "| Project | Build | Lint | Auto Update |\n"
    output += "| ------- | ----- | ---- | ----------- |\n"
        
    for project in projects:
        output += f"| {project}"
        output += f'| <a href="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/build.yml/badge.svg"></a>'
        output += f'| <a href="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/lint.yml/badge.svg"></a>'
        output += f'| <a href="https://github.com/bzlmodRio/{project}/actions/workflows/auto_update.yml"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/auto_update.yml/badge.svg"></a>'
        # output += f'<a href="https://github.com/bzlmodRio/{project}"><img src="https://github.com/bzlmodRio/{project}/actions/workflows/publish.yml/badge.svg"></a>'
        output += " |\n"

    with open("/home/pjreiniger/git/bzlmodRio/monorepo/README.md", "w") as f:
        f.write(output)


def main():

    projects = [
        "bzlmodRio-allwpilib",
        "bzlmodRio-apriltaglib",
        "bzlmodRio-choreo",
        "bzlmodRio-imgui",
        "bzlmodRio-libssh",
        "bzlmodRio-navx",
        "bzlmodRio-ni",
        "bzlmodRio-opencv",
        "bzlmodRio-pathplannerlib",
        "bzlmodRio-phoenix",
        "bzlmodRio-phoenix6",
        "bzlmodRio-photonlib",
        "bzlmodRio-revlib",

        "rules_bazelrio",
        "rules_bzlmodrio_jdk",
        "rules_bzlmodrio_toolchains",
        "rules_checkstyle",
        "rules_pmd",
        "rules_robotpy_utils",
        "rules_spotless",
        "rules_wpi_styleguide",
        "rules_wpiformat",

        "bzlmodRio",
    ]

    branch = "refactor_dev"


    write_html_page(projects, branch)
    write_readme(projects, branch)

if __name__ == "__main__":
    main()
