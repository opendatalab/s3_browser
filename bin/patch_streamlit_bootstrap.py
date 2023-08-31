import os

if __name__ == "__main__":
    home_dir = os.path.expanduser("~")
    virtualenvs = f"{home_dir}/.cache/pypoetry/virtualenvs/"
    for e in os.listdir(virtualenvs):
        boostrap_filepath = os.path.join(
            virtualenvs, e, "lib/python3.10/site-packages/streamlit/web/bootstrap.py"
        )

        with open(boostrap_filepath, "r") as f:
            content = f.read()
            content = content.replace(
                "url_util.print_url(url_name, url)",
                'url_util.print_url(url_name, url.replace("0.0.0.0", "127.0.0.1"))',
            )

        with open(boostrap_filepath, "w") as f:
            f.write(content)
