FROM duffn/python-poetry:3.10.11-slim-1.6.1-2023-08-21 as base

COPY poetry.lock pyproject.toml /s3_browser/
COPY s3_browser /s3_browser/s3_browser
COPY s3_browser_cli /s3_browser/s3_browser_cli
COPY README.md /s3_browser/README.md

WORKDIR /s3_browser
RUN poetry install --without dev

COPY bin/ s3_browser/bin
RUN python s3_browser/bin/patch_streamlit_bootstrap.py
# RUN cat /root/.cache/pypoetry/virtualenvs/s3-browser-cli-ANXh8YIg-py3.10/lib/python3.10/site-packages/streamlit/web/bootstrap.py

ENV PYTHONPATH "${PYTHONPATH}:/s3_browser/"
ENTRYPOINT ["poetry", "run", "streamlit", "run", "s3_browser/Welcome.py", "--server.port=8501", "--server.address=0.0.0.0", "--browser.gatherUsageStats=False"]