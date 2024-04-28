import sys
import requests

from github_token import GITHUB_API_KEY


def main(argv):
    project_name = argv[0]
    branch_name = argv[1]
    title = argv[2]

    if project_name.startswith("libraries"):
        project_name = project_name[10:]

    print(f"Creating PR for project {project_name}, branch {branch_name} - Title: '{title}'")

    headers = {
        'Accept': 'application/vnd.github+json',
        'Authorization': f'Bearer {GITHUB_API_KEY}',
        'X-GitHub-Api-Version': '2022-11-28',
        'Content-Type': 'application/x-www-form-urlencoded',
    }

    data = f'{{"title":"{title}","body":"","head":"{branch_name}","base":"main"}}'

    data = str(data)

    response = requests.post(f'https://api.github.com/repos/bzlmodRio/{project_name}/pulls', headers=headers, data=str(data))
    # print(response)
    response.raise_for_status()
    # print(response.json())


if __name__ == "__main__":
    main(sys.argv[1:])