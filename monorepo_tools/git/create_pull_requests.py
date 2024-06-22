import sys
import requests

from github_token import GITHUB_API_KEY


def has_pr(project_name, branch_name):
    headers = {
        'Accept': 'application/vnd.github+json',
        'Authorization': f'Bearer {GITHUB_API_KEY}',
        'X-GitHub-Api-Version': '2022-11-28',
    }

    url = f'https://api.github.com/repos/bzlmodRio/{project_name}/pulls?head=bzlmodRio:{branch_name}'
    response = requests.get(url, headers=headers)
    response.raise_for_status()

    response_data = response.json()

    if response_data:
        return True
    return False


def create_pr(project_name, branch_name, title):
    print(f"Creating PR for project {project_name}, branch {branch_name} - Title: '{title}'")

    headers = {
        'Accept': 'application/vnd.github+json',
        'Authorization': f'Bearer {GITHUB_API_KEY}',
        'X-GitHub-Api-Version': '2022-11-28',
        'Content-Type': 'application/x-www-form-urlencoded',
    }

    data = f'{{"title":"{title}","body":"","head":"{branch_name}","base":"main"}}'

    data = str(data)

    url = f'https://api.github.com/repos/bzlmodRio/{project_name}/pulls'
    response = requests.post(url, headers=headers, data=str(data))
    response.raise_for_status()


def main(argv):
    project_name = argv[0]
    branch_name = argv[1]
    title = argv[2]

    if project_name.startswith("libraries"):
        project_name = project_name[10:]
        
    if project_name.startswith("rules"):
        project_name = project_name[6:]


    if not has_pr(project_name, branch_name):
        create_pr(project_name, branch_name, title)
    else:
        print(f"PR Already exists for {project_name}:{branch_name}")

if __name__ == "__main__":
    main(sys.argv[1:])